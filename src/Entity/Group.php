<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Repository\GroupRepository;
use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\ArrayCollection;
use Gedmo\Timestampable\Traits\TimestampableEntity;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: GroupRepository::class)]
#[ORM\Table(name: '`group`')]
class Group
{
    use TimestampableEntity;


    #[Groups(['formateurData','public','subscribe','chapters'])]
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;


    #[Groups(['formateurData','subscribe','public'])]
    #[ORM\Column(type: 'string', length: 255)]
    private $name;


    #[Groups(['formateurData','public','subscribe'])]
    #[ORM\Column(type: 'integer')]
    private $max_size;

    #[ORM\ManyToOne(targetEntity: Formation::class, inversedBy: 'groups')]
    private $formation;

    #[ORM\OneToMany(mappedBy: 'receiver', targetEntity: Message::class, orphanRemoval: true)]
    private $messages;


    #[Groups(['formateurData','public'])]
    #[ORM\ManyToMany(targetEntity: User::class, mappedBy: 'groupe')]
    private $users;

    #[Groups(['chapters'])]
    #[ORM\OneToOne(inversedBy: 'groupp', targetEntity: VideoConfernce::class, cascade: ['persist', 'remove'])]
    private $meeting;

    public function __construct()
    {
        $this->messages = new ArrayCollection();
        $this->users = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getMaxSize(): ?int
    {
        return $this->max_size;
    }

    public function setMaxSize(int $max_size): self
    {
        $this->max_size = $max_size;

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
            $message->setReceiver($this);
        }

        return $this;
    }

    public function removeMessage(Message $message): self
    {
        if ($this->messages->removeElement($message)) {
            // set the owning side to null (unless already changed)
            if ($message->getReceiver() === $this) {
                $message->setReceiver(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, User>
     */
    public function getUsers(): Collection
    {
        return $this->users;
    }

    public function addUser(User $user): self
    {
        if (!$this->users->contains($user)) {
            $this->users[] = $user;
            $user->addGroupe($this);
        }

        return $this;
    }

    public function removeUser(User $user): self
    {
        if ($this->users->removeElement($user)) {
            $user->removeGroupe($this);
        }

        return $this;
    }

    public function getMeeting(): ?VideoConfernce
    {
        return $this->meeting;
    }

    public function setMeeting(?VideoConfernce $meeting): self
    {
        $this->meeting = $meeting;

        return $this;
    }

    
}
