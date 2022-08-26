<?php

namespace App\Controller\candidat;

use App\Entity\User;
use App\Repository\FormationRepository;
use App\Repository\UserRepository;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


class InscriptionController extends AbstractController
{
    /**
    * @Route("/api/public/get/user/registration" , methods={"GET"})
    */
    public function getStudent(UserRepository $userRepository){
        $week = $userRepository->getPerWeek('user');
        $month = $userRepository->getPerMonth('user');
        $day = $userRepository->getPerDay('user');
        $all=$userRepository->getByRole('user');
        $countAll = count($all);
        $perWeek = count($week);
        $perMonth = count($month);
        $perDay=count($day);
        return new JsonResponse([
            "countAll"=>$countAll,
            "perMonth"=>$perMonth,
            "perWeek"=>$perWeek,
            "perDay"=>$perDay
        ]);
 
        

    }

    /**
     * @Route("/api/public/get/student/registration" , methods={"GET"})
     */
    public function getAllStudenAndCours(UserRepository $userRepository, FormationRepository $formationRepository){
        $all=$userRepository->getByRole('user');
        $countAll = count($all)-1;
        $allCours = count($formationRepository->findAll());
        return new JsonResponse(
            [
                "countAll"=>$countAll,
                "allCours"=>$allCours
            ]
        ) ;
    }
    
}
