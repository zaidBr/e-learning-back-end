<?php

namespace App\Entity;

use App\Repository\ReagitRepository;
use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Timestampable\Traits\TimestampableEntity;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: ReagitRepository::class)]
class Reagit
{
    use TimestampableEntity;

    #[Groups(['sondage'])]
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[Groups(['sondage'])]
    #[ORM\Column(type: 'boolean')]
    private $is_intersted = false;

    #[ORM\ManyToOne(targetEntity: Sondage::class, inversedBy: 'reacts')]
    #[ORM\JoinColumn(nullable: false)]
    private $sondage;

    #[Groups(['sondage'])]
    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: 'reagits')]
    #[ORM\JoinColumn(nullable: false)]
    private $candidat;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getIsIntersted(): ?bool
    {
        return $this->is_intersted;
    }

    public function setIsIntersted(bool $is_intersted): self
    {
        $this->is_intersted = $is_intersted;

        return $this;
    }

    

    public function getSondage(): ?Sondage
    {
        return $this->sondage;
    }

    public function setSondage(?Sondage $sondage): self
    {
        $this->sondage = $sondage;

        return $this;
    }

    public function getCandidat(): ?user
    {
        return $this->candidat;
    }

    public function setCandidat(?user $candidat): self
    {
        $this->candidat = $candidat;

        return $this;
    }

   
}
