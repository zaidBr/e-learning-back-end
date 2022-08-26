<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Repository\FichierRepository;
use Gedmo\Mapping\Annotation as Gedmo;
use Gedmo\Timestampable\Traits\TimestampableEntity;
use Symfony\Component\Serializer\Annotation\Groups;


#[ORM\Entity(repositoryClass: FichierRepository::class)]
class Fichier
{
    use TimestampableEntity;


    
    #[Groups(['subscribefile','chapterContent'])]
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[Groups(['subscribefile','chapterContent'])]
    #[ORM\Column(type: 'string', length: 255)]
    private $title;

    #[Groups(['subscribefile','chapterContent'])]
    #[ORM\Column(type: 'text')]
    private $description;

    #[Groups(['subscribefile','chapterContent'])]
    #[ORM\Column(type: 'string', length: 255)]
    private $file_path;

    #[ORM\ManyToOne(targetEntity: Chapitre::class, inversedBy: 'files')]
    #[ORM\JoinColumn(nullable: false)]
    private $chapitre;



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

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getFilePath(): ?string
    {
        return $this->file_path;
    }

    public function setFilePath(string $file_path): self
    {
        $this->file_path = $file_path;

        return $this;
    }



    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getChapitre(): ?Chapitre
    {
        return $this->chapitre;
    }

    public function setChapitre(?Chapitre $chapitre): self
    {
        $this->chapitre = $chapitre;

        return $this;
    }
}
