<?php

namespace App\Controller\candidat;

use App\Entity\Evaluation;
use App\Entity\EvaluationFormateur;
use App\Entity\Formation;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

/**
 * @Route("/api")
 */
class EvaluationController extends AbstractController
{
    /**
     * @Route("/evaluation/{id}", methods={"POST"})
     */
    public function addRaitingForFormation(Formation $formation,Request $request,ManagerRegistry $doctrine){

        
        $em = $doctrine->getManager();
        $json_data = json_decode($request->getContent());
        /** @var \App\Entity\User $candidat */
        $candidat = $this->getUser();
        if(!$formation){
            throw $this->createNotFoundException('
            empty formation
            ');
        }
        // $payment = $em->getRepository(Paiement::class)->findOneBy(["ordre"=>$formation,"customer"=>$candidat, "is_payed"=>true]);
        // if($payment){
        //     $evaluations=$em->getRepository(Evaluation::class)->findOneBy([
        //         'formation'=>$formation,
        //         'candidat'=>$candidat
        //     ]);
    
        //     if($evaluations){
        //         $evaluations
        //                ->setComment($json_data->comment)
        //                ->setSatrs($json_data->stars);
        //                $em->flush();
        //                $message="votre avis est modifié";
    
        //     }else{
        //     $evaluation = new Evaluation();
        //     $evaluation->setCandidat($candidat)
        //                ->setFormation($formation)
        //                ->setComment($json_data->comment)
        //                ->setSatrs($json_data->stars);
        //     $em->persist($evaluation);
        //     $em->flush();
        //     $message="votre avis est ajouté";
    
        // }
        //     return new JsonResponse([
        //         'message' => $message
        //     ]);
    
            
    
        // }else{
        //     return new JsonResponse([
        //         "message"=> "avant de mettre votre avis vous pouvez suivie la formation"
        //     ]);
        // }
            $evaluations=$em->getRepository(Evaluation::class)->findOneBy([
                    'formation'=>$formation,
                    'candidat'=>$candidat
                ]);
                
            if($evaluations){
                $evaluations
                       ->setComment($json_data->comment)
                       ->setSatrs($json_data->stars);
                       $em->flush();
                       $message="votre avis est modifié";
    
            }else{
            $evaluation = new Evaluation();
            $evaluation->setCandidat($candidat)
                       ->setFormation($formation)
                       ->setComment($json_data->comment)
                       ->setSatrs($json_data->stars);
            $em->persist($evaluation);
            $em->flush();
            $message="votre avis est ajouté";
            }
            return new Response(
                $message
            );
            
        }



        /**
        * @Route("/evaluation/formateur/{id}", methods={"POST"})
        */
        public function addForTeacher(Formation $formation,Request $request,ManagerRegistry $doctrine){
        $em = $doctrine->getManager();
        $json_data = json_decode($request->getContent());
        /** @var \App\Entity\User $candidat */
        $candidat = $this->getUser();
        $formateur = $formation->getFormateur();
        $evaluation=$em->getRepository(EvaluationFormateur::class)->findOneBy([
            'formateur'=>$formateur,
            'candidat'=>$candidat
        ]);
        if($evaluation){
            $evaluation
                    ->setComment($json_data->comment)
                    ->setStars($json_data->stars);
                    $em->flush();
                    $message="votre avis est modifié";

        }else{
        $evaluation = new EvaluationFormateur();
        $evaluation->setCandidat($candidat)
                    ->setFormateur($formateur)
                    ->setComment($json_data->comment)
                    ->setStars($json_data->stars);
        $em->persist($evaluation);
        $em->flush();
        $message="votre avis est ajouté";

    }
        return new JsonResponse([
            'message' => $message
        ]);
        


        // if(!$formateur){
        //     throw $this->createNotFoundException('
        //     empty Teacher
        //     ');
        // }
        //     $isPayed = false;
        //     $formations = $em->getRepository(Formation::class)->findBy(["formateur"=>$formateur]);
        //     if($formations){
        //         for ($i=0; $i < count($formations); $i++) { 
        //             if($em->getRepository(Paiement::class)->findOneBy(["ordre"=>$formations[$i],"customer"=>$candidat, "is_payed"=>true])){
        //                 $isPayed = true;
        //                 break;
        //             }
        //         }
        //         if($isPayed){
        //             $evaluation=$em->getRepository(EvaluationFormateur::class)->findOneBy([
        //                 'formateur'=>$formateur,
        //                 'candidat'=>$candidat
        //             ]);
        //             if($evaluation){
        //                 $evaluation
        //                        ->setComment($json_data->comment)
        //                        ->setStars($json_data->stars);
        //                        $em->flush();
        //                        $message="votre avis est modifié";
            
        //             }else{
        //             $evaluation = new EvaluationFormateur();
        //             $evaluation->setCandidat($candidat)
        //                        ->setFormateur($formateur)
        //                        ->setComment($json_data->comment)
        //                        ->setStars($json_data->stars);
        //             $em->persist($evaluation);
        //             $em->flush();
        //             $message="votre avis est ajouté";
            
        //         }
        //             return new JsonResponse([
        //                 'message' => $message
        //             ]);



        //     }else{
        //         return new JsonResponse([
        //             "message"=> "avant de mettre votre avis vous pouvez suivie la formation"
        //         ]);
        //     }
        // }
        // return new JsonResponse([
        //     "message"=> "ce formateur n'a pesenter aucun formation, Alors Vous ne pouvez pas le evaluer sans essayer d'étudier avec lui"
        // ]);
        
        

   

}

/**
 * @Route("/my/rate/{id}", methods={"GET"}) 
 */
public function getCurrentRate(Formation $formation,ManagerRegistry $doctrine,SerializerInterface $serializer){
    /** @var \App\Entity\User $candidat */
    $candidat = $this->getUser();
    $em = $doctrine->getManager();
    $evaluationC = $em->getRepository(Evaluation::class)->findOneBy(['candidat'=>$candidat]);
    $evaluationT = $em->getRepository(EvaluationFormateur::class)->findOneBy(['candidat'=>$candidat]);
    return new JsonResponse([
        'evaluationC'=> $serializer->serialize($evaluationC,'json',['groups'=>['my-commentC']]),
        'evaluationT'=> $serializer->serialize($evaluationT,'json',['groups'=>['my-commentT']]),
    ]);
    
}
}
