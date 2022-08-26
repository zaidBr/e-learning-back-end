<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220621162309 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE `group` ADD meeting_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE `group` ADD CONSTRAINT FK_6DC044C567433D9C FOREIGN KEY (meeting_id) REFERENCES video_confernce (id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_6DC044C567433D9C ON `group` (meeting_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE `group` DROP FOREIGN KEY FK_6DC044C567433D9C');
        $this->addSql('DROP INDEX UNIQ_6DC044C567433D9C ON `group`');
        $this->addSql('ALTER TABLE `group` DROP meeting_id');
    }
}
