<?php

namespace App\Controller\admin;

use App\Entity\Chapitre;
use App\Entity\Commentaire;
use App\Repository\CommentaireRepository;

use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;


/**
 * @Route("/api")
 */
class GestionCommentaireController extends AbstractController
{

    public $serializer;

    public function __construct(SerializerInterface $serializer)
    {
        $this->serializer = $serializer;
    }
    /**
     * @Route("/comment/{id}", methods={"POST"})
     */
    public function addComment(Chapitre $chapter, ManagerRegistry $doctrine, Request $request):JsonResponse
    {

        $json_data = json_decode($request->getContent());
        $em = $doctrine->getManager(); 
        /** @var \App\Entity\User $writer */
        $writer = $this->getUser();
        $comment = new Commentaire();
        $comment->setComment($json_data->comment);
        $comment->setWriter($writer);
        $comment->setChapitre($chapter);
        $em->persist($comment);
        $em->flush();

        return new JsonResponse([
            'msg' => 'added'
        ]);
    }

    /**
     * @Route("/edit/comment/{id}", methods={"PUT"})
     */
    public function editComment(Commentaire $comment,  ManagerRegistry $doctrine, Request $request){
        $json_data = json_decode($request->getContent());
        $em = $doctrine->getManager(); 
        $comment->setComment($json_data->comment);
        $em->flush();
        return new JsonResponse([
            'msg' => 'edited'
        ]);

    }

    /**
     * @Route("/comment/{id}", methods={"GET"})
     */
    public function getAllComments(Chapitre $chapter,SerializerInterface $serializer,  ManagerRegistry $doctrine):Response
    {
        $em = $doctrine->getManager(); 
        $comments = $em->getRepository(Commentaire::class)->findBy(['chapitre'=>$chapter]);
        return new Response(
            $serializer->serialize($comments,'json',['groups'=>['commentChpter']]),
            200,
            ['Content-type'=>'application/json']
        );
    }
}
