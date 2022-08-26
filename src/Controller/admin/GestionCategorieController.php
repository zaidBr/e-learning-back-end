<?php

namespace App\Controller\admin;

use App\Entity\Categorie;
use App\Repository\CategorieRepository;
use App\Service\ImportFichier;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\SerializerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\UploadedFile;



/**
 * @Route("/api")
 */
class GestionCategorieController extends AbstractController
{

    public function __construct(
        private SerializerInterface $serializer,
        public ImportFichier $fileupload,

    ){

    }
    
    //récuperer toute les catégorie existe dans la BD
    /**
     * @Route("/public/categorie", methods={"GET"})
     */
    public function show(CategorieRepository $categorieRepository)
    {
        $categories = $categorieRepository->findAll();
        if(!$categories){
            throw $this->createNotFoundException(
                'aucune catégorie existe!'
            );
        }
        return new Response($this->serializer->serialize($categories,'json',['groups'=>['group1']]),200,['Content-Type'=>'application/json']);
        // return new JsonResponse($this->serializer->serialize($categories,'json',['groups'=>['group1']]),200);
        
    }


    /**
     * @Route("/categorie/{id}", methods={"GET"})
     */
    public function showContents(Categorie $categorie){
        $formations = $categorie->getFormations();
        return new JsonResponse([
            "categorie"=>$categorie->getName()  ,
            "formations"=>$formations
        ]);
    }

    //ajouter une nouvelle catégotie
    /**
     * @Route("/admin/categorie", name="add_categorie", methods={"POST"})
     * @IsGranted("ROLE_ADMIN")
     */
    public function addCategorie(Request $request, ManagerRegistry $doctrine):JsonResponse
    {
        $request = $request;
        $em = $doctrine->getManager();
        $categorie = new Categorie();
        $categorie->setName($request->get('name'));
        $categorie->setDescription($request->get('description'));
        $categorie->setShortDescription($request->get('shortDescription'));

        /** @var UploadedFile $uploadedFile */
        $uploadedFile = $request->files->get('file');
        $fileName = $this->fileupload->uploadFile($uploadedFile);
        $categorie->setImage($fileName);

        $em->persist($categorie);
        $em->flush();
        return new JsonResponse([
            'success' => "le categorie est ajouter avec succés"
        ]);
        
    }

    /**
     * @Route("/admin/edit/categorie/{id}", methods={"GET","HEAD"})
     */
    public function editCategorie(Categorie $categorie){
        return new Response(
            $this->serializer->serialize($categorie,'json',['groups'=>['group1']]),
            200,
            ['Content-Type'=>'application/json']
        );
    }

    //mofidier une categorie
    /**
     * @Route("/admin/categorie/{id}", methods={"PUT"})
     * @IsGranted("ROLE_ADMIN")
     */
    public function updateCategorie(Request $request,Categorie $categorie, ManagerRegistry $doctrine):JsonResponse
    {
        $json_data = json_decode($request->getContent());
        $em = $doctrine->getManager();
        $categorie->setName($json_data->name);
        $categorie->setDescription($json_data->description);
        $categorie->setShortDescription($json_data->shortDescription);
        $em->flush();
        return new JsonResponse([
            'success'=>"la catégorie est bien modifié"
        ]);

    }

    //supprimer une categorie
    /**
     * @Route("/admin/categorie/{id}", name="delete_categorie", methods={"DELETE"})
     */
    public function deleteCategorie(Categorie $categorie,ManagerRegistry $doctrine):JsonResponse
    {
        $em = $doctrine->getManager();
        $em->remove($categorie);
        $em->flush();
        return new JsonResponse([
            'success'=>"categorie est supprimer avec succés"
        ]);
    }

    



}
