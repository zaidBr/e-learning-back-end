<?php

namespace App\Controller\Security;


use App\Entity\User;
use App\Repository\UserRepository;
use Doctrine\DBAL\Types\BooleanType;
use Symfony\Component\Mime\Address;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Validator\Validation;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\PropertyAccess\PropertyAccess;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use SymfonyCasts\Bundle\VerifyEmail\VerifyEmailHelperInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use SymfonyCasts\Bundle\VerifyEmail\Exception\VerifyEmailExceptionInterface;



/**
 * @Route("/api")
 */

class AuthController extends AbstractController
{
    private EmailVerifier $emailVerifier;
    
    public function __construct(
        private Security $security,
        private SerializerInterface $serializer,
        private UserRepository $userRepository,
        EmailVerifier $emailVerifier
        
    ){
        $this->emailVerifier=$emailVerifier;

    }

    /**
     * @Route("/register", name="app_register", methods={"POST"})
     */
    public function register(Request $request, VerifyEmailHelperInterface $verifyEmailHelper)
    {

        $jsonData=json_decode($request->getContent());
        $validator = Validation::createValidator();
        $lastName=$jsonData->lastName;
        $name=$jsonData->name;
        $email=$jsonData->email;
        $plainPassword=$jsonData->plainPassword;
        $confirmPlainPassword=$jsonData->confirmPlainPassword;
        $input=[
            'name'=>$name,
            'lastName'=>$lastName,
            'email'=>$email,
            'plainPassword'=>$plainPassword,
            'confirmPlainPassword'=>$confirmPlainPassword

        ];
        $constraints=new Assert\Collection([
            'name'=>new Assert\Length(['min'=>2]),
            'lastName'=>new Assert\Length(['min'=>2]) ,
            'email'=>new Assert\Email(),
            'plainPassword'=>new Assert\Length(['min'=>6]),
            'confirmPlainPassword'=>new Assert\EqualTo($plainPassword,message:"verifier votre saisit"),
        ]);


        $violation = $validator->validate($input,$constraints);


        if(count($violation) > 0){
            $errorsString = (string) $violation;
            return new JsonResponse([
                'message'=> "hoooops!! somthing wrongs",
                'errorsValidators' => $errorsString
        
        ]);
            
        }else
        {
            $user=$this->userRepository->create($jsonData);
            $signatureComponents = $verifyEmailHelper->generateSignature(
                'app_verify_email',
                $user->getId(),
                $user->getEmail(),
                ['id' => $user->getId()]
            );
            $this->emailVerifier->sendEmailConfirmation('app_verify_email', $user,
                (new TemplatedEmail())
                    ->from(new Address('zaidbouraoui995@gmail.com', 'ELern'))
                    ->to($user->getEmail())
                    ->subject('Veuillez confirmer votre email')
                    ->htmlTemplate('registration/confirmation_email.html.twig')
            );

            return new JsonResponse([
            // 'user'=>$this->serializer->serialize($user,'json'),
            'message'=>"vous êtes inscrit avec succès" 
        ]);

        }

    }

    /**
     * @Route("/verify/email", name="app_verify_email")
     */
    public function verifyUserEmail(Request $request,VerifyEmailHelperInterface $verifyEmailHelper, UserRepository $userRepository,  EntityManagerInterface $entityManager): Response
    {
        // validate email confirmation link, sets User::isVerified=true and persists
        $user = $userRepository->find($request->query->get('id'));
        if (!$user) {
            throw $this->createNotFoundException();
        }
        try {
            $verifyEmailHelper->validateEmailConfirmation(
                $request->getUri(),
                $user->getId(),
                $user->getEmail(),
            );
        } catch (VerifyEmailExceptionInterface $e) {
            $this->addFlash('error', $e->getReason());
            return $this->redirectToRoute('app_register');
        }

        $user->setIsVerified(true);
        $entityManager->flush();

       
        return $this->redirect('http://127.0.0.1:4200/auth/login;verified=1');
    }

    /**
     * @Route("/public/is-verified/{email}", methods={"GET"})
     */
    public function getCurrentUser($email,SerializerInterface $serializer,UserRepository $userRepository)
    {
        $user = $userRepository->findOneBy(['email'=>$email]);
        if(!$user){
            $this->createNotFoundException('aucune utilisateur avec cet id');
        }
        if($user->getIsVerified()){
            return new JsonResponse(['result'=>'verif']);
        }else
            return new JsonResponse(['result'=>'notVerif']);
        
    }


    /**
     * @Route("/logout",name="logout")
     */
    public function logout()
    {
        throw new \Exception('logout() should never be reached');

    }

}
