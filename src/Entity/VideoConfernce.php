<?php

namespace App\Entity;

use App\Repository\VideoConfernceRepository;
use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Timestampable\Traits\TimestampableEntity;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: VideoConfernceRepository::class)]
class VideoConfernce
{
    use TimestampableEntity;

    #[Groups(['chapters'])]
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[Groups(['chapters'])]
    #[ORM\Column(type: 'string', length: 255)]
    private $title;

    #[Groups(['chapters'])]
    #[ORM\Column(type: 'string', length: 255)]
    private $url_meeting;

    #[ORM\OneToOne(mappedBy: 'meeting', targetEntity: Group::class, cascade: ['persist', 'remove'])]
    private $groupp;

    

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

    public function getUrlMeeting(): ?string
    {
        return $this->url_meeting;
    }

    public function setUrlMeeting(string $url_meeting): self
    {
        $this->url_meeting = $url_meeting;

        return $this;
    }

    public function getGroupp(): ?Group
    {
        return $this->groupp;
    }

    public function setGroupp(?Group $groupp): self
    {
        // unset the owning side of the relation if necessary
        if ($groupp === null && $this->groupp !== null) {
            $this->groupp->setMeeting(null);
        }

        // set the owning side of the relation if necessary
        if ($groupp !== null && $groupp->getMeeting() !== $this) {
            $groupp->setMeeting($this);
        }

        $this->groupp = $groupp;

        return $this;
    }

    
}
