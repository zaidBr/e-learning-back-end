<?php

namespace App\Controller\formateur;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GestionVideoController extends AbstractController
{
    #[Route('/formateur/gestion/video', name: 'app_formateur_gestion_video')]
    public function index(): Response
    {
        return $this->json([
            'message' => 'Welcome to your new controller!',
            'path' => 'src/Controller/Formateur/GestionVideoController.php',
        ]);
    }
}
