<?php

namespace App\Controller\admin;

use App\Entity\Formation;
use Exception;
use App\Entity\User;
use App\Repository\FormationRepository;
use App\Service\ImportFichier;
use App\Repository\UserRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;


/**
 * @Route("/api")
 */
class GestionFormateurController extends AbstractController
{
    public function __construct(
        public ImportFichier $fileupload,
        private UserPasswordHasherInterface $passwordHasher,
        private FormationRepository $formationRepository
    )
    {

    }
    /**
     * @Route("/public/formateur", methods={"GET"})
     */
    public function getAllFormateurs( UserRepository $userRepository,SerializerInterface $serializer) 
    {
        $formateurs = $userRepository->getByRole('formateur');
        if(!$formateurs){
            throw $this->createNotFoundException(
                'aucun formateur existe!'
            );
        }
        return new Response(
            $serializer->serialize($formateurs,'json',['groups'=>['formateur']]),
            200,
            ['Content-Type'=>'application/json']
        );
    }

    /**
     * @Route("/admin/add/formateur", methods={"POST"})
     */
    public function addFormateur(Request $request,ManagerRegistry $doctrine) : JsonResponse
    {
        
        $data = $request; 
        $user = new User();
        $em = $doctrine->getManager();
        $user->setLastName($data->get('lastName'));
        $user->setName($data->get('name'));
        /** @var UploadedFile $uploadedFile */
        $uploadedFile = $data->files->get('file');
        $fileName = $this->fileupload->uploadImageUser($uploadedFile);
        $user->setImage($fileName);
        $f= $em->getRepository(User::class)->findBy(["email"=>$data->get('email')]);
        if($f){
            throw new Exception('mail deja exist',409);
        }
        $user->setEmail($data->get('email'));
        $user->setPhoneNbre($data->get('phone'));
        $user->setDescription($data->get('description'));
        $user->setRoles(['ROLE_FORMATEUR']);
        $plainPass= $data->get('plainPassword');

        $hashedPassword=$this->passwordHasher->hashPassword($user, $plainPass);
        $user->setPassword($hashedPassword);
        $em->persist($user);
        $em->flush();
        return new JsonResponse([
            'formateur est créer avec succés',
        ]);
    }
    /**
     * @Route("/admin/delete/formateur/{id}", methods={"DELETE"})
     */
    public function delete(User $formateur,ManagerRegistry $doctrine){
        $em = $doctrine->getManager();
        $em->remove($formateur);
        $em->flush();
        return new Response(
            'deleted',
            200,
            ['Content-type'=> 'application/json']
        );
    }

    /**
     * @Route("/admin/desactivate/formateur/account/{id}", methods={"PUT"})
     */
    public function desactivateAccount(User $formateur,ManagerRegistry $doctrine){
        $em = $doctrine->getManager();
        $formateur->setIsVerified(false);
        $em->flush();
        return new Response('success',200);

    }

    /**
     * @Route("/activate/formateur/account/{id}", methods={"PUT"})
     */
    public function AcivateAccount(User $formateur,ManagerRegistry $doctrine){
        $em = $doctrine->getManager();
        $formateur->setIsVerified(true);
        $em->flush();
        return new Response('success',200);

    }

    /**
     * les formation qui presente un formateur
     * @Route("/formateur/my/formation", methods={"GET"})
     */
    public function showAllForFormateur(SerializerInterface $serializer,ManagerRegistry $doctrine){
        /** @var \App\Entity\User $formateur */
        $em = $doctrine->getManager();
        $formateur = $this->getUser();
        if(in_array("ROLE_FORMATEUR",$formateur->getRoles())){

            $formations = $this->formationRepository->findBy(['formateur' => $formateur,'session_is_oppen'=>true]);
        }
        if(!$formations){
            throw $this->createNotFoundException(
                'aucune Formation existe pour votre session!'
            );
        }
        // $evaluations = $this->formationRepository->maxMinRate();
        // $minEvaluation = $formations[0];
        // dd($minEvaluation->getEvaluations()[0]->getId());
        // foreach($formations as $formation){
        //     if($formation < $minEvaluation){
        //         $minEvaluation=$formation;
        //     }
        // }
        // $maxEvaluation = $formations[0]->getEvaluations();
        // foreach($formations as $formation){
        //     if($formation > $maxEvaluation){
        //         $maxEvaluation=$formation;
        //     }
        // }
        $myFormations =  $serializer->serialize($formations,'json',['groups'=>['formateurData']]);
        // dd($myFormations);
        
        return new Response(
            $myFormations,
            200,
            ['Content-type'=>'application/json']
        );
    }
    /**     
     * @Route("/formateur/my/formation/{id}", methods={"GET"})
     */
    public function showOneForFormateur(Formation $formation,SerializerInterface $serializer){
        return new Response(
            $serializer->serialize($formation,'json',['groups'=>['formateurData']]),
            200,
            ['Content-Type'=>'application/json']
        );
    }

    /**
     * @Route("/formateur/poppular", methods={"GET"})
     */
    public function poppularForamteur(UserRepository $userRepository){
        $poppular = $userRepository->bestFormateur();
        return new JsonResponse($poppular);
    }

    /**
     * @Route("/formateur/rates", methods={"GET"})
     */
    public function currentFormateur(UserRepository $userRepository){
        /** @var \App\Entity\User $currentUser */
        $currentUser = $this->getUser();
        $rate = $userRepository->rateFormateur($currentUser->getId());
        $nbCours = $userRepository->myAllCourses($currentUser->getId());
        $nbAndName = $userRepository->myActualCourses($currentUser->getId());
        return new JsonResponse([$rate,$nbCours,$nbAndName]);
    }
}
