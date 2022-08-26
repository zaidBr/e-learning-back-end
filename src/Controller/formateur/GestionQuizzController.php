<?php

namespace App\Controller\formateur;

use App\Entity\ChoiseAnswer;
use App\Entity\Quiz;
use App\Entity\Formation;
use Doctrine\ORM\EntityManager;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Serializer\SerializerInterface;

/**
 * @Route("/api/")
 */
class GestionQuizzController extends AbstractController
{

   /**
    * @Route("add/question/{id}", methods={"POST"})
    */
    public function addQuestion(Formation $formation, Request $request, ManagerRegistry $doctrine){
        if(!$formation){
            throw $this->createNotFoundException("aucune formation");
        }
        $em = $doctrine->getManager();
        $data = json_decode($request->getContent());
        $question = new Quiz();
        $question->setQuestion($data->question)
                 ->setCorrectAnswer($data->correctAnswer)
                 ->setTimePerQuestion($data->timePerQuestion)
                 ->setChoiseOne($data->choiseOne)
                 ->setChoiseTwo($data->choiseTwo)
                 ->setChoiseThree($data->choiseThree)
                 ->setChoiseFor($data->choiseFor)
                 ->setChoiseFive($data->choiseFive)
                 ->setFormation($formation);
                 $em->persist($question);
                 $em->flush();
                //  dd($question->getId());
                 return new JsonResponse(
                    'added'
                 );

    }

    // /**
    // * @Route("add/choiseAnswer/{id}", methods={"POST"})
    // */
    // public function addChoises(Quiz $quiz, Request $request, ManagerRegistry $doctrine){
    //     if(!$quiz){
    //         throw $this->createNotFoundException("aucun question");
    //     }
    //     $choise = new ChoiseAnswer();
    //     $em = $doctrine->getManager();
    //     $data = json_decode($request->getContent());
    //     $choise->setAnswer($data->answer)
    //            ->setQuiz($quiz);
    //            $em->persist($choise);
    //            $em->flush();
    //            return new JsonResponse(
    //             'added',
    //             200
    //          );
        
    // }

    /**
     * @Route("get/quiz/{id}", methods={"GET"})
     */
    public function getQuiz(Formation $formation, SerializerInterface $serializer)
    {
        $quizes = $formation->getQuizzes();
        return new Response(
            $serializer->serialize($quizes,'json',['groups'=>['quiz']]),
            200,
            ['Content-type'=>'application/json']
    );
    }

    /**
     * @Route("delete/quiz/{id}", methods={"DELETE"})
     */
    public function delete(Quiz $quiz, ManagerRegistry $doctrine){
        $em = $doctrine->getManager(); 
        $em->remove($quiz);
        $em->flush();
        return new JsonResponse(
            'deleted'
        );
    }
}
