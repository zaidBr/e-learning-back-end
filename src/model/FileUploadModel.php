<?php
namespace App\Api;
use Symfony\Component\Validator\Constraints as Assert;
class ArticleReferenceUploadApiModel
{
    /**
     * @Assert\NotBlank()
     */
    public $filename;
    /**
     * @Assert\NotBlank()
     */
    public $value;
}