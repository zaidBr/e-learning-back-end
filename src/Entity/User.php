<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Repository\UserRepository;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\ArrayCollection;
use Gedmo\Timestampable\Traits\TimestampableEntity;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;


#[ORM\Entity(repositoryClass: UserRepository::class)]
#[ORM\Table(name: '`user`')]
#[UniqueEntity(fields: ['email'], message: 'There is already an account with this email')]
class User implements UserInterface, PasswordAuthenticatedUserInterface
{
    use TimestampableEntity;

    #[Groups(['formateur','public','sondage','currentUser','formateurData','someData','subscribe','commentChpter'])]
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[Groups(['formateur','subscribe','currentUser','formateurData'])]
    #[ORM\Column(type: 'string', length: 180, unique: true)]
    private $email;

    #[Groups(['formateur','currentUser'])]
    #[ORM\Column(type: 'json')]
    private $roles = [];

    #[ORM\Column(type: 'string')]
    private $password;


    #[ORM\Column(type: 'string', length: 255)]
    #[Groups(['details','public','formateur','sondage','currentUser','formateurData','subscribe','someData','commentChpter'])]
    private $name;

    #[ORM\Column(type: 'string', length: 255)]
    #[Groups(['details','public','formateur','currentUser','subscribe','formateurData','someData'])]
    private $last_name;

    #[Groups(['currentUser'])]
    #[ORM\Column(type: 'integer', nullable: true)]
    private $cin;

    #[ORM\Column(type: 'string', length: 255, nullable: true)]
    #[Groups(['currentUser','formateurData'])]
    private $location;

    #[ORM\Column(type: 'integer', nullable: true)]
    #[Groups(['details','public','formateur','currentUser'])]
    private $phone_nbre;

    #[ORM\Column(type: 'boolean')]
    private $is_payed = false;

    #[ORM\Column(type: 'integer', nullable: true)]
    #[Groups(['currentUser'])]
    private $age;

    

    #[ORM\OneToMany(mappedBy: 'writer', targetEntity: Commentaire::class, orphanRemoval: true)]
    private $comments;

    #[ORM\OneToMany(mappedBy: 'emitter', targetEntity: Message::class)]
    private $messages;

    #[ORM\OneToMany(mappedBy: 'admin', targetEntity: Sondage::class, orphanRemoval: true)]
    private $sondages;

    #[ORM\OneToMany(mappedBy: 'candidat', targetEntity: Evaluation::class)]
    private $evaluations;

    #[ORM\OneToMany(mappedBy: 'candidat', targetEntity: Reagit::class, orphanRemoval: true)]
    private $reagits;

    



    #[Groups(['formateur'])]
    #[ORM\OneToMany(mappedBy: 'formateur', targetEntity: Formation::class)]
    private $formations;

    

    #[ORM\OneToMany(mappedBy: 'customer', targetEntity: Paiement::class)]
    private $paiements;

    #[ORM\ManyToMany(targetEntity: Group::class, inversedBy: 'users')]
    #[Groups(['currentUser'])]
    private $groupe;

    #[Groups(['userIsVerified'])]
    #[ORM\Column(type: 'boolean')]
    private $isVerified = false;

    #[Groups(['formateur','public'])]
    #[ORM\Column(type: 'text', nullable: true)]
    private $description;

    #[Groups(['formateur','currentUser','public','someData','commentChpter'])]
    #[ORM\Column(type: 'string', length: 255, nullable: true)]
    private $image = 'userDefault.png';

    #[ORM\OneToMany(mappedBy: 'formateur', targetEntity: EvaluationFormateur::class, orphanRemoval: true)]
    private $evaluationFormateurs;

    #[ORM\ManyToMany(targetEntity: Commande::class, mappedBy: 'users')]
    private $commandes;

    #[ORM\OneToMany(mappedBy: 'user', targetEntity: Participant::class, orphanRemoval: true)]
    private $participants;

    #[ORM\OneToMany(mappedBy: 'user', targetEntity: Messsage::class, orphanRemoval: true)]
    private $messsages;

    

    
    



    public function __construct()
    {
        $this->formations = new ArrayCollection();
        $this->comments = new ArrayCollection();
        $this->messages = new ArrayCollection();
        $this->sondages = new ArrayCollection();
        $this->evaluations = new ArrayCollection();
        $this->reagits = new ArrayCollection();
        $this->formations_subscibes = new ArrayCollection();
        $this->paiements = new ArrayCollection();
        $this->groupe = new ArrayCollection();
        $this->evaluationFormateurs = new ArrayCollection();
        $this->formationAbonnes = new ArrayCollection();
        $this->commandes = new ArrayCollection();
        $this->participants = new ArrayCollection();
        $this->messsages = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(?string $email): self
    {
        $this->email = $email;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUserIdentifier(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see PasswordAuthenticatedUserInterface
     */
    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(?string $password): self
    {
        $this->password = $password;

        return $this;
    }


    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
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

    public function getLastName(): ?string
    {
        return $this->last_name;
    }

    public function setLastName(?string $last_name): self
    {
        $this->last_name = $last_name;

        return $this;
    }

    public function getCin(): ?int
    {
        return $this->cin;
    }

    public function setCin(?int $cin): self
    {
        $this->cin = $cin;

        return $this;
    }

    public function getLocation(): ?string
    {
        return $this->location;
    }

    public function setLocation(?string $location): self
    {
        $this->location = $location;

        return $this;
    }

    public function getPhoneNbre(): ?int
    {
        return $this->phone_nbre;
    }

    public function setPhoneNbre(?int $phone_nbre): self
    {
        $this->phone_nbre = $phone_nbre;

        return $this;
    }

    public function getIsPayed(): ?bool
    {
        return $this->is_payed;
    }

    public function setIsPayed(?bool $is_payed): self
    {
        $this->is_payed = $is_payed;

        return $this;
    }

    public function getAge(): ?int
    {
        return $this->age;
    }

    public function setAge(?int $age): self
    {
        $this->age = $age;

        return $this;
    }

    

   
    /**
     * @return Collection<int, commentaire>
     */
    public function getComments(): Collection
    {
        return $this->comments;
    }

    public function addComment(commentaire $comment): self
    {
        if (!$this->comments->contains($comment)) {
            $this->comments[] = $comment;
            $comment->setWriter($this);
        }

        return $this;
    }

    public function removeComment(commentaire $comment): self
    {
        if ($this->comments->removeElement($comment)) {
            // set the owning side to null (unless already changed)
            if ($comment->getWriter() === $this) {
                $comment->setWriter(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Message>
     */
    public function getMessages(): Collection
    {
        return $this->messages;
    }

    public function addMessage(Message $message): self
    {
        if (!$this->messages->contains($message)) {
            $this->messages[] = $message;
            $message->setEmitter($this);
        }

        return $this;
    }

    public function removeMessage(Message $message): self
    {
        if ($this->messages->removeElement($message)) {
            // set the owning side to null (unless already changed)
            if ($message->getEmitter() === $this) {
                $message->setEmitter(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Sondage>
     */
    public function getSondages(): Collection
    {
        return $this->sondages;
    }

    public function addSondage(Sondage $sondage): self
    {
        if (!$this->sondages->contains($sondage)) {
            $this->sondages[] = $sondage;
            $sondage->setAdmin($this);
        }

        return $this;
    }

    public function removeSondage(Sondage $sondage): self
    {
        if ($this->sondages->removeElement($sondage)) {
            // set the owning side to null (unless already changed)
            if ($sondage->getAdmin() === $this) {
                $sondage->setAdmin(null);
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
            $evaluation->setCandidat($this);
        }

        return $this;
    }

    public function removeEvaluation(Evaluation $evaluation): self
    {
        if ($this->evaluations->removeElement($evaluation)) {
            // set the owning side to null (unless already changed)
            if ($evaluation->getCandidat() === $this) {
                $evaluation->setCandidat(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Reagit>
     */
    public function getReagits(): Collection
    {
        return $this->reagits;
    }

    public function addReagit(Reagit $reagit): self
    {
        if (!$this->reagits->contains($reagit)) {
            $this->reagits[] = $reagit;
            $reagit->setCandidat($this);
        }

        return $this;
    }

    public function removeReagit(Reagit $reagit): self
    {
        if ($this->reagits->removeElement($reagit)) {
            // set the owning side to null (unless already changed)
            if ($reagit->getCandidat() === $this) {
                $reagit->setCandidat(null);
            }
        }

        return $this;
    }

    



    /**
     * @return Collection<int, Formation>
     */
    public function getFormations(): Collection
    {
        return $this->formations;
    }

    public function addFormation(Formation $formation): self
    {
        if (!$this->formations->contains($formation)) {
            $this->formations[] = $formation;
            $formation->setFormateur($this);
        }

        return $this;
    }

    public function removeFormation(Formation $formation): self
    {
        if ($this->formations->removeElement($formation)) {
            // set the owning side to null (unless already changed)
            if ($formation->getFormateur() === $this) {
                $formation->setFormateur(null);
            }
        }

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
            $paiement->setCustomer($this);
        }

        return $this;
    }

    public function removePaiement(Paiement $paiement): self
    {
        if ($this->paiements->removeElement($paiement)) {
            // set the owning side to null (unless already changed)
            if ($paiement->getCustomer() === $this) {
                $paiement->setCustomer(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Group>
     */
    public function getGroupe(): Collection
    {
        return $this->groupe;
    }

    public function addGroupe(Group $groupe): self
    {
        if (!$this->groupe->contains($groupe)) {
            $this->groupe[] = $groupe;
        }

        return $this;
    }

    public function removeGroupe(Group $groupe): self
    {
        $this->groupe->removeElement($groupe);

        return $this;
    }

    public function getIsVerified(): ?bool
    {
        return $this->isVerified;
    }

    public function setIsVerified(bool $isVerified): self
    {
        $this->isVerified = $isVerified;

        return $this;
    }

    public function isVerified(): bool
    {
        return $this->isVerified;
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

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(?string $image): self
    {
    
        $this->image = $image;

        return $this;
    }

    /**
     * @return Collection<int, EvaluationFormateur>
     */
    public function getEvaluationFormateurs(): Collection
    {
        return $this->evaluationFormateurs;
    }

    public function addEvaluationFormateur(EvaluationFormateur $evaluationFormateur): self
    {
        if (!$this->evaluationFormateurs->contains($evaluationFormateur)) {
            $this->evaluationFormateurs[] = $evaluationFormateur;
            $evaluationFormateur->setFormateur($this);
        }

        return $this;
    }

    public function removeEvaluationFormateur(EvaluationFormateur $evaluationFormateur): self
    {
        if ($this->evaluationFormateurs->removeElement($evaluationFormateur)) {
            // set the owning side to null (unless already changed)
            if ($evaluationFormateur->getFormateur() === $this) {
                $evaluationFormateur->setFormateur(null);
            }
        }

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
            $commande->addUser($this);
        }

        return $this;
    }

    public function removeCommande(Commande $commande): self
    {
        if ($this->commandes->removeElement($commande)) {
            $commande->removeUser($this);
        }

        return $this;
    }

    /**
     * @return Collection<int, Participant>
     */
    public function getParticipants(): Collection
    {
        return $this->participants;
    }

    public function addParticipant(Participant $participant): self
    {
        if (!$this->participants->contains($participant)) {
            $this->participants[] = $participant;
            $participant->setUser($this);
        }

        return $this;
    }

    public function removeParticipant(Participant $participant): self
    {
        if ($this->participants->removeElement($participant)) {
            // set the owning side to null (unless already changed)
            if ($participant->getUser() === $this) {
                $participant->setUser(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Messsage>
     */
    public function getMesssages(): Collection
    {
        return $this->messsages;
    }

    public function addMesssage(Messsage $messsage): self
    {
        if (!$this->messsages->contains($messsage)) {
            $this->messsages[] = $messsage;
            $messsage->setUser($this);
        }

        return $this;
    }

    public function removeMesssage(Messsage $messsage): self
    {
        if ($this->messsages->removeElement($messsage)) {
            // set the owning side to null (unless already changed)
            if ($messsage->getUser() === $this) {
                $messsage->setUser(null);
            }
        }

        return $this;
    }

    

    

   
    

    

   

  
   
}
