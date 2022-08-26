<?php

namespace App\Controller;

use App\Service\ImportFichier;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Serializer\SerializerInterface;

class ProfileController extends AbstractController
{
    public function __construct(
        private ImportFichier $uploadImage,
        private SerializerInterface $serializer,
        private UserPasswordHasherInterface $passwordHasher)
    {
        
    }
    /**
     * @Route("/api/profile/modify", methods={"POST"})
     */
    public function profileUser(Request $request, ManagerRegistry $doctrine){
        $em = $doctrine->getManager();
        /** @var \App\Entity\User $currentUser */
        $currentUser = $this->getUser();
        $currentUser->setCin($request->get('cin')) 
                    ->setLocation($request->get('location'))
                    ->setPhoneNbre($request->get('phone'))
                    ->setName($request->get('name'))
                    ->setLastName($request->get('lastName'))
                    ->setAge($request->get('age')); 
                    if($request->get('plainPassword')){
                        $plainPass= $request->get('plainPassword');
                        $hashedPassword=$this->passwordHasher->hashPassword($currentUser, $plainPass);
                        if($this->passwordHasher->isPasswordValid($currentUser,$request->get('actulaPass'))){
                            $currentUser->setPassword($hashedPassword);
                        }else{
                            return new Response(
                                'failed',
                                400,
    
                            );
                        }
                    }
                    
                    
                    if($request->files->get('file')){
                         /** @var UploadedFile $uploadedFile */
                            $uploadedFile = $request->files->get('file');
                            $fileName = $this->uploadImage->uploadImageUser($uploadedFile);
                            $currentUser->setImage($fileName);
                    }else{
                        $currentUser->setImage($currentUser->getImage()); 
                    }
               
                $em->flush($currentUser);
                return new JsonResponse([
                    'message' => 'Votre Profile est modifié avec succée'
                    
                ]);     
    }
    /** 
     * @Route("/api/current/user", methods={"GET"})
     */
    public function getInfoCurrntUser(){
        /** @var \App\Entity\User $currentUser */
        $currentUser = $this->getUser();
        $infos = $this->serializer->serialize($currentUser,'json',['groups'=>['currentUser']]);
        return new Response(
            $infos,
            200,
            ['Content-Type'=>'application/json']
        );

    }

//     /**
//      * @Route("/api/test/of/pass", methods={"GET"})
//      */
//     public function testtes(){
//         /** @var \App\Entity\User $currentUser */
//         $currentUser = $this->getUser();
//         dd($currentUser->getPassword());
//     }
}
