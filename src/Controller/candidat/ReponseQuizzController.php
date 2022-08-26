<?php

namespace App\Controller\candidat;

use App\Entity\Quizz;
use App\Entity\ResultatQuizz;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * @Route("/api")
 */
class ReponseQuizzController extends AbstractController
{
    /**
     * @Route("/answer/{id}",methods={"POST"})
     */
    public function repondre($id,Request $request,ManagerRegistry $doctrine){
        $em = $doctrine->getManager();
        $json_data = json_decode($request->getContent());
        /** @var \App\Entity\User $candidat */
        $candidat = $this->getUser();
        $quizz = $em->getRepository(Quizz::class)->find($id);
        $reponse = new ResultatQuizz();

        $resultats =$em->getRepository(ResultatQuizz::class)->findOneBy([
            "quizz"=>$quizz,
            "user" =>$candidat
        ]);
        if(!$resultats){

        $reponse->setChoiseSelected($json_data->choise);
        $reponse->setQuizz($quizz)
                ->setUser($candidat);
        $em->persist($reponse);
        $em->flush();

        if($reponse->getChoiseSelected()==$quizz->getCorrectAnswer()){
            $reponse->setNbreGoodAnswer($reponse->getNbreGoodAnswer()+1);
            $reponse->setNbreBadAnswer(0);

        }else{
            $reponse->setNbreBadAnswer($reponse->getNbreBadAnswer()+1);
            $reponse->setNbreGoodAnswer(0);


        }
        $em->flush();
        return new JsonResponse([
            'message'=>"valid",
            'bad'=>$reponse->getNbreBadAnswer(),
            "correct"=>$reponse->getNbreGoodAnswer()
        ]);
    }else{
        return new JsonResponse([
            "message"=>"seule reponse est acepté"
        ]);
    }
 
}
}
