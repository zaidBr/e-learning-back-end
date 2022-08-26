<?php

namespace App\Controller\admin;

use App\Entity\Sondage;
use App\Repository\SondageRepository;
use Doctrine\Persistence\ManagerRegistry;
use Exception;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

/**
 * @Route("/api")
 */
class GestionSondageController extends AbstractController
{
    private $security;

    public function __construct(Security $security,private SerializerInterface $serializer,
    )
    {
        $this->security = $security;
    }


    /**
     * @Route("/admin/sondage", methods={"POST"})
     */
    public function addSondage(Request $request,ManagerRegistry $doctrine){
        $json_data = json_decode($request->getContent());
        $em = $doctrine->getManager();
          /** @var \App\Entity\User $writer */
        $writer = $this->getUser();
        // $admin_id = $writer->getId();
        // $admin = $em->getRepository(User::class)->find($admin_id);
        $sondage = new Sondage();
        $sondage->setTitle($json_data->title)
                ->setText($json_data->text)
                ->setAdmin($writer);

        $writer->addSondage($sondage);
        $em->persist($sondage);
        $em->flush();
        
        return new JsonResponse([
            'sondage'=>$sondage,
            'message'=>'sondage créer avec succés'
        ]);
        

    }

    /**
     * @Route("/admin/sondage/{id}", methods={"PUT"})
     */
    public function editSondage($id,Request $request,ManagerRegistry $doctrine){
        $em = $doctrine->getManager();
        $sondage = $em->getRepository(Sondage::class)->find($id);
        $json_data = json_decode($request->getContent());

        /** @var \App\Entity\User $admin */
        $admin = $this->getUser();
        $writer_id = $sondage->getAdmin();
        if($admin->getId() === $writer_id->getId()){
            $sondage->setTitle($json_data->title)
            ->setText($json_data->text);
            $em->flush();
        }else{
            throw new Exception(
                "seulement l'écrivain de cette sondage a l'autorisation de le modifier"
            );
        }
        return new JsonResponse([
            'message'=> 'le sondage est bien modifié'
        ]);

 
    }
    

    /**
     * @Route("/admin/sondage/{id}", methods={"DELETE"})
     */
    public function deleteSondage(ManagerRegistry $doctrine,$id)
    {
        $em = $doctrine->getManager();
        $sondage = $em->getRepository(Sondage::class)->find($id);
        $em->remove($sondage);
        $em->flush();
        return new JsonResponse([
            'message' => 'le sondage est bien effacé'
        ]);
    }


    /**
     * @Route("/public/sondage", methods={"GET"})
     */
    public function getAllSondage(SondageRepository $sondageRepository){
        $sondages = $sondageRepository->findAll();
        if(!$sondages){
            throw $this->createNotFoundException('aucun sondage');
        }
       
        return new Response($this->serializer->serialize($sondages,'json',['groups'=>['sondage']]),200,['Content-Type'=>'application/json']);
    }

    public function nbReagits(Sondage $sondage){
        $manyReagits = $sondage->getReacts();
        $nbReagits = 0;
        foreach($manyReagits as $oneReagit){
            if($oneReagit['is_intersted'] == true){
                return $nbReagits++;
            }
        }
    }


    

}
