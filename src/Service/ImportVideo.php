<?php

namespace App\Service;

use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\String\Slugger\SluggerInterface;

class ImportVideo
{
    private $videoDirectory;
    private $slugger;

    public function __construct($videoDirectory, SluggerInterface $slugger)
    {
        $this->videoDirectory = $videoDirectory;
        $this->slugger = $slugger;
    }

    public function uploadVideo(UploadedFile $file)
    {
        $originalFilename = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
        $safeFilename = $this->slugger->slug($originalFilename);
        $fileName = $safeFilename.'-'.uniqid().'.'.$file->guessExtension();

        try {
            $file->move($this->getVideotDirectory(), $fileName);
        } catch (FileException $e) {
            echo 'Exception reçue : ',  $e->getMessage(), "\n";
        }

        return $fileName;
    }

    public function getVideotDirectory()
    {
        return $this->videoDirectory;
    }
}