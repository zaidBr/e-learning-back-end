<?php

namespace App\Service;

use App\Api\FileUploadModel;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Component\HttpFoundation\File\File;

class ImportFichier
{
    private $targetDirectory;
    private $imageUserTargetDir;
    private $slugger;
    private $targetDirectoryFile;
    private $targetDirectoryVideo;


    public function __construct(
    string $targetDirectory,
    string $targetDirectoryFile,
    string $imageUserTargetDir,
    string $targetDirectoryVideo,
    SluggerInterface $slugger)
    {
        $this->targetDirectory = $targetDirectory;
        $this->targetDirectoryVideo = $targetDirectoryVideo;
        $this->slugger = $slugger;
        $this->targetDirectoryFile = $targetDirectoryFile;
        $this->imageUserTargetDir = $imageUserTargetDir;
    }

    public function uploadFile(UploadedFile $file)
    {
    
        $originalFilename = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
        $safeFilename = $this->slugger->slug($originalFilename);
        $fileName = $safeFilename.'-'.uniqid().'.'.$file->guessExtension();

        try {
            $file->move($this->getTargetDirectoryFile(), $fileName);
        } catch (FileException $e) {
            echo 'Exception reçue : ',  $e->getMessage();
        }

        return $fileName;
    }
    public function uploadVideoF(UploadedFile $file)
    {
        $originalFilename = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
        $safeFilename = $this->slugger->slug($originalFilename);
        $fileName = $safeFilename.'-'.uniqid().'.'.$file->guessExtension();

        try {
            $file->move($this->getTargetDirectoryVideoF(), $fileName);
        } catch (FileException $e) {
            echo 'Exception reçue : ',  $e->getMessage(), "\n";
        }

        return $fileName;
    }

    public function uploadFileF(UploadedFile $file)
    {
        $originalFilename = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
        $safeFilename = $this->slugger->slug($originalFilename);
        $fileName = $safeFilename.'-'.uniqid().'.'.$file->guessExtension();

        try {
            $file->move($this->getTargetDirectoryFile(), $fileName);
        } catch (FileException $e) {
            echo 'Exception reçue : ',  $e->getMessage(), "\n";
        }

        return $fileName;
    }



    public function uploadImageUser(UploadedFile $file)
    {
    
        $originalFilename = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
        $safeFilename = $this->slugger->slug($originalFilename);
        $fileName = $safeFilename.'-'.uniqid().'.'.$file->guessExtension();

        try {
            $file->move($this->getTargetDirectoryImageU(), $fileName);
        } catch (FileException $e) {
            echo 'Exception reçue : ',  $e->getMessage();
        }

        return $fileName;
    }
    



    public function getTargetDirectoryFile()
    {
        return $this->targetDirectoryFile;
    }
    public function getTargetDirectory()
    {
        return $this->targetDirectory;
    }
    public function getTargetDirectoryImageU()
    {
        return $this->imageUserTargetDir;
    }
    public function getTargetDirectoryVideoF()
    {
        return $this->targetDirectoryVideo;
    }
    
}