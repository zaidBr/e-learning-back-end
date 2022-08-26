<?php

namespace App\Controller\formateur;

use App\Entity\Fichier;
use App\Entity\Chapitre;
use App\Entity\Document;
use App\Entity\Formation;
use App\Entity\Group;
use App\Entity\Quizz;
use App\Entity\Video;
use App\Entity\VideoConfernce;
use App\Service\ImportFichier;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\SerializerInterface;

/**
* @Route("/api/")
*/
class GestionChapitreController extends AbstractController
{
    /**
     * @Route("formateur/add/chapter/{id}", methods={"POST"})
     */
    public function addChapter(Formation $formation,Request $request, ManagerRegistry $doctrine ){
        $em = $doctrine->getManager();
        $json_data = json_decode($request->getContent());
        $chapter = new Chapitre();
        $chapter->setName($json_data->name)
                ->setFormation($formation);
        $em->persist($chapter);
        $em->flush();
        return new JsonResponse(
            'succes',
            200
        );
    }

    /**
     * @Route("formateur/add/file/{id}", methods={"POST"})
     */
    public function addFile(Chapitre $chapter, Request $request,ManagerRegistry $doctrine,ImportFichier $importFichier){
        $em = $doctrine->getManager();
        $file = new Fichier();
        /** @var UploadedFile $uploadedFile */
        $uploadedFile = $request->files->get('file');
        $fileName = $importFichier->uploadFileF($uploadedFile);
        $file->setTitle($request->get('title'))
             ->setDescription($request->get('description'))
             ->setFilePath($fileName)
             ->setChapitre($chapter);
        $em->persist($file);
        $em->flush();
        return new JsonResponse(
            'succes',
            200
        );
    }

    /**
     * @Route("formateur/add/video/{id}", methods={"POST"})
     */
    public function addVideo(Chapitre $chapter, Request $request,ManagerRegistry $doctrine,ImportFichier $importFichier){
        $em = $doctrine->getManager();
        $video = new Video();
        /** @var UploadedFile $uploadedFile */
        $uploadedFile = $request->files->get('video');
        $fileName = $importFichier->uploadVideoF($uploadedFile);
        $video->setUrlVideo($fileName)
              ->setTitle($request->get('title'))
              ->setChapitre($chapter);
        $em->persist($video);
        $em->flush();
        return new JsonResponse(
            'succes',
            200
        );
    }

    /**
     * @Route("formateur/add/quiz/{id}", methods={"POST"})
     */
    // public function addQuiz(Chapitre $chapter, Request $request,ManagerRegistry $doctrine){
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
    //          ->setQuestion($json_data->question)
    //          ->setChapitre($chapter);
    //          $em->persist($quiz);
    //          $em->flush();
    //     $em->persist($quiz);
    //     $em->flush();
    //     return new JsonResponse(
    //         'succes',
    //         200
    //     );
    // }
    

    /**
     * @Route("formateur/add/document/{id}", methods={"POST"})
     */
    public function addDoc(Chapitre $chapter, Request $request,ManagerRegistry $doctrine){
        $json_data = json_decode($request->getContent());
        $em = $doctrine->getManager();
        $document = new Document();
        $document->setText($json_data->text)
                 ->setChapitre($chapter);
        $em->persist($document);
        $em->flush();
        return new JsonResponse(
            'succes',
            200
        );
    }

    /**
     * @Route("public/get/chapters/{id}", methods={"GET"})
     */
    public function getChapters(Formation $formation,SerializerInterface $serializer,ManagerRegistry $doctrine ){
        $em = $doctrine->getManager();
        $chapters = $em->getRepository(Chapitre::class)->findBy(["formation"=>$formation]);
        $totalNbChapter =$formation->getNbChapter();
        $actualNbChapter= count($formation->getChapitres());
        return new Response(
            
            $serializer->serialize($chapters,'json',["groups"=>['chapters']]),
            200,
            ['Content-type'=>'application/json']
            
            );
    }
    /**
     * @Route("public/get/chapter/{id}", methods={"GET"})
     */
    public function getChapter(Chapitre $Chapter,SerializerInterface $serializer,ManagerRegistry $doctrine){
        $em = $doctrine->getManager();
        $chapter = $em->getRepository(Chapitre::class)->find($Chapter);
        return new Response(
            
            $serializer->serialize($chapter,'json',["groups"=>['chapterContent']]),
            200,
            ['Content-type'=>'application/json']
            
            );
    }

    /**
     * @Route("get/url-conference/{id}", methods={"GET"})
     */
    public function getVidConference(Formation $formation,ManagerRegistry $doctrine){

        $em = $doctrine->getManager();
        /** @var \App\Entity\User $student */
        $student = $this->getUser();
        if($formation->getType() === 'online'){
            $groupes = $em->getRepository(Group::class)->findBy(['formation'=>$formation]);
          
            foreach ($groupes as $gr ) {
                if($gr->getUsers()->contains($student)){
                    $group = $gr;
                    $urlVideoConfernce = $group->getMeeting();
                    return new JsonResponse(['url'=>$urlVideoConfernce->getUrlMeeting()]);

                    break;
                }
            }
            
        }
        return new JsonResponse(['url'=>'empty']);


        }


}
