<?php

namespace App\Entity;

use App\Repository\ChapitreRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: ChapitreRepository::class)]
class Chapitre
{
    #[Groups(['formateurData','chapters','chapterContent'])]
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[Groups(['formateurData','chapters','chapterContent'])]
    #[ORM\Column(type: 'string', length: 255)]
    private $name;

    #[Groups(['chapters','chapterContent'])]
    #[ORM\ManyToOne(targetEntity: Formation::class, inversedBy: 'chapitres')]
    #[ORM\JoinColumn(nullable: false)]
    private $formation;

    #[Groups(['chapterContent'])]
    #[ORM\OneToMany(mappedBy: 'chapitre', targetEntity: Fichier::class, orphanRemoval: true)]
    private $files;

    
    #[Groups(['chapterContent'])]
    #[ORM\OneToMany(mappedBy: 'chapitre', targetEntity: Video::class, orphanRemoval: true)]
    private $videos;

    #[Groups(['chapterContent'])]
    #[ORM\OneToMany(mappedBy: 'chapitre', targetEntity: Document::class, orphanRemoval: true)]
    private $documents;

    #[ORM\OneToMany(mappedBy: 'chapitre', targetEntity: Commentaire::class)]
    private $comments;


    public function __construct()
    {
        $this->files = new ArrayCollection();
        $this->videos = new ArrayCollection();
        $this->documents = new ArrayCollection();
        $this->comments = new ArrayCollection();
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
     * @return Collection<int, Fichier>
     */
    public function getFiles(): Collection
    {
        return $this->files;
    }

    public function addFile(Fichier $file): self
    {
        if (!$this->files->contains($file)) {
            $this->files[] = $file;
            $file->setChapitre($this);
        }

        return $this;
    }

    public function removeFile(Fichier $file): self
    {
        if ($this->files->removeElement($file)) {
            // set the owning side to null (unless already changed)
            if ($file->getChapitre() === $this) {
                $file->setChapitre(null);
            }
        }

        return $this;
    }

    

    /**
     * @return Collection<int, Video>
     */
    public function getVideos(): Collection
    {
        return $this->videos;
    }

    public function addVideo(Video $video): self
    {
        if (!$this->videos->contains($video)) {
            $this->videos[] = $video;
            $video->setChapitre($this);
        }

        return $this;
    }

    public function removeVideo(Video $video): self
    {
        if ($this->videos->removeElement($video)) {
            // set the owning side to null (unless already changed)
            if ($video->getChapitre() === $this) {
                $video->setChapitre(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Document>
     */
    public function getDocuments(): Collection
    {
        return $this->documents;
    }

    public function addDocument(Document $document): self
    {
        if (!$this->documents->contains($document)) {
            $this->documents[] = $document;
            $document->setChapitre($this);
        }

        return $this;
    }

    public function removeDocument(Document $document): self
    {
        if ($this->documents->removeElement($document)) {
            // set the owning side to null (unless already changed)
            if ($document->getChapitre() === $this) {
                $document->setChapitre(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Commentaire>
     */
    public function getComments(): Collection
    {
        return $this->comments;
    }

    public function addComment(Commentaire $comment): self
    {
        if (!$this->comments->contains($comment)) {
            $this->comments[] = $comment;
            $comment->setChapitre($this);
        }

        return $this;
    }

    public function removeComment(Commentaire $comment): self
    {
        if ($this->comments->removeElement($comment)) {
            // set the owning side to null (unless already changed)
            if ($comment->getChapitre() === $this) {
                $comment->setChapitre(null);
            }
        }

        return $this;
    }
}
