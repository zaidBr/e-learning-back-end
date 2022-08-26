<?php

namespace App\Repository;

use App\Entity\Formation;
use Doctrine\DBAL\Connection;
use Doctrine\ORM\ORMException;
use Doctrine\DBAL\DriverManager;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;

/**
 * @method Formation|null find($id, $lockMode = null, $lockVersion = null)
 * @method Formation|null findOneBy(array $criteria, array $orderBy = null)
 * @method Formation[]    findAll()
 * @method Formation[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class FormationRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry, public Connection $conn)
    {
        parent::__construct($registry, Formation::class);
        
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function add(Formation $entity, bool $flush = true): void
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
    public function remove(Formation $entity, bool $flush = true): void
    {
        $this->_em->remove($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    public function getFormationByType( $type){
        $qb = $this->createQueryBuilder('f')
        ->where('f.type = :type')
        ->setParameter('type' , $type);
        $query = $qb->getQuery();
        return $query->execute();
        
    }

    public function publicShow(){
    $entityManager = $this->getEntityManager();
    $query = $entityManager->createQuery(
                'SELECT f.id, f.name, f.description, f.price, f.type, f.date_start, f.image, f.periode
                 FROM App\Entity\Formation f'
    );
    return $query->getResult();
    }
    
    public function bestFormation(){
        $entityManager = $this->getEntityManager();
        $query = $entityManager->createQuery(
                    'SELECT sum(e.satrs) / count(e.id) as rate, f.name as nameF, f.id, f.periode,
                    f.price, f.description, f.image, f.type, f.short_description, for.name, for.image as imageFor, f.date_start, f.periode
                     FROM App\Entity\Formation f, App\Entity\Evaluation e, App\Entity\User for
                     Where e.formation = f.id
                     And for.id = f.formateur
                     Group by f.id
                     Order by sum(e.satrs) desc
                     '
        );
        
        return $query->setMaxResults(10)->getResult();
        }
        public function currentRatePercentage($id){
            $entityManager = $this->getEntityManager();
        $query = $entityManager->createQuery(
                    'SELECT ((sum(e.satrs)/count(e.id))/5)*100 as rate, count(e.id) as nbPerson
                     FROM  App\Entity\Evaluation e
                     Where e.formation = :id
                     '
        );
        
        return $query->setParameter('id',$id)->getResult();
        }
    

        public function maxMinForamtion(){
            $entityManager = $this->getEntityManager();
            $query = $entityManager->createQuery(
                        'SELECT sum(e.satrs)/count(e.id) as rate, f.name, f.id, f.periode, f.price, f.description, f.image, f.type, f.short_description
                         FROM App\Entity\Formation f, App\Entity\Evaluation e, App\Entity\User t
                         Where e.formation = f.id
                         And f.formateur = t.id
                         Group by f.id
                         Order by sum(e.satrs) desc
                         '
            );
            
            return $query->getResult();
            }



    // /**
    //  * @return Formation[] Returns an array of Formation objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('f')
            ->andWhere('f.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('f.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Formation
    {
        return $this->createQueryBuilder('f')
            ->andWhere('f.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
