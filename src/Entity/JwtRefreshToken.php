<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Repository\JwtRefreshTokenRepository;
use Gesdinet\JWTRefreshTokenBundle\Entity\RefreshToken;

#[ORM\Entity(repositoryClass: JwtRefreshTokenRepository::class)]
class JwtRefreshToken extends RefreshToken
{
   
}
