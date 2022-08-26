<?php

namespace App\Entity;

use App\Repository\QuizRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: QuizRepository::class)]
class Quiz
{
    #[Groups(['quiz'])]
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[Groups(['quiz'])]
    #[ORM\Column(type: 'text')]
    private $question;

    #[Groups(['quiz'])]
    #[ORM\Column(type: 'integer')]
    private $correct_answer;

    #[Groups(['quiz'])]
    #[ORM\Column(type: 'integer')]
    private $time_per_question;

    
    #[ORM\ManyToOne(targetEntity: Formation::class, inversedBy: 'quizzes')]
    #[ORM\JoinColumn(nullable: false)]
    private $formation;

    #[Groups(['quiz'])]
    #[ORM\Column(type: 'text')]
    private $choise_one;

    #[Groups(['quiz'])]
    #[ORM\Column(type: 'text')]
    private $choise_two;

    #[Groups(['quiz'])]
    #[ORM\Column(type: 'text', nullable: true)]
    private $choise_three;

    #[Groups(['quiz'])]
    #[ORM\Column(type: 'text', nullable: true)]
    private $choise_for;

    #[Groups(['quiz'])]
    #[ORM\Column(type: 'text', nullable: true)]
    private $choise_five;

    public function __construct()
    {
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getQuestion(): ?string
    {
        return $this->question;
    }

    public function setQuestion(string $question): self
    {
        $this->question = $question;

        return $this;
    }

    public function getCorrectAnswer(): ?int
    {
        return $this->correct_answer;
    }

    public function setCorrectAnswer(int $correct_answer): self
    {
        $this->correct_answer = $correct_answer;

        return $this;
    }

    public function getTimePerQuestion(): ?int
    {
        return $this->time_per_question;
    }

    public function setTimePerQuestion(int $time_per_question): self
    {
        $this->time_per_question = $time_per_question;

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

    public function getChoiseOne(): ?string
    {
        return $this->choise_one;
    }

    public function setChoiseOne(string $choise_one): self
    {
        $this->choise_one = $choise_one;

        return $this;
    }

    public function getChoiseTwo(): ?string
    {
        return $this->choise_two;
    }

    public function setChoiseTwo(string $choise_two): self
    {
        $this->choise_two = $choise_two;

        return $this;
    }

    public function getChoiseThree(): ?string
    {
        return $this->choise_three;
    }

    public function setChoiseThree(?string $choise_three): self
    {
        $this->choise_three = $choise_three;

        return $this;
    }

    public function getChoiseFor(): ?string
    {
        return $this->choise_for;
    }

    public function setChoiseFor(?string $choise_for): self
    {
        $this->choise_for = $choise_for;

        return $this;
    }

    public function getChoiseFive(): ?string
    {
        return $this->choise_five;
    }

    public function setChoiseFive(?string $choise_five): self
    {
        $this->choise_five = $choise_five;

        return $this;
    }
}
