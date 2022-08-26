<?php

namespace App\Entity;

use App\Repository\MessageRepository;
use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Timestampable\Traits\TimestampableEntity;


#[ORM\Entity(repositoryClass: MessageRepository::class)]
class Message
{
    use TimestampableEntity;

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'text')]
    private $content;

    

    #[ORM\ManyToOne(targetEntity: Group::class, inversedBy: 'messages')]
    #[ORM\JoinColumn(nullable: false)]
    private $receiver;

    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: 'messages')]
    #[ORM\JoinColumn(nullable: false)]
    private $emitter;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(string $content): self
    {
        $this->content = $content;

        return $this;
    }

    public function getTimeCreated(): ?\DateTimeInterface
    {
        return $this->time_created;
    }

    public function setTimeCreated(\DateTimeInterface $time_created): self
    {
        $this->time_created = $time_created;

        return $this;
    }

    public function getDateCreated(): ?\DateTimeInterface
    {
        return $this->date_created;
    }

    public function setDateCreated(\DateTimeInterface $date_created): self
    {
        $this->date_created = $date_created;

        return $this;
    }

    public function getReceiver(): ?group
    {
        return $this->receiver;
    }

    public function setReceiver(?group $receiver): self
    {
        $this->receiver = $receiver;

        return $this;
    }

    public function getEmitter(): ?User
    {
        return $this->emitter;
    }

    public function setEmitter(?User $emitter): self
    {
        $this->emitter = $emitter;

        return $this;
    }
}
