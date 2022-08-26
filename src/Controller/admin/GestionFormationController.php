<?php

namespace App\Controller\admin;

use App\Entity\Calenderier;
use Exception;
use App\Entity\User;
use App\Entity\Group;
use App\Entity\Paiement;
use App\Entity\Categorie;
use App\Entity\Formation;
use App\Entity\VideoConfernce;
use App\Service\ImportFichier;
use App\Repository\FormationRepository;
use DateTime;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Security\Core\Security as Secur;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;





/**
 * @Route("/api")
 */
class GestionFormationController extends AbstractController
{
    public function __construct(
        public FormationRepository $formationRepository,
        public ImportFichier $fileupload,
        private Secur $security
    )
    {
    }


    /**
     * @Route("/public/formation",  methods={"GET"})
     */
    public function showPublicFormation(SerializerInterface $serializer)
    {
        // $formations=$this->formationRepository->publicShow();
        $formations = $this->formationRepository->findAll();
        if(!$formations)
        {
            throw $this->createNotFoundException(
                'aucune Formation existe!'
            );
        }
        return new Response(
                  $serializer->serialize($formations,'json',['groups'=>['public']]),
                  200,
                  ['Content-Type'=>'application/json']
        );
    }

    /**
     * @Route("/public/some/formation/{id}",  methods={"GET"})
     */
    public function showSomeData(Formation $formation, SerializerInterface $serializer)
    {
        return new Response(
                  $serializer->serialize($formation,'json',['groups'=>['someData']]),
                  200,
                  ['Content-Type'=>'application/json']
        );
    }

    // /**
    //  * les formation qui presente un formateur
    //  * @Route("/show/formation/for/formateur", methods={"GET"})
    //  */
    // public function showForFormateur(SerializerInterface $serializer){
    //     $formations=array();
    //     /** @var \App\Entity\User $formateur */
    //     $formateur = $this->getUser();
    //     if(in_array("ROLE_FORMATEUR",$formateur->getRoles())){
    //         $formateur_id = $formateur->getId();
    //         $formations[] = $this->formationRepository->findBy(['formateur' => $formateur_id]);
    //     }
    //     if(!$formations){
    //         throw $this->createNotFoundException(
    //             'aucune Formation existe pour votre session!'
    //         );
    //     }
    //     return new JsonResponse([
    //         'formations' => $serializer->serialize($formations,'json',['groups'=>['formateurData']]),
    //     ]);
    // }


    /**
     * @Route("/public/formation/{id}", methods={"GET"},requirements={"id"="\d+"})
     */
    public function details(Formation $formation,SerializerInterface $serializer):JsonResponse
    {
        if(!$formation)
        {
            throw $this->createNotFoundException(
                'aucune formation avec se id  existe!'
            );
        }
        return  new JsonResponse([
            'formation'=> $serializer->serialize($formation,'json',['groups'=>['details']])
        ]);
    }

    /**
     * @Route("/public/formation/{type}", methods={"GET"}, requirements={"type"="[a-zA-Z]+"})
     */
    public function showByType($type,SerializerInterface $serializer):Response
    {
        $formations = $this->formationRepository->getFormationByType($type);
        return new Response(
                     $serializer->serialize($formations,'json',['groups'=>['public']]),
                     200,
                     ['Content-Type'=>'application/json']
        );
    }

    /**
     * @Route("/admin/formation/{id}/{formateurid}", name="add_formation", methods={"POST"})
     * @Security("is_granted('ROLE_ADMIN')", message="désolé, vous n'êtes pas autorisé")
     */
    public function addFormation($id,Request $request,
    ManagerRegistry $doctrine,
    $formateurid,
    )
    {
        // $json_data = json_decode($request->getContent());
        $formation = new Formation();
        $em = $doctrine->getManager();
        $this->denyAccessUnlessGranted('ROLE_FORMATEUR');
        $formateur=$em->getRepository(User::class)->find($formateurid);
        $categorie = $em->getRepository(Categorie::class)->find($id);
        $formation->setName($request->get('name'))
                  ->setDescription($request->get('description'))
                  ->setSpecification($request->get('specification'))
                  ->setType($request->get('type'))
                  ->setDateStart($request->get('dateStart'))
                  ->setPrice($request->get('price'))
                  ->setNbChapter($request->get('nbChapter'))
                  ->setShortDescription($request->get('shortDescription'));
                //   if($request->headers->get('Content-type') === 'application/json'){
                //     $file = $request->file;                    
                // }
                /** @var UploadedFile $uploadedFile */
                $uploadedFile = $request->files->get('file');
                $fileName = $this->fileupload->uploadFile($uploadedFile);
                  $formation->setImage($fileName);
                  $formation->setPeriode($request->get('periode'));
                  $formation->setCategorie($categorie);
                  if(in_array("ROLE_FORMATEUR",$formateur->getRoles())){
                    $formation->setFormateur($formateur);
                }else{
                    throw new Exception(
                        "the role of the input formateur_id must be 'ROLE_FORMATEUR'"
                    );
                }
       $em->persist($formation);
       $em->flush();

       return new JsonResponse([
           'message' => 'formation été ajouté avec succés'
           
       ]);             
    }
    /**
     * @Route("/admin/edit/formation/{id}", methods={"GET","HEAD"})
     */
    public function edit(Formation $formation,SerializerInterface $serializer){
        return new Response(
            $serializer->serialize($formation,'json',['groups'=>['public']]),
            200,
            ['Content-Type'=>'application/json']
        );
    }

    /**
     * @Route("/admin/update/formation/{id}", methods={"PUT"})
     * @Security("is_granted('ROLE_ADMIN')", message="désolé, vous n'êtes pas autorisé")
     */
    public function updateFormation(Formation $formation,Request $request, ManagerRegistry $doctrine){
        $data = json_decode($request->getContent());

        $em = $doctrine->getManager();
        $categorie = $em->getRepository(Categorie::class)->find($data->categorieId);    
        $formateur= $em->getRepository(User::class)->find($data->formateurId);
        $formation->setName($data->name)
        ->setDescription($data->description)
        ->setType($data->type)
        ->setDateStart($data->dateStart)
        ->setSpecification($data->specification)
        ->setPrice($data->price)
        ->setNbChapter($data->nbChapter)
        ->setShortDescription($data->shortDescription)
                ->setCategorie($categorie)
                ->setFormateur($formateur);
                //    /** @var UploadedFile $uploadedFile */
                //    $uploadedFile = $request->files->get('file');
                //    $fileName = $this->fileupload->uploadFile($uploadedFile);
                //      $formation->setImage($fileName);
                  $formation->setPeriode($data->periode);
                $em->flush();
                return new JsonResponse([
                    'message'=>'formation est modifier avec succés'
                ]);         
    }

    /**
     * @Route("/admin/formation/{id}", name="edit_formation", methods={"DELETE"})
     * @Security("is_granted('ROLE_ADMIN')", message="désolé, vous n'êtes pas autorisé")
     */
    public function deleteFormation(Formation $formation,ManagerRegistry $doctrine):JsonResponse
    {
        $em = $doctrine->getManager();
        $em->remove($formation);
        $em->flush();
        return new JsonResponse([
            'success'=>"Formation est supprimer avec succés"
        ]);
    }



    // controle la visibilisté
    /**
     * @Route("/formateur/controle/visibility/{id}", methods={"PUT"})
     * @Security("is_granted('ROLE_FORMATEUR')", message="désolé, vous n'êtes pas autorisé")
     */
    public function MakeItVisible(ManagerRegistry $doctrine,Formation $formation){
        $em = $doctrine->getManager();
        if(!$formation){
            throw $this->createNotFoundException(
                'aucune formation avec se id  existe!'
            );
        }
        $formation->setIsVisible(!$formation->getIsVisible());
        $em->flush();
        return new JsonResponse([
            'edited'
        ]);
    }

    // controle la session
    /**
     * @Route("/admin/controle/session/{id}", methods={"PUT"})
     * @Security("is_granted('ROLE_ADMIN')", message="désolé, vous n'êtes pas autorisé")
     */
    public function controleSession(ManagerRegistry $doctrine, Formation $formation){
        $em = $doctrine->getManager();
        if($formation->getSessionIsOppen()==true){
            $formation->setSessionIsOppen(!$formation->getSessionIsOppen());
            $message='la session est fermé';
        }else{
            $formation->setSessionIsOppen(!$formation->getSessionIsOppen());
            $message='la session est ouvert';
        }
        $em->flush();
        return new JsonResponse([
            'message'=>$message
        ]);
    }


    // /**
    //  * @Route("/formateur/video/{id}", methods={"POST"})
    //  * @Security("is_granted('ROLE_FORMATEUR')", message="désolé, vous n'êtes pas autorisé")
    //  */
    // public function addVideo(Formation $formation,Request $request,ManagerRegistry $doctrine):JsonResponse
    // {
    //     $json_data = json_decode($request->getContent());
    //     $em = $doctrine->getManager();
    //     $video = new Video();
    //     $video->setDocument($json_data->document)
    //           ->setTitle($json_data->title)
    //           ->setFormation($formation);
    //         //   $newVideo = $importVideo->uploadVideo($json_data->pathVideo);
    //           $video->setUrlVideo($json_data->pathVideo);
    //           $formation->addVideo($video);
    //           $em->persist($video);
    //           $em->flush();
    //           return new JsonResponse([
    //               'message' => "le video est bien ajouté"
    //           ]);
    // }



    // /**
    //  * @Route("/formateur/quizz/{id}", methods={"POST"})
    //  * @Security("is_granted('ROLE_FORMATEUR')", message="désolé, vous n'êtes pas autorisé")
    //  */
    // public function addQuizz(Formation $formation,Request $request,ManagerRegistry $doctrine):JsonResponse
    // {
    //     $json_data = json_decode($request->getContent());
    //     $em = $doctrine->getManager();
    //     $quiz = new Quizz();
    //     $quiz->setTitle($json_data->title)
    //          ->setCorrectAnswer($json_data->correctAnswer)
    //          ->setChoiseOne($json_data->choiseOne)
    //          ->setChoiseTwo($json_data->choiseTwo)
    //          ->setChoiseThree($json_data->choiseThree)
    //          ->setChoiseFor($json_data->choiseFor)
    //          ->setChoiseFive($json_data->choiseFive)
    //          ->setTimePerQuestion($json_data->timePerQuestion)
    //          ->setQuestion($json_data->question);
    //          $formation->addQuizz($quiz);
    //          $em->persist($quiz);
    //          $em->flush();
    //          return new JsonResponse([
    //             'message' => "le quizz est bien ajouté"
    //         ]);
    // }


    // /**
    //  * @Route("/formateur/file/{id}", methods={"POST"})
    //  * @Security("is_granted('ROLE_FORMATEUR')", message="désolé, vous n'êtes pas autorisé")
    //  */
    // public function addFile(Formation $formation,Request $request,ManagerRegistry $doctrine,ImportFichier $importFichier):JsonResponse
    // {
    //     $json_data = json_decode($request->getContent());
    //     $em = $doctrine->getManager();
    //     $file = new Fichier();
    //     $file->setTitle($json_data->title)
    //          ->setDescription($json_data->description);
    //     $newFile = $importFichier->uploadFileF($json_data->pathFile);

    //     $file->setFilePath($newFile);
    //     $formation->addFile($file);
    //     $em->persist($file);
    //     $em->flush();
    //     return new JsonResponse([
    //         'message' => "le fichier est bien ajouté"
    //     ]);

    // }


    /**
     * @Route("/admin/group/{id}", methods={"POST"})
     * @Security("is_granted('ROLE_ADMIN')", message="désolé, vous n'êtes pas autorisé")
     */
    public function addGroup(Formation $formation,Request $request,ManagerRegistry $doctrine):JsonResponse
    {
        if(!$this->security->isGranted('ROLE_ADMIN')){
            throw new Exception("non autoriser");
        }
        $json_data = json_decode($request->getContent());
        $em = $doctrine->getManager();
        $group = new Group();
        $group->setName($json_data->name)
              ->setMaxSize($json_data->maxSize);
        $formation->addGroup($group);
        $em->persist($group);
        $em->flush();

        return new JsonResponse([
            'message' => "le groupe est bien ajouté"
        ]);
    }

    /**
     * @Route("/admin/meeting/{id}", methods={"POST"})
     * @Security("is_granted('ROLE_ADMIN')", message="désolé, vous n'êtes pas autorisé")
     */ 
    public function addMeeting(Group $group,Request $request,ManagerRegistry $doctrine){
        if(!$this->security->isGranted('ROLE_ADMIN')){
            throw new Exception("non autoriser");
        }
        $json_data = json_decode($request->getContent());
        $em = $doctrine->getManager();
        $meeting = new VideoConfernce();
        $meeting->setTitle($json_data->title)
              ->setUrlMeeting($json_data->meetingUrl);
        $meeting->setGroupp($group);
        $em->persist($meeting);
        $em->flush();
        return new JsonResponse([
            'message' => "le meeting est bien ajouté"
        ]);
    }
    
    



    /**
     * @Route("/formateur/calender/{id}", methods={"POST"})
     */
    public function AddCalender(Formation $formation,Request $request ,ManagerRegistry $doctrine){
        $em = $doctrine->getManager();
        $json_data = json_decode($request->getContent());
        $calender_date = new Calenderier();
        $calender_date->setTitle($json_data->title);
        $start =new DateTime($json_data->start);
        $calender_date->setStart($start)
                      ->setFormation($formation);
        $em->persist($calender_date);
        $em->flush();
        return new JsonResponse(
            'added',
            200,
        );


    }

    // /**
    //  * @Route("/formateur/calender/{id}", methods={"PUT"})
    //  */
    // public function EditCalender(Calenderier $calender_date,Request $request ,ManagerRegistry $doctrine){
    //     $em = $doctrine->getManager();
    //     $json_data = json_decode($request->getContent());
    //     $start =new DateTime($json_data->start);
    //     $calender_date->setTitle($json_data->title)
    //                   ->setStart($start);
    //     $em->flush();
    //     return new Response(
    //         'edited',
    //         200,
    //         ['Content-type'=> 'application/json']
    //     );


    // }

    // /**
    //  * @Route("/formateur/calender/{id}",  methods={"DELETE"})
    //  * @Security("is_granted('ROLE_FORMATEUR')", message="désolé, vous n'êtes pas autorisé")
    //  */
    // public function deleteCalender(Calenderier $calender_date,ManagerRegistry $doctrine):Response
    // {
    //     $em = $doctrine->getManager();
    //     $em->remove($calender_date);
    //     $em->flush();
    //     return new Response(
    //         'deleted',
    //         200,
    //         ['Content-type'=> 'application/json']
    //     );
    // }
    // /**
    //  * Route("/formateur/get/calender/{id}", methods={"GET"})
    //  */
    // public function getCalender(Formation $formation,ManagerRegistry $doctrine, SerializerInterface $serializer):Response
    // {
    //     $em = $doctrine->getManager();
    //     $calender = $em->getRepository(Calenderier::class)->findBy(['formation'=>$formation]);
    //     $data_calender = $serializer->serialize($calender,'json',['groups'=>['calender']]);
    //     return new Response(
    //         $data_calender,
    //         200
    //     );
    // }
    

    /**
     * @Route("/profil/subscribes", methods={"GET"})
     */
    public function subscribesFormation(ManagerRegistry $doctrine, SerializerInterface $serializer){
        $em = $doctrine->getManager();
        /** @var \App\Entity\User $candidat */
        $candidat = $this->getUser();
        $paymentsValidate = $em->getRepository(Paiement::class)->findBy(["customer"=>$candidat,"is_payed"=>true]);
        if(!$paymentsValidate){
            throw $this->createNotFoundException(
                "aucune formation vous etes en cours de suivie"
            );
        }
        $subscribeFormation=array();
        foreach($paymentsValidate as $paymentValid){
            $subscribeFormation[]=$paymentValid->getOrdre();
        }

        foreach($subscribeFormation as $subFormation){
            $videos=$subFormation->getVideos();
            $quizs=$subFormation->getQuizzs();
            $files=$subFormation->getFiles();
            $formation=$subFormation;
            $meeting=$subFormation->getMeeting();
            // $group = $em->getRepository(Group::class)->findOneBy(["formation"=>$subFormation,"users"=>$candidat ]);
            // $freinds=$group->getUsers();
            // $message=$group->getMessages();
            return new JsonResponse([
                "formation"=> $serializer->serialize($formation,'json',['groups'=>['subscribe']]),
                "videos"=> $serializer->serialize($videos,'json',['groups'=>['subscribeQui']]),
                "quizs"=>$serializer->serialize($quizs,'json',['groups'=>['subscribeVideo']]),
                "files"=>$serializer->serialize($files,'json',['groups'=>['subscribefile']]),
                "meeting"=>$meeting,
                // "freinds"=>$freinds,
                // "message"=>$message
            ]);
        }

        
    }

    /**
     * @Route("/public/poppular/foramtion", methods={"GET"})
     */
    public function poppularFormation(){
            $poppular =$this->formationRepository->bestFormation();
            return new JsonResponse($poppular);
    }
    /**
     * @Route("/public/rate/cours/{id}", methods={"GET"})
     */
    public function rateFormation(Formation $formation ){
        $rate = $this->formationRepository->currentRatePercentage($formation->getId());
        return new JsonResponse($rate);
    }
}

