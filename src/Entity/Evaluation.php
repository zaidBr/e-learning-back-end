<?php

namespace App\Entity;

use App\Repository\EvaluationRepository;
use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Timestampable\Traits\TimestampableEntity;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: EvaluationRepository::class)]
class Evaluation
{
    use TimestampableEntity;
    #[Groups(['formateurData','subscribe','someData','my-commentC','public'])]
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[Groups(['formateurData','someData','subscribe','my-commentC','public'])]
    #[ORM\Column(type: 'text', nullable: true)]
    private $comment;

    #[Groups(['formateurData','someData','subscribe','my-commentC','public'])]
    #[ORM\Column(type: 'integer')]
    private $satrs;

    #[ORM\ManyToOne(targetEntity: Formation::class, inversedBy: 'evaluations')]
    #[ORM\JoinColumn(nullable: false)]
    private $formation; 

    #[Groups(['someData'])]
    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: 'evaluations')]
    #[ORM\JoinColumn(nullable: false)]
    private $candidat;

    
    public function getId(): ?int
    {
        return $this->id;
    }

    public function getComment(): ?string
    {
        return $this->comment;
    }

    public function setComment(?string $comment): self
    {
        $this->comment = $comment;

        return $this;
    }

    public function getSatrs(): ?int
    {
        return $this->satrs;
    }

    public function setSatrs(int $satrs): self
    {
        $this->satrs = $satrs;

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
