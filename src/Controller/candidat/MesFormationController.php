<?php

namespace App\Controller\candidat;

use App\Repository\CommandeRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

class MesFormationController extends AbstractController
{
    /**
     * @Route("/api/get/my/formations", methods={"GET"})
     */
    public function getMyCourses(CommandeRepository $commande, SerializerInterface $serializer){
         /** @var \App\Entity\User $candidat */
         $candidat = $this->getUser();
         $allCammandes = $candidat->getCommandes();
         if(!$allCammandes){
            $this->createNotFoundException('aucune commande');
         }
        //  $payedCommandes=[];
        foreach ($allCammandes as $cmd) {
            if($cmd->getStatus() == 'valide'){
                
                foreach ($cmd->getFormations() as $formation) {
                    $myCourses[] = $formation;
                }
            }
        }
        

         return new Response($serializer->serialize($myCourses,'json',['groups'=>['subscribe']]),200,["Content-type"=>"application/json"]);

         
    }
}
