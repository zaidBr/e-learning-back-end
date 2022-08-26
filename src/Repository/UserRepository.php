<?php

namespace App\Repository;

use Exception;
use App\Entity\User;
use DateTimeImmutable;
use Doctrine\ORM\ORMException;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Security\Core\User\PasswordUpgraderInterface;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Component\Security\Core\Exception\UnsupportedUserException;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;

/**
 * @method User|null find($id, $lockMode = null, $lockVersion = null)
 * @method User|null findOneBy(array $criteria, array $orderBy = null)
 * @method User[]    findAll()
 * @method User[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UserRepository extends ServiceEntityRepository implements PasswordUpgraderInterface
{
   private $passwordHasher;
    public function __construct(
        ManagerRegistry $registry,
        UserPasswordHasherInterface $passwordHasher 
        )
    {
        parent::__construct($registry, User::class);
        $this->passwordHasher = $passwordHasher;
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function add(User $entity, bool $flush = true): void
    {
        $this->_em->persist($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function remove(User $entity, bool $flush = true): void
    {
        $this->_em->remove($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    /**
     * Used to upgrade (rehash) the user's password automatically over time.
     */
    public function upgradePassword(PasswordAuthenticatedUserInterface $user, string $newHashedPassword): void
    {
        if (!$user instanceof User) {
            throw new UnsupportedUserException(sprintf('Instances of "%s" are not supported.', \get_class($user)));
        }

        $user->setPassword($newHashedPassword);
        $this->_em->persist($user);
        $this->_em->flush();
    }

   
    
    public function create($data)
    {
        $user = new User();
        
        $user->setLastName($data->lastName);
        $user->setName($data->name);
        $user->setEmail($data->email);
        $user->setRoles(["ROLE_USER"]);
        $plainPass= $data->plainPassword;
            $hashedPassword=$this->passwordHasher->hashPassword($user, $plainPass);
            $user->setPassword($hashedPassword);
            $this->_em->persist($user);
            $this->_em->flush();
            return $user;
    }

    public function getByRole($role)
    {
        $role = mb_strtoupper($role);

        return $this->createQueryBuilder('u')
            ->andWhere('JSON_CONTAINS(u.roles, :role) = 1')
            ->setParameter('role', '"ROLE_' . $role . '"')
            ->getQuery()
            ->getResult();
    }

    public function getPerWeek($role){
        $role = mb_strtoupper($role);
        $start_week = date("Y-m-d",strtotime('monday this week'));
        $end_week = date("Y-m-d",strtotime('sunday this week'));
        return $this->createQueryBuilder('u')
            ->andWhere('JSON_CONTAINS(u.roles, :role) = 1')
            ->andWhere('u.createdAt >= :start')
            ->andWhere('u.createdAt <= :end')
            ->setParameter('role', '"ROLE_' . $role . '"')
            ->setParameter('start',$start_week)                      
            ->setParameter('end',$end_week)
            ->getQuery()
            ->getResult();
    }
    public function getPerMonth($role){
        $role = mb_strtoupper($role);
        $start_month = date("Y-m-d",strtotime('midnight first day of this month'));
        // $start_month = date('Y-m-d h:i:s', strtotime("-30 days"));
        $end_month = date("Y-m-d",strtotime('last day of this month'));
        // _week = new \DateTimeImmutable();
        return $this->createQueryBuilder('u')
            ->andWhere('JSON_CONTAINS(u.roles, :role) = 1')
            ->andWhere('u.createdAt >= :start')
            ->andWhere('u.createdAt <= :end')
            ->setParameter('role', '"ROLE_' . $role . '"')
            ->setParameter('start',$start_month)
            ->setParameter('end',$end_month)               
            ->getQuery()
            ->getResult();
    }
    public function getPerDay($role){
        $role = mb_strtoupper($role);
        $today = date("Y-m-d ");
        return $this->createQueryBuilder('u')
            ->andWhere('JSON_CONTAINS(u.roles, :role) = 1')
            ->andWhere('u.createdAt >= :today')
            ->setParameter('role', '"ROLE_' . $role . '"')
            ->setParameter('today',$today)                      
            ->getQuery()
            ->getResult();
    }
    public function getALL($role){
        $qb = $this->createQueryBuilder('u');
        return $qb
              ->where('u.roles LIKE :role')
              ->setParameter('role','%"'.$role.'"%')
              ->orderBy('u.id', 'ASC')
             ->getQuery()
             ->execute();
    }
    public function bestFormateur(){
        $entityManager = $this->getEntityManager();
        $query = $entityManager->createQuery(
                    'SELECT sum(eF.stars)/count(eF.id) as rate, f.name, f.last_name, f.description ,  count(for.id) as nbFormation
                     FROM App\Entity\User f, App\Entity\EvaluationFormateur eF, App\Entity\Formation for
                     Where eF.formateur = f.id
                     And for.formateur = f.id
                     Group by f.id
                     Order by sum(eF.stars) desc
                     '
        );
        
        return $query->setMaxResults(10)->getResult();
        }
        public function rateFormateur($id){
            $entityManager = $this->getEntityManager();
            $query = $entityManager->createQuery(
                        'SELECT (sum(eF.stars)/(count(eF.id)*5))*100 as rate, count(eF.id) as nbPerson
                         FROM App\Entity\EvaluationFormateur eF
                         Where eF.formateur = :id
                         '
            );
            return $query->setParameter('id', $id)->getResult();
            }
            public function myAllCourses($id){
                $entityManager = $this->getEntityManager();
                $query = $entityManager->createQuery(
                        'SELECT count(f.id) nbCourses
                         FROM App\Entity\Formation f
                         Where f.formateur = :id
                         '
            );
            return $query->setParameter('id', $id)->getResult();
            }

            public function myActualCourses($id){
                $entityManager = $this->getEntityManager();
                $query = $entityManager->createQuery(
                        'SELECT count(f.id) nbCourses, t.name
                         FROM App\Entity\Formation f,App\Entity\User t 
                         Where f.formateur = :id
                         And f.session_is_oppen = true
                         And t.id = :id
                         '
            );
            return $query->setParameter('id', $id)->getResult();
            }



    // /**
    //  * @return User[] Returns an array of User objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('u.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?User
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
    
}
