<?php
namespace App\Service;

use App\Repository\FormationRepository;
use Symfony\Component\HttpFoundation\RequestStack;

class CartService{

    public $requestStack;

    public $formationRepository;

    const CART_KEY = "cart";
    
    /**
     * @param RequestStack $requestStack
     * @param FormationRepository  $formationRepository
     */
    public function __construct(RequestStack $requestStack,FormationRepository $formationRepository)
    {
        $this->requestStack = $requestStack;
        $this->formationRepository = $formationRepository;
    }
    
    public function add(int $id){
        $session = $this->requestStack->getSession();
        $panier[] = $session->get(self::CART_KEY,[]);
        if(in_array($id,$panier)){
            $panier[]="";
        }

        else{
            $panier[]=$id;
        }
        $session->set(self::CART_KEY,$panier);
        //  dd($panier);
    }

    public function getCart(){
        $session = $this->requestStack->getSession();
        $panier = $session->get(self::CART_KEY,[]);
        $panierWithData = array();
        foreach($panier as $item){
            $panierWithData[] = $this->formationRepository->findBy(["id"=>$item]);
        }
        return $panierWithData;

    }

    public function removeItem(int $id){
        $session = $this->requestStack->getSession();
        $panier = $session->get(self::CART_KEY,[]);
        if(!empty($panier[$id])){
            unset($panier[$id]);
        }
        for($i=1,$size=count($panier);$i <= $size; $i++){
            if($panier[$i]===$id){
                unset($panier[$i]);
            }
        }
        $session->set(self::CART_KEY,$panier);
    }

    public function emptyCard(){
        $session = $this->requestStack->getSession();
        $panier = $session->get(self::CART_KEY,[]);
        if(!$panier == []){
            unset($panier);
        }
        $session->set(self::CART_KEY,[]);
    }


    public function getTotal(){
        $total = 0;
        foreach($this->getCart() as $item){
            return $total += $item['formation']->getPrice();
        }
        
    }

}
