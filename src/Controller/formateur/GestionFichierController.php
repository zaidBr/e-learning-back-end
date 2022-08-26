<?php

namespace App\Controller\formateur;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GestionFichierController extends AbstractController
{
    #[Route('/formateur/gestion/fichier', name: 'app_formateur_gestion_fichier')]
    public function index(): Response
    {
        return $this->json([
            'message' => 'Welcome to your new controller!',
            'path' => 'src/Controller/Formateur/GestionFichierController.php',
        ]);
    }
}
