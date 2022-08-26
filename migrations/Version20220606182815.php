<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220606182815 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE calenderier (id INT AUTO_INCREMENT NOT NULL, formation_id INT NOT NULL, title VARCHAR(255) NOT NULL, start DATETIME NOT NULL, INDEX IDX_874767775200282E (formation_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE categorie (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, description LONGTEXT DEFAULT NULL, short_description LONGTEXT DEFAULT NULL, image VARCHAR(255) DEFAULT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE chapitre (id INT AUTO_INCREMENT NOT NULL, formation_id INT NOT NULL, name VARCHAR(255) NOT NULL, INDEX IDX_8C62B0255200282E (formation_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE commande (id INT AUTO_INCREMENT NOT NULL, status VARCHAR(50) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE commande_formation (commande_id INT NOT NULL, formation_id INT NOT NULL, INDEX IDX_504C7BFD82EA2E54 (commande_id), INDEX IDX_504C7BFD5200282E (formation_id), PRIMARY KEY(commande_id, formation_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE commande_user (commande_id INT NOT NULL, user_id INT NOT NULL, INDEX IDX_E6FFD7AA82EA2E54 (commande_id), INDEX IDX_E6FFD7AAA76ED395 (user_id), PRIMARY KEY(commande_id, user_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE commentaire (id INT AUTO_INCREMENT NOT NULL, writer_id INT NOT NULL, chapitre_id INT DEFAULT NULL, comment LONGTEXT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_67F068BC1BC7E6B6 (writer_id), INDEX IDX_67F068BC1FBEEF7B (chapitre_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE document (id INT AUTO_INCREMENT NOT NULL, chapitre_id INT NOT NULL, text LONGTEXT NOT NULL, INDEX IDX_D8698A761FBEEF7B (chapitre_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE evaluation (id INT AUTO_INCREMENT NOT NULL, formation_id INT NOT NULL, candidat_id INT NOT NULL, comment LONGTEXT DEFAULT NULL, satrs INT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_1323A5755200282E (formation_id), INDEX IDX_1323A5758D0EB82 (candidat_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE evaluation_formateur (id INT AUTO_INCREMENT NOT NULL, formateur_id INT NOT NULL, candidat_id INT NOT NULL, stars INT NOT NULL, comment LONGTEXT DEFAULT NULL, INDEX IDX_3F76B5CB155D8F51 (formateur_id), INDEX IDX_3F76B5CB8D0EB82 (candidat_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE fichier (id INT AUTO_INCREMENT NOT NULL, chapitre_id INT NOT NULL, title VARCHAR(255) NOT NULL, description LONGTEXT NOT NULL, file_path VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_9B76551F1FBEEF7B (chapitre_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE formation (id INT AUTO_INCREMENT NOT NULL, formateur_id INT NOT NULL, categorie_id INT NOT NULL, videos_meetings_id INT DEFAULT NULL, name VARCHAR(255) NOT NULL, description LONGTEXT NOT NULL, type VARCHAR(10) NOT NULL, date_start VARCHAR(255) NOT NULL, session_is_oppen TINYINT(1) NOT NULL, is_visible TINYINT(1) NOT NULL, price DOUBLE PRECISION NOT NULL, image VARCHAR(255) DEFAULT NULL, periode VARCHAR(255) NOT NULL, short_description LONGTEXT DEFAULT NULL, nb_chapter INT DEFAULT NULL, specification LONGTEXT DEFAULT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_404021BF155D8F51 (formateur_id), INDEX IDX_404021BFBCF5E72D (categorie_id), UNIQUE INDEX UNIQ_404021BFC8257048 (videos_meetings_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE `group` (id INT AUTO_INCREMENT NOT NULL, formation_id INT DEFAULT NULL, name VARCHAR(255) NOT NULL, max_size INT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_6DC044C55200282E (formation_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE jwt_refresh_token (id INT AUTO_INCREMENT NOT NULL, refresh_token VARCHAR(128) NOT NULL, username VARCHAR(255) NOT NULL, valid DATETIME NOT NULL, UNIQUE INDEX UNIQ_9F3D9535C74F2195 (refresh_token), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE message (id INT AUTO_INCREMENT NOT NULL, receiver_id INT NOT NULL, emitter_id INT NOT NULL, content LONGTEXT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_B6BD307FCD53EDB6 (receiver_id), INDEX IDX_B6BD307F37BC4DC6 (emitter_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE paiement (id INT AUTO_INCREMENT NOT NULL, customer_id INT NOT NULL, ordre_id INT NOT NULL, is_payed TINYINT(1) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_B1DC7A1E9395C3F3 (customer_id), INDEX IDX_B1DC7A1E9291498C (ordre_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE quizz (id INT AUTO_INCREMENT NOT NULL, chapitre_id INT NOT NULL, title VARCHAR(255) NOT NULL, question LONGTEXT NOT NULL, correct_answer VARCHAR(255) NOT NULL, choise_one VARCHAR(10) NOT NULL, choise_two VARCHAR(50) NOT NULL, choise_three VARCHAR(50) DEFAULT NULL, choise_for VARCHAR(50) DEFAULT NULL, choise_five VARCHAR(50) DEFAULT NULL, time_per_question INT DEFAULT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_7C77973D1FBEEF7B (chapitre_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE reagit (id INT AUTO_INCREMENT NOT NULL, sondage_id INT NOT NULL, candidat_id INT NOT NULL, is_intersted TINYINT(1) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_8BAFDD5CBAF4AE56 (sondage_id), INDEX IDX_8BAFDD5C8D0EB82 (candidat_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE refresh_tokens (id INT AUTO_INCREMENT NOT NULL, refresh_token VARCHAR(128) NOT NULL, username VARCHAR(255) NOT NULL, valid DATETIME NOT NULL, UNIQUE INDEX UNIQ_9BACE7E1C74F2195 (refresh_token), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE reset_password_request (id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, selector VARCHAR(20) NOT NULL, hashed_token VARCHAR(100) NOT NULL, requested_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', expires_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_7CE748AA76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE resultat_quizz (id INT AUTO_INCREMENT NOT NULL, quizz_id INT NOT NULL, user_id INT NOT NULL, choise_selected VARCHAR(50) NOT NULL, nbre_bad_answer INT DEFAULT NULL, nbre_good_answer INT DEFAULT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_30B832EFBA934BCD (quizz_id), INDEX IDX_30B832EFA76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE sondage (id INT AUTO_INCREMENT NOT NULL, admin_id INT NOT NULL, title VARCHAR(255) NOT NULL, text LONGTEXT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_7579C89F642B8210 (admin_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE `user` (id INT AUTO_INCREMENT NOT NULL, email VARCHAR(180) NOT NULL, roles LONGTEXT NOT NULL COMMENT \'(DC2Type:json)\', password VARCHAR(255) NOT NULL, name VARCHAR(255) NOT NULL, last_name VARCHAR(255) NOT NULL, cin INT DEFAULT NULL, location VARCHAR(255) DEFAULT NULL, phone_nbre INT DEFAULT NULL, is_payed TINYINT(1) NOT NULL, age INT DEFAULT NULL, is_verified TINYINT(1) NOT NULL, description LONGTEXT DEFAULT NULL, image VARCHAR(255) DEFAULT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, UNIQUE INDEX UNIQ_8D93D649E7927C74 (email), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user_group (user_id INT NOT NULL, group_id INT NOT NULL, INDEX IDX_8F02BF9DA76ED395 (user_id), INDEX IDX_8F02BF9DFE54D947 (group_id), PRIMARY KEY(user_id, group_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE video (id INT AUTO_INCREMENT NOT NULL, chapitre_id INT NOT NULL, url_video VARCHAR(255) NOT NULL, title VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_7CC7DA2C1FBEEF7B (chapitre_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE video_confernce (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(255) NOT NULL, url_meeting VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE calenderier ADD CONSTRAINT FK_874767775200282E FOREIGN KEY (formation_id) REFERENCES formation (id)');
        $this->addSql('ALTER TABLE chapitre ADD CONSTRAINT FK_8C62B0255200282E FOREIGN KEY (formation_id) REFERENCES formation (id)');
        $this->addSql('ALTER TABLE commande_formation ADD CONSTRAINT FK_504C7BFD82EA2E54 FOREIGN KEY (commande_id) REFERENCES commande (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE commande_formation ADD CONSTRAINT FK_504C7BFD5200282E FOREIGN KEY (formation_id) REFERENCES formation (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE commande_user ADD CONSTRAINT FK_E6FFD7AA82EA2E54 FOREIGN KEY (commande_id) REFERENCES commande (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE commande_user ADD CONSTRAINT FK_E6FFD7AAA76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE commentaire ADD CONSTRAINT FK_67F068BC1BC7E6B6 FOREIGN KEY (writer_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE commentaire ADD CONSTRAINT FK_67F068BC1FBEEF7B FOREIGN KEY (chapitre_id) REFERENCES chapitre (id)');
        $this->addSql('ALTER TABLE document ADD CONSTRAINT FK_D8698A761FBEEF7B FOREIGN KEY (chapitre_id) REFERENCES chapitre (id)');
        $this->addSql('ALTER TABLE evaluation ADD CONSTRAINT FK_1323A5755200282E FOREIGN KEY (formation_id) REFERENCES formation (id)');
        $this->addSql('ALTER TABLE evaluation ADD CONSTRAINT FK_1323A5758D0EB82 FOREIGN KEY (candidat_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE evaluation_formateur ADD CONSTRAINT FK_3F76B5CB155D8F51 FOREIGN KEY (formateur_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE evaluation_formateur ADD CONSTRAINT FK_3F76B5CB8D0EB82 FOREIGN KEY (candidat_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE fichier ADD CONSTRAINT FK_9B76551F1FBEEF7B FOREIGN KEY (chapitre_id) REFERENCES chapitre (id)');
        $this->addSql('ALTER TABLE formation ADD CONSTRAINT FK_404021BF155D8F51 FOREIGN KEY (formateur_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE formation ADD CONSTRAINT FK_404021BFBCF5E72D FOREIGN KEY (categorie_id) REFERENCES categorie (id)');
        $this->addSql('ALTER TABLE formation ADD CONSTRAINT FK_404021BFC8257048 FOREIGN KEY (videos_meetings_id) REFERENCES video_confernce (id)');
        $this->addSql('ALTER TABLE `group` ADD CONSTRAINT FK_6DC044C55200282E FOREIGN KEY (formation_id) REFERENCES formation (id)');
        $this->addSql('ALTER TABLE message ADD CONSTRAINT FK_B6BD307FCD53EDB6 FOREIGN KEY (receiver_id) REFERENCES `group` (id)');
        $this->addSql('ALTER TABLE message ADD CONSTRAINT FK_B6BD307F37BC4DC6 FOREIGN KEY (emitter_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE paiement ADD CONSTRAINT FK_B1DC7A1E9395C3F3 FOREIGN KEY (customer_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE paiement ADD CONSTRAINT FK_B1DC7A1E9291498C FOREIGN KEY (ordre_id) REFERENCES formation (id)');
        $this->addSql('ALTER TABLE quizz ADD CONSTRAINT FK_7C77973D1FBEEF7B FOREIGN KEY (chapitre_id) REFERENCES chapitre (id)');
        $this->addSql('ALTER TABLE reagit ADD CONSTRAINT FK_8BAFDD5CBAF4AE56 FOREIGN KEY (sondage_id) REFERENCES sondage (id)');
        $this->addSql('ALTER TABLE reagit ADD CONSTRAINT FK_8BAFDD5C8D0EB82 FOREIGN KEY (candidat_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE reset_password_request ADD CONSTRAINT FK_7CE748AA76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE resultat_quizz ADD CONSTRAINT FK_30B832EFBA934BCD FOREIGN KEY (quizz_id) REFERENCES quizz (id)');
        $this->addSql('ALTER TABLE resultat_quizz ADD CONSTRAINT FK_30B832EFA76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE sondage ADD CONSTRAINT FK_7579C89F642B8210 FOREIGN KEY (admin_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE user_group ADD CONSTRAINT FK_8F02BF9DA76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE user_group ADD CONSTRAINT FK_8F02BF9DFE54D947 FOREIGN KEY (group_id) REFERENCES `group` (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE video ADD CONSTRAINT FK_7CC7DA2C1FBEEF7B FOREIGN KEY (chapitre_id) REFERENCES chapitre (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE formation DROP FOREIGN KEY FK_404021BFBCF5E72D');
        $this->addSql('ALTER TABLE commentaire DROP FOREIGN KEY FK_67F068BC1FBEEF7B');
        $this->addSql('ALTER TABLE document DROP FOREIGN KEY FK_D8698A761FBEEF7B');
        $this->addSql('ALTER TABLE fichier DROP FOREIGN KEY FK_9B76551F1FBEEF7B');
        $this->addSql('ALTER TABLE quizz DROP FOREIGN KEY FK_7C77973D1FBEEF7B');
        $this->addSql('ALTER TABLE video DROP FOREIGN KEY FK_7CC7DA2C1FBEEF7B');
        $this->addSql('ALTER TABLE commande_formation DROP FOREIGN KEY FK_504C7BFD82EA2E54');
        $this->addSql('ALTER TABLE commande_user DROP FOREIGN KEY FK_E6FFD7AA82EA2E54');
        $this->addSql('ALTER TABLE calenderier DROP FOREIGN KEY FK_874767775200282E');
        $this->addSql('ALTER TABLE chapitre DROP FOREIGN KEY FK_8C62B0255200282E');
        $this->addSql('ALTER TABLE commande_formation DROP FOREIGN KEY FK_504C7BFD5200282E');
        $this->addSql('ALTER TABLE evaluation DROP FOREIGN KEY FK_1323A5755200282E');
        $this->addSql('ALTER TABLE `group` DROP FOREIGN KEY FK_6DC044C55200282E');
        $this->addSql('ALTER TABLE paiement DROP FOREIGN KEY FK_B1DC7A1E9291498C');
        $this->addSql('ALTER TABLE message DROP FOREIGN KEY FK_B6BD307FCD53EDB6');
        $this->addSql('ALTER TABLE user_group DROP FOREIGN KEY FK_8F02BF9DFE54D947');
        $this->addSql('ALTER TABLE resultat_quizz DROP FOREIGN KEY FK_30B832EFBA934BCD');
        $this->addSql('ALTER TABLE reagit DROP FOREIGN KEY FK_8BAFDD5CBAF4AE56');
        $this->addSql('ALTER TABLE commande_user DROP FOREIGN KEY FK_E6FFD7AAA76ED395');
        $this->addSql('ALTER TABLE commentaire DROP FOREIGN KEY FK_67F068BC1BC7E6B6');
        $this->addSql('ALTER TABLE evaluation DROP FOREIGN KEY FK_1323A5758D0EB82');
        $this->addSql('ALTER TABLE evaluation_formateur DROP FOREIGN KEY FK_3F76B5CB155D8F51');
        $this->addSql('ALTER TABLE evaluation_formateur DROP FOREIGN KEY FK_3F76B5CB8D0EB82');
        $this->addSql('ALTER TABLE formation DROP FOREIGN KEY FK_404021BF155D8F51');
        $this->addSql('ALTER TABLE message DROP FOREIGN KEY FK_B6BD307F37BC4DC6');
        $this->addSql('ALTER TABLE paiement DROP FOREIGN KEY FK_B1DC7A1E9395C3F3');
        $this->addSql('ALTER TABLE reagit DROP FOREIGN KEY FK_8BAFDD5C8D0EB82');
        $this->addSql('ALTER TABLE reset_password_request DROP FOREIGN KEY FK_7CE748AA76ED395');
        $this->addSql('ALTER TABLE resultat_quizz DROP FOREIGN KEY FK_30B832EFA76ED395');
        $this->addSql('ALTER TABLE sondage DROP FOREIGN KEY FK_7579C89F642B8210');
        $this->addSql('ALTER TABLE user_group DROP FOREIGN KEY FK_8F02BF9DA76ED395');
        $this->addSql('ALTER TABLE formation DROP FOREIGN KEY FK_404021BFC8257048');
        $this->addSql('DROP TABLE calenderier');
        $this->addSql('DROP TABLE categorie');
        $this->addSql('DROP TABLE chapitre');
        $this->addSql('DROP TABLE commande');
        $this->addSql('DROP TABLE commande_formation');
        $this->addSql('DROP TABLE commande_user');
        $this->addSql('DROP TABLE commentaire');
        $this->addSql('DROP TABLE document');
        $this->addSql('DROP TABLE evaluation');
        $this->addSql('DROP TABLE evaluation_formateur');
        $this->addSql('DROP TABLE fichier');
        $this->addSql('DROP TABLE formation');
        $this->addSql('DROP TABLE `group`');
        $this->addSql('DROP TABLE jwt_refresh_token');
        $this->addSql('DROP TABLE message');
        $this->addSql('DROP TABLE paiement');
        $this->addSql('DROP TABLE quizz');
        $this->addSql('DROP TABLE reagit');
        $this->addSql('DROP TABLE refresh_tokens');
        $this->addSql('DROP TABLE reset_password_request');
        $this->addSql('DROP TABLE resultat_quizz');
        $this->addSql('DROP TABLE sondage');
        $this->addSql('DROP TABLE `user`');
        $this->addSql('DROP TABLE user_group');
        $this->addSql('DROP TABLE video');
        $this->addSql('DROP TABLE video_confernce');
    }
}
