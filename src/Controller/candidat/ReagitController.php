<?php

namespace App\Controller\candidat;

use App\Entity\Reagit;
use App\Entity\Sondage;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;



/**
 * @Route("/api")
 */
class ReagitController extends AbstractController
{
    /**
     * @Route("/reagit/{id}" , methods={"GET"})
     */
   public function add(Sondage $sondage,ManagerRegistry $doctrine){

    $em = $doctrine->getManager();

    /** @var \App\Entity\User $candidat */
    $candidat = $this->getUser();
    
    if(!$sondage){
        throw $this->createNotFoundException(
            'empty sondage'
        );
    }
    $reagits=$em->getRepository(Reagit::class)->findOneBy([
        "sondage"=>$sondage,
        "candidat"=>$candidat
    ]);
    if($reagits){
        $em->remove($reagits);
    $em->flush();
    $message="reagit supprimer avec succes";
    }else{
    
    $reagit = new Reagit();
    $reagit->setCandidat($candidat)
           ->setSondage($sondage)
           ->setIsIntersted(!$reagit->getIsIntersted());
    $em->persist($reagit);
    $em->flush();
    $message="reagit est bien ajouté";
}
    return new JsonResponse([
        'message' => $message
    ]);
   }

}
