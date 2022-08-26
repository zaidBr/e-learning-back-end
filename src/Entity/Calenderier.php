<?php

namespace App\Entity;

use App\Repository\CalenderierRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: CalenderierRepository::class)]
class Calenderier
{

    #[Groups(['formateurData'])]
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[Groups(['formateurData'])]
    #[ORM\Column(type: 'string', length: 255)]
    private $title;

    #[Groups(['formateurData'])]
    #[ORM\Column(type: 'datetime')]
    private $start;

    
    #[ORM\ManyToOne(targetEntity: Formation::class, inversedBy: 'calenderiers')]
    #[ORM\JoinColumn(nullable: false)]
    private $formation;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getStart(): ?\DateTimeInterface
    {
        return $this->start;
    }

    public function setStart(?\DateTimeInterface $start): self
    {
        $this->start = $start;

        return $this;
    }

    public function getFormation(): ?Formation
    {
        return $this->formation;
    }

    public function setFormation(?Formation $formation): self
    {
        $this->formation = $formation;

        return $this;
    }
}
