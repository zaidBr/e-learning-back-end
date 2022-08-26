<?php

namespace App\Entity;

use App\Repository\PaiementRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Timestampable\Traits\TimestampableEntity;

#[ORM\Entity(repositoryClass: PaiementRepository::class)]
class Paiement
{
    use TimestampableEntity;

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: 'paiements')]
    #[ORM\JoinColumn(nullable: false)]
    private $customer;

    #[ORM\ManyToOne(targetEntity: Formation::class, inversedBy: 'paiements')]
    #[ORM\JoinColumn(nullable: false)]
    private $ordre;

    #[ORM\Column(type: 'boolean')]
    private $is_payed = false ;

    
    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCustomer(): ?User
    {
        return $this->customer;
    }

    public function setCustomer(?User $customer): self
    {
        $this->customer = $customer;

        return $this;
    }

    public function getOrdre(): ?Formation
    {
        return $this->ordre;
    }

    public function setOrdre(?Formation $ordre): self
    {
        $this->ordre = $ordre;

        return $this;
    }

    public function getIsPayed(): ?bool
    {
        return $this->is_payed;
    }

    public function setIsPayed(bool $is_payed): self
    {
        $this->is_payed = $is_payed;

        return $this;
    }




 
}
