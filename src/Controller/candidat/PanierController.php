<?php

namespace App\Controller\candidat;


use Exception;
use App\Entity\Commande;
use App\Service\CartService;
use App\Repository\CommandeRepository;
use App\Repository\FormationRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Console\Command\Command;

/**
 * @Route("/api")
 */
class PanierController extends AbstractController
{
    public $requestStack;

    public $formationRepository;

    const CART_KEY = "cart";


    public function __construct(RequestStack $requestStack,FormationRepository $formationRepository,private CommandeRepository $commandRepository)
    {
        $this->requestStack = $requestStack;
        $this->formationRepository = $formationRepository;

    }

   
    /**
     * @Route("/public/cart/{id}", methods={"GET"})
     */
    public function addToCard(int $id):Response
    {
        
        $session = $this->requestStack->getSession();
        $panier = $session->get(self::CART_KEY,[]);
        if(!in_array($id,$panier)){
            $panier[]=$id;
        }
        $session->set(self::CART_KEY,$panier);
         return new Response(
             'added',
             200,
         );
    }

    /**
     * @Route("/public/cart/remove/{id}",methods={"DELETE"})
     */
    public function removeOne(int $id){
        $session = $this->requestStack->getSession();
        $panier = $session->get(self::CART_KEY);
        foreach($panier as $key => $value){
            if($value === $id){
                unset($panier[$key]);
            }
        }
        $session->set(self::CART_KEY,$panier);
        return new JsonResponse([
            "message" => "La formation est supprimer en panier"
        ]);
    }

    /**
     * @Route("/public/cart/empty",methods={"DELETE"})
     */
    public function emptyCard(CartService $cartService){
        $session = $this->requestStack->getSession();
        $panier = $session->get(self::CART_KEY,[]);
        if(!$panier == []){
            unset($panier);
        }
        $session->set(self::CART_KEY,[]);
        return new JsonResponse([
            "message" => "Panier vide"
        ]);
    }
    /**
     * @Route("/public/cart/nb/data", methods={"GET"})
     */
    public function getNBofItems(){
        $session = $this->requestStack->getSession();
        $panier = $session->get(self::CART_KEY);
        $nb =0;
        if($panier){
            (String) $nb =count($panier);
            return new Response($nb,200,['Content-type'=>'application/json']);
        }

        return new Response($nb,200,['Content-type'=>'application/json']);
    }

    /**
     * @Route("/public/cart/fetch/data", methods={"GET"})
     */
    public function getFormationFromCard(SerializerInterface $serializer){
        $session = $this->requestStack->getSession();
        $panier = $session->get(self::CART_KEY);

        foreach($panier as $key=>$value)
            {
                $panierWithData[]=$this->formationRepository->findBy(["id"=>$value]);
            }
        // dd($panier);
        // if($panier != null){
        //     foreach($panier as $key=>$value)
        //     {
        //         $panierWithData[]=$this->formationRepository->findBy(["id"=>$value]);
        // }
        // }else{
        //     throw new Exception('session is empty');
        // }
        return new Response($serializer->serialize($panierWithData,'json',['groups'=>['public']]),200,['Content-type'=>'application/json']);

    }

    /**
     * @Route("/my/cart/validate", methods={"GET"})
     */
    public function validateCart(ManagerRegistry $doctrine){
        $em = $doctrine->getManager();
        $session = $this->requestStack->getSession();
        $panier = $session->get(self::CART_KEY);

        if(!count($panier)){
            throw new Exception(
                "panier est vide"
            );
        }
        /** @var \App\Entity\User $customer */
        $customer = $this->getUser();
        $orders = $customer->getCommandes();
        
        $lastOrder = $orders[count($orders)-1];
        if($lastOrder && $lastOrder->getStatus() == 'invalid'){
                $orderId = $lastOrder->getId();
                $newOrder = new Commande();
                foreach ($panier as $key => $value) {
                    $formationPanier = $this->formationRepository->find($value);
                    if(!$lastOrder->getFormations()->contains($formationPanier) && count($lastOrder->getFormations()) != count($panier) ){
                        $em->remove($lastOrder);
                        $newOrder->addFormation($formationPanier)
                             ->addUser($customer);
                             $em->persist($newOrder);
                             $em->flush();
                             $orderId = $newOrder->getId();
                    }
                }
            
        }else{
                $newOrder = new Commande();
                foreach ($panier as $key => $value) {
                    
                                $formationPanier = $this->formationRepository->find($value);
                                $newOrder->addFormation($formationPanier);
                                            $newOrder->addUser($customer);
                                            $em->persist($newOrder);
                                            $em->flush();
                                            $orderId = $newOrder->getId();
                        }
            }
    
        return new JsonResponse(['id'=>$orderId,'firstName'=>$customer->getName(),'lastName'=>$customer->getLastName()]); 
    


        

















    //     $newOrder = new Commande();
        
        
    //     if(count($orders)>0){
    //         $orderId = $orders[count($orders)-1];
    //         foreach ($orders as $order) {
                
    //             foreach ($order->getFormations() as $formation) {
    //                 foreach ($panier as $key => $value) {
    //                     $formationPanier = $this->formationRepository->find($value);
    //                     $message='errrrrrors';
    //                     if($formationPanier->getId() != $formation->getId() ){
    //                         $message='aaaaaaaaaa';
    //                         // dd($formationPanier->getId());
    //                         $newOrder->addFormation($formationPanier);
    //                         $newOrder->addUser($customer);
    //                         if($orders[count($orders)-1]){
    //                             $em->persist($newOrder);
    //                             $em->flush();
    //                             $orderId = $newOrder->getId();
    //                         }
                            
    //                     }
    //                     // dd($message);
    //                 }
    //             }
    //     }
    //     }else{
    //         foreach ($panier as $key => $value) {
    //             $formationPanier = $this->formationRepository->find($value);
    //             $newOrder->addFormation($formationPanier);
    //                         $newOrder->addUser($customer);
    //                         $em->persist($newOrder);
    //                         $em->flush();
    //                         $orderId = $newOrder->getId();
    //     }
    // }
        
                // return new JsonResponse(['id'=>$orderId,'firstName'=>$customer->getName(),'lastName'=>$customer->getLastName()]); 

        
        // if(!count($orders)){
        //     $newOrder = new Commande();
        // }
        
        // foreach($panier as $key=>$value){
        //     $formation = $this->formationRepository->find($value);
           
        //     if(!count($orders)){
        //         $newOrder->addUser($customer);
        //         $newOrder->addFormation($formation);
        //         $em->persist($newOrder);
        //         $em->flush();
        //     }else{
        //         foreach ($orders as $orderUser) {
        //             foreach ($orderUser->getformations() as $orderFormation) {
        //                 if($orderFormation !== $formation){
        //                     $newOrder->addUser($customer);
        //                     $newOrder->addFormation($formation);
        //                     $em->persist($newOrder);
        //                     $em->flush();
        //                 }
        //             }
        //         }
        //     }
        // }
        // return new JsonResponse(['id'=>$newOrder->getId(),'firstName'=>$customer->getName(),'lastName'=>$customer->getLastName()]); 

        // $order = new Commande();
        // foreach ($panier as $key => $value) {
        //     $subscribesCourses = new FormationAbonne();
        //     /** @var \App\Entity\User $customer */
        //     $customer = $this->getUser();
        //     $subscribesCourses->setUser($customer);
           
        //     $subscribesCourses->setCommande($order);
        //     // dd($panier);
        //     $formation = $this->formationRepository->find($value);
        //     $subscribesCourses->setFormation($formation); 
        //     $em->persist($subscribesCourses);
        //     $em->flush();
        // }
        

        // return new JsonResponse(['id'=>$subscribesCourses->getId(),'firstName'=>$customer->getName(),'lastName'=>$customer->getLastName()]); 







        // $data=array();
        // foreach ($panier as $key => $value) {
        //     /** @var \App\Entity\User $customer */
        //     $customer = $this->getUser();
        //     // dd($panier);
        //     $formation = $this->formationRepository->find($value);
        //     $payed = $em->getRepository(Paiement::class)->findOneBy([
        //         "customer"=>$customer,
        //         "ordre"=>$formation
        //     ]);
        //     if($payed){
        //         return new JsonResponse([
        //             "message"=>"deja achete"
        //         ]); 
        //     }
        //     $groups=$formation->getGroups();
        //     $data[]=["user"=> $customer->getName(),
        //              "panier_id" => $value,
        //              "formation_name" => $formation->getName(),
        //              'group_sie' => count($groups[0]->getUsers()),
        //              'is_payed' => $payed
        // ];

        // $inGroup = false;
        // for ($i=0; $i <= count($groups) ; $i++) {
        //     if($groups[$i]->getMaxSize() > count($groups[$i]->getUsers()) ) {
        //         $groups[0]->addUser($customer);
        //         $payment = new Paiement();
        //         $payment->setCustomer($customer)
        //                             ->setOrdre($groups[0]->getFormation())
        //                             ->setIsPayed(true);
        //                             $em->persist($payment);
        //                             $em->flush();
        //                             $inGroup = true;
        //                             $message = "Vous etes inscrit dans ce formation, votre groupe est ".$groups[$i]->getName();
        //         break;
        //     }else{
        //         $message = "Toutes les groupes de cette Formation sont pleinent";
        //     }
            
        // }
        // }
        
}


    /**
     * @Route("/add/to/my/cours/{id}/{status}", methods={"PUT"})
     */
    public function registerInFormation(Commande $order,$status,ManagerRegistry $doctrine){
        // dd($order);
        /** @var \App\Entity\User $customer */
        $candidat = $this->getUser();
        $em = $doctrine->getManager();
        if($status == 'completed'){

            $order->setStatus("valide");
            $em->flush();
            foreach ($order->getFormations() as $formation) {
                if($formation->getType()==='online'){
                    foreach ($formation->getGroups() as $group) {
                        if(count($group->getUsers()) < $group->getMaxSize() ){
                            $group->addUser($candidat);
                            $em->persist($group);
                            $em->flush();
                            break;
                        }
                    }

                }
            }
            return new JsonResponse(['result'=>'success']);
        }else{
            $order->setStatus("invalid");
            $em->flush();
            return new JsonResponse(['result'=>'failed']);
        }
        
    }

    


        // /**
        //  * @Route("/add/to/cart/{id}", methods={"POST"})
        //  */
        // public function addToCard(Formation $formation,ManagerRegistry $doctrine){
        //     $em=$doctrine->getManager();
        //     $panier = new Panier();
        //     /** @var \App\Entity\User $currentUser */
        //     $currentUser = $this->getUser();
        //     $panier->setCandidat($currentUser);
        //     $panier->addFormation($formation);
        //     $em->persist($panier);
        //     $em->flush();
        //     return new JsonResponse([
        //         'mesg'=>'added'
        //     ]);

        // }


    
}
