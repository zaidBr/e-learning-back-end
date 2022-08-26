<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Repository\FormationRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\Common\Collections\Collection;
use Symfony\Component\Security\Core\Security;
use Doctrine\Common\Collections\ArrayCollection;
use Gedmo\Timestampable\Traits\TimestampableEntity;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: FormationRepository::class)]
class Formation
{

    use TimestampableEntity;

    #[Groups(['formateurData','details','public','subscribe','formateur','group1','someData','chapters','chapterContent','quiz'])]
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[Groups(['formateurData','details','public','subscribe','formateur','group1','someData'])]
    #[ORM\Column(type: 'string', length: 255)]
    private $name;

    #[Groups(['formateurData','details','public','subscribe','someData'])]
    #[ORM\Column(type: 'text')]
    private $description;

    #[Groups(['formateurData','details','public','subscribe','chapterContent'])]
    #[ORM\Column(type: 'string', length: 10)]
    private $type;

    #[Groups(['formateurData','details','public','subscribe'])]
    #[ORM\Column(type: 'string')]
    private $date_start;

    #[Groups(['formateurData','details','public','subscribe'])]
    #[ORM\Column(type: 'boolean')]
    private $session_is_oppen = false;

    #[Groups(['formateurData','public'])]
    #[ORM\Column(type: 'boolean')]
    private $is_visible = false;

    #[Groups(['formateurData','details','public','subscribe'])]
    #[ORM\Column(type: 'float')]
    private $price;

    #[Groups(['formateurData','details','public','subscribe','someData'])]
    #[ORM\Column(type: 'string', length: 255, nullable:true)]
    private $image;

    #[Groups(['formateurData','details','public','subscribe'])]
    #[ORM\Column(type: 'string', length: 255)]
    private $periode;

    #[Groups(['formateurData','subscribe','public','chapters'])]
    #[ORM\OneToMany(mappedBy: 'formation', targetEntity: Group::class)]
    private $groups;

    #[Groups(['formateurData','subscribe','someData','public'])]
    #[ORM\OneToMany(mappedBy: 'formation', targetEntity: Evaluation::class, orphanRemoval: true)]
    private $evaluations;

   

    #[Groups(['details','public','subscribe'])]
    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: 'formations')]
    #[ORM\JoinColumn(nullable: false)]
    private $formateur;


    #[Groups(['formateurData','public'])]
    #[ORM\ManyToOne(targetEntity: Categorie::class, inversedBy: 'formations')]
    #[ORM\JoinColumn(nullable: false)]
    private $categorie;


    #[ORM\OneToMany(mappedBy: 'ordre', targetEntity: Paiement::class)]
    private $paiements;

    #[Groups(['formateurData','details','public','subscribe'])]
    #[ORM\Column(type: 'text', nullable: true)]
    private $short_description;

    #[Groups(['formateurData','public'])]
    #[ORM\OneToMany(mappedBy: 'formation', targetEntity: Calenderier::class, orphanRemoval: true)]
    private $calenderiers;

    #[Groups(['formateurData','public'])]
    #[ORM\OneToMany(mappedBy: 'formation', targetEntity: Chapitre::class, orphanRemoval: true)]
    private $chapitres;

    #[ORM\OneToOne(targetEntity: VideoConfernce::class, cascade: ['persist', 'remove'])]
    private $videosMeetings;
    
    #[Groups(['formateurData','public'])]
    #[ORM\Column(type: 'integer', nullable: true)]
    private $nbChapter;

    #[Groups(['someData'])]
    #[ORM\Column(type: 'text', nullable: true)]
    private $specification;

    #[ORM\ManyToMany(targetEntity: Commande::class, mappedBy: 'formations')]
    private $commandes;

    #[Groups(['quiz'])]
    #[ORM\OneToMany(mappedBy: 'formation', targetEntity: Quiz::class, orphanRemoval: true)]
    private $quizzes;

    

    


    

    public function __construct()
    {
        $this->groups = new ArrayCollection();
        $this->evaluations = new ArrayCollection();
        $this->paiements = new ArrayCollection();
        $this->calenderiers = new ArrayCollection();
        $this->chapitres = new ArrayCollection();
        $this->formationAbonnes = new ArrayCollection();
        $this->commandes = new ArrayCollection();
        $this->quizzes = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(?string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(?string $type): self
    {
        $this->type = $type;

        return $this;
    }

    public function getDateStart(): ?string
    {
        return $this->date_start;
    }

    public function setDateStart(?string $date_start): self
    {
        $this->date_start = $date_start;

        return $this;
    }

    public function getSessionIsOppen(): ?bool
    {
        return $this->session_is_oppen;
    }

    public function setSessionIsOppen(bool $session_is_oppen): self
    {
        $this->session_is_oppen = $session_is_oppen;

        return $this;
    }

    public function getIsVisible(): ?bool
    {
        return $this->is_visible;
    }

    public function setIsVisible(bool $is_visible): self
    {
        $this->is_visible = $is_visible;

        return $this;
    }

    public function getPrice(): ?float
    {
        return $this->price;
    }

    public function setPrice(?float $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(string $image): self
    {
        $this->image = $image;
        return $this;
    }

    

    public function getPeriode(): ?string
    {
        return $this->periode;
    }

    public function setPeriode(?string $periode): self
    {
        $this->periode = $periode;

        return $this;
    }

    /**
     * @return Collection<int, Group>
     */
    public function getGroups(): Collection
    {
        return $this->groups;
    }

    public function addGroup(Group $group): self
    {
        if (!$this->groups->contains($group)) {
            $this->groups[] = $group;
            $group->setFormation($this);
        }

        return $this;
    }

    public function removeGroup(Group $group): self
    {
        if ($this->groups->removeElement($group)) {
            // set the owning side to null (unless already changed)
            if ($group->getFormation() === $this) {
                $group->setFormation(null);
            }
        }

        return $this;
    }

    

    /**
     * @return Collection<int, Evaluation>
     */
    public function getEvaluations(): Collection
    {
        return $this->evaluations;
    }

    public function addEvaluation(Evaluation $evaluation): self
    {
        if (!$this->evaluations->contains($evaluation)) {
            $this->evaluations[] = $evaluation;
            $evaluation->setFormation($this);
        }

        return $this;
    }

    public function removeEvaluation(Evaluation $evaluation): self
    {
        if ($this->evaluations->removeElement($evaluation)) {
            // set the owning side to null (unless already changed)
            if ($evaluation->getFormation() === $this) {
                $evaluation->setFormation(null);
            }
        }

        return $this;
    }


    public function getFormateur(): ?User
    {
        return $this->formateur;
    }

    public function setFormateur(?User $formateur): self
    {
        $this->formateur = $formateur;

        return $this;
    }
    

    public function getCategorie(): ?Categorie
    {
        return $this->categorie;
    }

    public function setCategorie(?Categorie $categorie): self
    {
        $this->categorie = $categorie;

        return $this;
    }

    /**
     * @return Collection<int, Paiement>
     */
    public function getPaiements(): Collection
    {
        return $this->paiements;
    }

    public function addPaiement(Paiement $paiement): self
    {
        if (!$this->paiements->contains($paiement)) {
            $this->paiements[] = $paiement;
            $paiement->setOrdre($this);
        }

        return $this;
    }

    public function removePaiement(Paiement $paiement): self
    {
        if ($this->paiements->removeElement($paiement)) {
            // set the owning side to null (unless already changed)
            if ($paiement->getOrdre() === $this) {
                $paiement->setOrdre(null);
            }
        }

        return $this;
    }



    // test pour voire est ce que le cuurent user est abonnes a ce formation ou non 
    
    public function isPayed(Security $security,ManagerRegistry $doctrine)
    {
        $em = $doctrine->getManager();
        $payed = $em->getRepository(Paiement::class)->findOneBy([
            "customer"=>$security->getUser(),
            "ordre"=>$this
        ]);
        if($payed){
            return true;
        }else 
        return false;
    }

    public function getShortDescription(): ?string
    {
        return $this->short_description;
    }

    public function setShortDescription(?string $short_description): self
    {
        $this->short_description = $short_description;

        return $this;
    }

    /**
     * @return Collection<int, Calenderier>
     */
    public function getCalenderiers(): Collection
    {
        return $this->calenderiers;
    }

    public function addCalenderier(Calenderier $calenderier): self
    {
        if (!$this->calenderiers->contains($calenderier)) {
            $this->calenderiers[] = $calenderier;
            $calenderier->setFormation($this);
        }

        return $this;
    }

    public function removeCalenderier(Calenderier $calenderier): self
    {
        if ($this->calenderiers->removeElement($calenderier)) {
            // set the owning side to null (unless already changed)
            if ($calenderier->getFormation() === $this) {
                $calenderier->setFormation(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Chapitre>
     */
    public function getChapitres(): Collection
    {
        return $this->chapitres;
    }

    public function addChapitre(Chapitre $chapitre): self
    {
        if (!$this->chapitres->contains($chapitre)) {
            $this->chapitres[] = $chapitre;
            $chapitre->setFormation($this);
        }

        return $this;
    }

    public function removeChapitre(Chapitre $chapitre): self
    {
        if ($this->chapitres->removeElement($chapitre)) {
            // set the owning side to null (unless already changed)
            if ($chapitre->getFormation() === $this) {
                $chapitre->setFormation(null);
            }
        }

        return $this;
    }

    public function getVideosMeetings(): ?VideoConfernce
    {
        return $this->videosMeetings;
    }

    public function setVideosMeetings(?VideoConfernce $videosMeetings): self
    {
        $this->videosMeetings = $videosMeetings;

        return $this;
    }

    public function getNbChapter(): ?int
    {
        return $this->nbChapter;
    }

    public function setNbChapter(?int $nbChapter): self
    {
        $this->nbChapter = $nbChapter;

        return $this;
    }

    public function getSpecification(): ?string
    {
        return $this->specification;
    }

    public function setSpecification(?string $specification): self
    {
        $this->specification = $specification;

        return $this;
    }

    /**
     * @return Collection<int, Commande>
     */
    public function getCommandes(): Collection
    {
        return $this->commandes;
    }

    public function addCommande(Commande $commande): self
    {
        if (!$this->commandes->contains($commande)) {
            $this->commandes[] = $commande;
            $commande->addFormation($this);
        }

        return $this;
    }

    public function removeCommande(Commande $commande): self
    {
        if ($this->commandes->removeElement($commande)) {
            $commande->removeFormation($this);
        }

        return $this;
    }

    /**
     * @return Collection<int, Quiz>
     */
    public function getQuizzes(): Collection
    {
        return $this->quizzes;
    }

    public function addQuiz(Quiz $quiz): self
    {
        if (!$this->quizzes->contains($quiz)) {
            $this->quizzes[] = $quiz;
            $quiz->setFormation($this);
        }

        return $this;
    }

    public function removeQuiz(Quiz $quiz): self
    {
        if ($this->quizzes->removeElement($quiz)) {
            // set the owning side to null (unless already changed)
            if ($quiz->getFormation() === $this) {
                $quiz->setFormation(null);
            }
        }

        return $this;
    }


    

    
}
