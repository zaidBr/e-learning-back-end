<?php

namespace App\Entity;

use App\Repository\SondageRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Timestampable\Traits\TimestampableEntity;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: SondageRepository::class)]
class Sondage
{
    use TimestampableEntity;

    #[Groups(['sondage'])]
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[Groups(['sondage'])]
    #[ORM\Column(type: 'string', length: 255)]
    private $title;

    #[Groups(['sondage'])]
    #[ORM\Column(type: 'text')]
    private $text;

    #[Groups(['sondage'])]
    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: 'sondages')]
    #[ORM\JoinColumn(nullable: false)]
    private $admin;

    #[Groups(['sondage'])]
    #[ORM\OneToMany(mappedBy: 'sondage', targetEntity: Reagit::class, orphanRemoval: true)]
    private $reacts;

    

    public function __construct()
    {
        $this->reacts = new ArrayCollection();
    }

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

    public function getText(): ?string
    {
        return $this->text;
    }

    public function setText(string $text): self
    {
        $this->text = $text;

        return $this;
    }

    

    public function getAdmin(): ?User
    {
        return $this->admin;
    }

    public function setAdmin(?User $admin): self
    {
        $this->admin = $admin;

        return $this;
    }

    /**
     * @return Collection<int, reagit>
     */
    public function getReacts(): Collection
    {
        return $this->reacts;
    }

    public function addReact(reagit $react): self
    {
        if (!$this->reacts->contains($react)) {
            $this->reacts[] = $react;
            $react->setSondage($this);
        }

        return $this;
    }

    public function removeReact(reagit $react): self
    {
        if ($this->reacts->removeElement($react)) {
            // set the owning side to null (unless already changed)
            if ($react->getSondage() === $this) {
                $react->setSondage(null);
            }
        }

        return $this;
    }
}
