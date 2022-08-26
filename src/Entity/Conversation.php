<?php

namespace App\Entity;

use App\Repository\ConversationRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ConversationRepository::class)]
class Conversation
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\OneToOne(targetEntity: Group::class, cascade: ['persist', 'remove'])]
    #[ORM\JoinColumn(nullable: false)]
    private $groupe;

    #[ORM\OneToMany(mappedBy: 'conversation', targetEntity: Participant::class, orphanRemoval: true)]
    private $participants;

    #[ORM\OneToMany(mappedBy: 'conversation', targetEntity: Messsage::class, orphanRemoval: true)]
    private $messsages;

    #[ORM\OneToOne(targetEntity: Messsage::class, cascade: ['persist', 'remove'])]
    #[ORM\JoinColumn(nullable: false)]
    private $last_message;

    public function __construct()
    {
        $this->participants = new ArrayCollection();
        $this->messsages = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getGroupe(): ?Group
    {
        return $this->groupe;
    }

    public function setGroupe(Group $groupe): self
    {
        $this->groupe = $groupe;

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
            $participant->setConversation($this);
        }

        return $this;
    }

    public function removeParticipant(Participant $participant): self
    {
        if ($this->participants->removeElement($participant)) {
            // set the owning side to null (unless already changed)
            if ($participant->getConversation() === $this) {
                $participant->setConversation(null);
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
            $messsage->setConversation($this);
        }

        return $this;
    }

    public function removeMesssage(Messsage $messsage): self
    {
        if ($this->messsages->removeElement($messsage)) {
            // set the owning side to null (unless already changed)
            if ($messsage->getConversation() === $this) {
                $messsage->setConversation(null);
            }
        }

        return $this;
    }

    public function getLastMessage(): ?Messsage
    {
        return $this->last_message;
    }

    public function setLastMessage(Messsage $last_message): self
    {
        $this->last_message = $last_message;

        return $this;
    }
}
