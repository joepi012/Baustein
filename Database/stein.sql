SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `stein` ;
CREATE SCHEMA IF NOT EXISTS `stein` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `stein` ;

-- -----------------------------------------------------
-- Table `stein`.`stein_users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_users` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(255) NOT NULL ,
  `last_name` VARCHAR(255) NOT NULL ,
  `user_name` VARCHAR(255) NOT NULL ,
  `signature` VARCHAR(255) NOT NULL ,
  `password` VARCHAR(255) NOT NULL ,
  `email` VARCHAR(255) NOT NULL ,
  `unlocked` TINYINT(1) NOT NULL ,
  `created` DATETIME NOT NULL ,
  `creator` BIGINT NOT NULL ,
  `edited` DATETIME NOT NULL ,
  `editor` BIGINT NOT NULL ,
  `deleted` DATETIME NULL ,
  `deletor` BIGINT NULL ,
  `right_article_create` TINYINT(1) NOT NULL ,
  `right_article_edit_own` TINYINT(1) NOT NULL ,
  `right_article_edit_other` TINYINT(1) NOT NULL ,
  `right_article_delete` TINYINT(1) NOT NULL ,
  `right_article_set_status` TINYINT(1) NOT NULL ,
  `right_gallery_create` TINYINT(1) NOT NULL ,
  `right_gallery_edit_own` TINYINT(1) NOT NULL ,
  `right_gallery_edit_other` TINYINT(1) NOT NULL ,
  `right_gallery_delete` TINYINT(1) NOT NULL ,
  `right_gallery_set_status` TINYINT(1) NOT NULL ,
  `right_category_create` TINYINT(1) NOT NULL ,
  `right_category_edit` TINYINT(1) NOT NULL ,
  `right_category_delete` TINYINT(1) NOT NULL ,
  `right_category_set_status` TINYINT(1) NOT NULL ,
  `right_category_top_categories` TINYINT(1) NOT NULL ,
  `right_guestbook_edit` TINYINT(1) NOT NULL ,
  `right_guestbook_delete` TINYINT(1) NOT NULL ,
  `right_guestook_set_status` TINYINT(1) NOT NULL ,
  `right_user_create` TINYINT(1) NOT NULL ,
  `right_user_edit` TINYINT(1) NOT NULL ,
  `right_user_delete` TINYINT(1) NOT NULL ,
  `right_user_set_status` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_stein_users_creator` (`creator` ASC) ,
  INDEX `fk_stein_users_editor` (`editor` ASC) ,
  INDEX `fk_stein_users_deletor` (`deletor` ASC) ,
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC) ,
  UNIQUE INDEX `signature_UNIQUE` (`signature` ASC) ,
  CONSTRAINT `fk_stein_users_creator`
    FOREIGN KEY (`creator` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_users_editor`
    FOREIGN KEY (`editor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_users_deletor`
    FOREIGN KEY (`deletor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_categories` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_categories` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `parent` BIGINT NOT NULL ,
  `slug` VARCHAR(255) NOT NULL ,
  `title` VARCHAR(255) NOT NULL ,
  `description` TEXT NOT NULL ,
  `unlocked` TINYINT(1) NOT NULL ,
  `created` DATETIME NOT NULL ,
  `creator` BIGINT NOT NULL ,
  `edited` DATETIME NOT NULL ,
  `editor` BIGINT NOT NULL ,
  `deleted` DATETIME NULL ,
  `deletor` BIGINT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_stein_categories_parent` (`parent` ASC) ,
  INDEX `fk_stein_categories_creator` (`creator` ASC) ,
  INDEX `fk_stein_categories_editor` (`editor` ASC) ,
  INDEX `fk_stein_categories_deletor` (`deletor` ASC) ,
  UNIQUE INDEX `slug_UNIQUE` (`slug` ASC) ,
  CONSTRAINT `fk_stein_categories_parent`
    FOREIGN KEY (`parent` )
    REFERENCES `stein`.`stein_categories` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_categories_creator`
    FOREIGN KEY (`creator` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_categories_editor`
    FOREIGN KEY (`editor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_categories_deletor`
    FOREIGN KEY (`deletor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_articles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_articles` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_articles` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `category` BIGINT NOT NULL ,
  `slug` VARCHAR(255) NOT NULL ,
  `title` VARCHAR(255) NOT NULL ,
  `description` TEXT NOT NULL ,
  `content` LONGTEXT NOT NULL ,
  `views` BIGINT NOT NULL ,
  `unlocked` TINYINT(1) NOT NULL ,
  `commentable` TINYINT(1) NOT NULL ,
  `show_on_main_page` TINYINT(1) NOT NULL ,
  `created` DATETIME NOT NULL ,
  `creator` BIGINT NOT NULL ,
  `edited` DATETIME NOT NULL ,
  `editor` BIGINT NOT NULL ,
  `deleted` DATETIME NULL ,
  `deletor` BIGINT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_stein_articles_category` (`category` ASC) ,
  INDEX `fk_stein_articles_creator` (`creator` ASC) ,
  INDEX `fk_stein_articles_editor` (`editor` ASC) ,
  INDEX `fk_stein_articles_deletor` (`deletor` ASC) ,
  UNIQUE INDEX `slug_UNIQUE` (`slug` ASC) ,
  CONSTRAINT `fk_stein_articles_category`
    FOREIGN KEY (`category` )
    REFERENCES `stein`.`stein_categories` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_articles_creator`
    FOREIGN KEY (`creator` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_articles_editor`
    FOREIGN KEY (`editor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_articles_deletor`
    FOREIGN KEY (`deletor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_link_articles_users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_link_articles_users` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_link_articles_users` (
  `article` BIGINT NOT NULL ,
  `user` BIGINT NOT NULL ,
  `created_version` BIGINT NOT NULL ,
  `deleted_version` BIGINT NULL ,
  PRIMARY KEY (`article`, `user`, `created_version`) ,
  INDEX `fk_stein_link_articles_users_user` (`user` ASC) ,
  INDEX `fk_stein_link_articles_users_article` (`article` ASC) ,
  CONSTRAINT `fk_stein_link_articles_users_article`
    FOREIGN KEY (`article` )
    REFERENCES `stein`.`stein_articles` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_link_articles_users_user`
    FOREIGN KEY (`user` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_galleries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_galleries` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_galleries` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `category` BIGINT NOT NULL ,
  `slug` VARCHAR(255) NOT NULL ,
  `title` VARCHAR(255) NOT NULL ,
  `description` TEXT NOT NULL ,
  `created` DATETIME NOT NULL ,
  `creator` BIGINT NOT NULL ,
  `edited` DATETIME NOT NULL ,
  `editor` BIGINT NOT NULL ,
  `deleted` DATETIME NULL ,
  `deletor` BIGINT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_stein_galleries_category` (`category` ASC) ,
  INDEX `fk_stein_galleries_creator` (`creator` ASC) ,
  INDEX `fk_stein_galleries_editor` (`editor` ASC) ,
  INDEX `fk_stein_galleries_deletor` (`deletor` ASC) ,
  UNIQUE INDEX `slug_UNIQUE` (`slug` ASC) ,
  CONSTRAINT `fk_stein_galleries_category`
    FOREIGN KEY (`category` )
    REFERENCES `stein`.`stein_categories` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_galleries_creator`
    FOREIGN KEY (`creator` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_galleries_editor`
    FOREIGN KEY (`editor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_galleries_deletor`
    FOREIGN KEY (`deletor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_link_galleries_users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_link_galleries_users` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_link_galleries_users` (
  `gallery` BIGINT NOT NULL ,
  `user` BIGINT NOT NULL ,
  `created_version` BIGINT NOT NULL ,
  `deleted_version` BIGINT NULL ,
  PRIMARY KEY (`gallery`, `user`, `created_version`) ,
  INDEX `fk_stein_link_galleries_users_user` (`user` ASC) ,
  INDEX `fk_stein_link_galleries_users_gallery` (`gallery` ASC) ,
  CONSTRAINT `fk_stein_link_galleries_users_gallery`
    FOREIGN KEY (`gallery` )
    REFERENCES `stein`.`stein_galleries` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_link_galleries_users_user`
    FOREIGN KEY (`user` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'think!!!!';


-- -----------------------------------------------------
-- Table `stein`.`stein_link_articles_galleries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_link_articles_galleries` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_link_articles_galleries` (
  `article` BIGINT NOT NULL ,
  `gallery` BIGINT NOT NULL ,
  `created_version` BIGINT NOT NULL ,
  `deleted_version` BIGINT NULL ,
  PRIMARY KEY (`article`, `gallery`, `created_version`) ,
  INDEX `fk_stein_link_articles_galleries_gallery` (`gallery` ASC) ,
  INDEX `fk_stein_link_articles_galleries_article` (`article` ASC) ,
  CONSTRAINT `fk_stein_link_articles_galleries_article`
    FOREIGN KEY (`article` )
    REFERENCES `stein`.`stein_articles` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_link_articles_galleries_gallery`
    FOREIGN KEY (`gallery` )
    REFERENCES `stein`.`stein_galleries` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_article_comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_article_comments` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_article_comments` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `article` BIGINT NOT NULL ,
  `student` BIGINT NOT NULL COMMENT 'student id from Schülerbereich' ,
  `slug` VARCHAR(255) NOT NULL ,
  `title` VARCHAR(255) NOT NULL ,
  `content` TEXT NOT NULL ,
  `unlocked` TINYINT(1) NOT NULL ,
  `created` DATETIME NOT NULL ,
  `edited` DATETIME NOT NULL ,
  `editor` BIGINT NOT NULL ,
  `deleted` DATETIME NULL ,
  `deletor` BIGINT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_stein_article_comments_article` (`article` ASC) ,
  INDEX `fk_stein_article_comments_editor` (`editor` ASC) ,
  INDEX `fk_stein_article_comments_deletor` (`deletor` ASC) ,
  UNIQUE INDEX `slug_UNIQUE` (`slug` ASC) ,
  CONSTRAINT `fk_stein_article_comments_article`
    FOREIGN KEY (`article` )
    REFERENCES `stein`.`stein_articles` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_article_comments_editor`
    FOREIGN KEY (`editor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_article_comments_deletor`
    FOREIGN KEY (`deletor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_guestbook`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_guestbook` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_guestbook` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `name` VARCHAR(255) NOT NULL ,
  `email` VARCHAR(255) NOT NULL ,
  `homepage` VARCHAR(255) NULL ,
  `location` VARCHAR(255) NULL ,
  `content` TEXT NOT NULL ,
  `comment` TEXT NULL ,
  `unlocked` TINYINT(1) NOT NULL ,
  `edited` DATETIME NULL ,
  `editor` BIGINT NULL ,
  `deleted` DATETIME NULL ,
  `deletor` BIGINT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_stein_guestbook_editor` (`editor` ASC) ,
  INDEX `fk_stein_guestbook_deletor` (`deletor` ASC) ,
  CONSTRAINT `fk_stein_guestbook_editor`
    FOREIGN KEY (`editor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_guestbook_deletor`
    FOREIGN KEY (`deletor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_events` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_events` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `slug` VARCHAR(255) NOT NULL ,
  `title` VARCHAR(255) NOT NULL ,
  `description` TEXT NOT NULL ,
  `start` DATETIME NOT NULL ,
  `end` DATETIME NOT NULL ,
  `unlocked` TINYINT(1) NOT NULL ,
  `created` DATETIME NOT NULL ,
  `creator` BIGINT NOT NULL ,
  `edited` DATETIME NOT NULL ,
  `editor` BIGINT NOT NULL ,
  `deleted` DATETIME NULL ,
  `deletor` BIGINT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_stein_events_creator` (`creator` ASC) ,
  INDEX `fk_stein_events_editor` (`editor` ASC) ,
  INDEX `fk_stein_events_deletor` (`deletor` ASC) ,
  UNIQUE INDEX `slug_UNIQUE` (`slug` ASC) ,
  CONSTRAINT `fk_stein_events_creator`
    FOREIGN KEY (`creator` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_events_editor`
    FOREIGN KEY (`editor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_events_deletor`
    FOREIGN KEY (`deletor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_guestbook_versions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_guestbook_versions` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_guestbook_versions` (
  `id` BIGINT NOT NULL ,
  `version` BIGINT NOT NULL ,
  `created` DATETIME NOT NULL ,
  `name` VARCHAR(255) NOT NULL ,
  `email` VARCHAR(255) NOT NULL ,
  `homepage` VARCHAR(255) NULL ,
  `location` VARCHAR(255) NULL ,
  `content` TEXT NOT NULL ,
  `comment` TEXT NULL ,
  `unlocked` TINYINT(1) NOT NULL ,
  `edited` DATETIME NULL ,
  `editor` BIGINT NULL ,
  `deleted` DATETIME NULL ,
  `deletor` BIGINT NULL ,
  PRIMARY KEY (`id`, `version`) ,
  INDEX `fk_stein_guestbook_versions_editor` (`editor` ASC) ,
  INDEX `fk_stein_guestbook_versions_deletor` (`deletor` ASC) ,
  INDEX `fk_stein_guestbook_versions_id` (`id` ASC) ,
  CONSTRAINT `fk_stein_guestbook_versions_editor`
    FOREIGN KEY (`editor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_guestbook_versions_deletor`
    FOREIGN KEY (`deletor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_guestbook_versions_id`
    FOREIGN KEY (`id` )
    REFERENCES `stein`.`stein_guestbook` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_users_versions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_users_versions` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_users_versions` (
  `id` BIGINT NOT NULL ,
  `version` BIGINT NOT NULL ,
  `first_name` VARCHAR(255) NOT NULL ,
  `last_name` VARCHAR(255) NOT NULL ,
  `user_name` VARCHAR(255) NOT NULL ,
  `signature` VARCHAR(255) NOT NULL ,
  `password` VARCHAR(255) NOT NULL ,
  `email` VARCHAR(255) NOT NULL ,
  `unlocked` TINYINT(1) NOT NULL ,
  `created` DATETIME NOT NULL ,
  `creator` BIGINT NOT NULL ,
  `edited` DATETIME NOT NULL ,
  `editor` BIGINT NOT NULL ,
  `deleted` DATETIME NULL ,
  `deletor` BIGINT NULL ,
  `right_article_create` TINYINT(1) NOT NULL ,
  `right_article_edit_own` TINYINT(1) NOT NULL ,
  `right_article_edit_other` TINYINT(1) NOT NULL ,
  `right_article_delete` TINYINT(1) NOT NULL ,
  `right_article_set_status` TINYINT(1) NOT NULL ,
  `right_gallery_create` TINYINT(1) NOT NULL ,
  `right_gallery_edit_own` TINYINT(1) NOT NULL ,
  `right_gallery_edit_other` TINYINT(1) NOT NULL ,
  `right_gallery_delete` TINYINT(1) NOT NULL ,
  `right_gallery_set_status` TINYINT(1) NOT NULL ,
  `right_category_create` TINYINT(1) NOT NULL ,
  `right_category_edit` TINYINT(1) NOT NULL ,
  `right_category_delete` TINYINT(1) NOT NULL ,
  `right_category_set_status` TINYINT(1) NOT NULL ,
  `right_category_top_categories` TINYINT(1) NOT NULL ,
  `right_guestbook_edit` TINYINT(1) NOT NULL ,
  `right_guestbook_delete` TINYINT(1) NOT NULL ,
  `right_guestook_set_status` TINYINT(1) NOT NULL ,
  `right_user_create` TINYINT(1) NOT NULL ,
  `right_user_edit` TINYINT(1) NOT NULL ,
  `right_user_delete` TINYINT(1) NOT NULL ,
  `right_user_set_status` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`id`, `version`) ,
  INDEX `fk_stein_users_versions_creator` (`creator` ASC) ,
  INDEX `fk_stein_users_versions_editor` (`editor` ASC) ,
  INDEX `fk_stein_users_versions_deletor` (`deletor` ASC) ,
  INDEX `fk_stein_users_versions_id` (`id` ASC) ,
  CONSTRAINT `fk_stein_users_versions_creator`
    FOREIGN KEY (`creator` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_users_versions_editor`
    FOREIGN KEY (`editor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_users_versions_deletor`
    FOREIGN KEY (`deletor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_users_versions_id`
    FOREIGN KEY (`id` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_categories_versions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_categories_versions` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_categories_versions` (
  `id` BIGINT NOT NULL ,
  `version` BIGINT NOT NULL ,
  `parent` BIGINT NOT NULL ,
  `slug` VARCHAR(255) NOT NULL ,
  `title` VARCHAR(255) NOT NULL ,
  `description` TEXT NOT NULL ,
  `unlocked` TINYINT(1) NOT NULL ,
  `created` DATETIME NOT NULL ,
  `creator` BIGINT NOT NULL ,
  `edited` DATETIME NOT NULL ,
  `editor` BIGINT NOT NULL ,
  `deleted` DATETIME NULL ,
  `deletor` BIGINT NULL ,
  PRIMARY KEY (`id`, `version`) ,
  INDEX `fk_stein_categories_versions_parent` (`parent` ASC) ,
  INDEX `fk_stein_categories_versions_creator` (`creator` ASC) ,
  INDEX `fk_stein_categories_versions_editor` (`editor` ASC) ,
  INDEX `fk_stein_categories_versions_deletor` (`deletor` ASC) ,
  INDEX `fk_stein_categories_versions_id` (`id` ASC) ,
  CONSTRAINT `fk_stein_categories_versions_parent`
    FOREIGN KEY (`parent` )
    REFERENCES `stein`.`stein_categories` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_categories_versions_creator`
    FOREIGN KEY (`creator` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_categories_versions_editor`
    FOREIGN KEY (`editor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_categories_versions_deletor`
    FOREIGN KEY (`deletor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_categories_versions_id`
    FOREIGN KEY (`id` )
    REFERENCES `stein`.`stein_categories` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_galleries_versions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_galleries_versions` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_galleries_versions` (
  `id` BIGINT NOT NULL ,
  `version` BIGINT NOT NULL ,
  `category` BIGINT NOT NULL ,
  `slug` VARCHAR(255) NOT NULL ,
  `title` VARCHAR(255) NOT NULL ,
  `description` TEXT NOT NULL ,
  `created` DATETIME NOT NULL ,
  `creator` BIGINT NOT NULL ,
  `edited` DATETIME NOT NULL ,
  `editor` BIGINT NOT NULL ,
  `deleted` DATETIME NULL ,
  `deletor` BIGINT NULL ,
  PRIMARY KEY (`id`, `version`) ,
  INDEX `fk_stein_galleries_versions_category` (`category` ASC) ,
  INDEX `fk_stein_galleries_versions_creator` (`creator` ASC) ,
  INDEX `fk_stein_galleries_versions_editor` (`editor` ASC) ,
  INDEX `fk_stein_galleries_versions_deletor` (`deletor` ASC) ,
  INDEX `fk_stein_galleries_versions_id` (`id` ASC) ,
  CONSTRAINT `fk_stein_galleries_versions_category`
    FOREIGN KEY (`category` )
    REFERENCES `stein`.`stein_categories` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_galleries_versions_creator`
    FOREIGN KEY (`creator` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_galleries_versions_editor`
    FOREIGN KEY (`editor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_galleries_versions_deletor`
    FOREIGN KEY (`deletor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_galleries_versions_id`
    FOREIGN KEY (`id` )
    REFERENCES `stein`.`stein_galleries` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_articles_versions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_articles_versions` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_articles_versions` (
  `id` BIGINT NOT NULL ,
  `version` BIGINT NOT NULL ,
  `category` BIGINT NOT NULL ,
  `slug` VARCHAR(255) NOT NULL ,
  `title` VARCHAR(255) NOT NULL ,
  `description` TEXT NOT NULL ,
  `content` LONGTEXT NOT NULL ,
  `views` BIGINT NOT NULL ,
  `unlocked` TINYINT(1) NOT NULL ,
  `commentable` TINYINT(1) NOT NULL ,
  `show_on_main_page` TINYINT(1) NOT NULL ,
  `created` DATETIME NOT NULL ,
  `creator` BIGINT NOT NULL ,
  `edited` DATETIME NOT NULL ,
  `editor` BIGINT NOT NULL ,
  `deleted` DATETIME NULL ,
  `deletor` BIGINT NULL ,
  PRIMARY KEY (`id`, `version`) ,
  INDEX `fk_stein_articles_versions_category` (`category` ASC) ,
  INDEX `fk_stein_articles_versions_creator` (`creator` ASC) ,
  INDEX `fk_stein_articles_versions_editor` (`editor` ASC) ,
  INDEX `fk_stein_articles_versions_deletor` (`deletor` ASC) ,
  INDEX `fk_stein_articles_versions_id` (`id` ASC) ,
  CONSTRAINT `fk_stein_articles_versions_category`
    FOREIGN KEY (`category` )
    REFERENCES `stein`.`stein_categories` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_articles_versions_creator`
    FOREIGN KEY (`creator` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_articles_versions_editor`
    FOREIGN KEY (`editor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_articles_versions_deletor`
    FOREIGN KEY (`deletor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_articles_versions_id`
    FOREIGN KEY (`id` )
    REFERENCES `stein`.`stein_articles` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_events_versions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_events_versions` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_events_versions` (
  `id` BIGINT NOT NULL ,
  `version` BIGINT NOT NULL ,
  `slug` VARCHAR(255) NOT NULL ,
  `title` VARCHAR(255) NOT NULL ,
  `description` TEXT NOT NULL ,
  `start` DATETIME NOT NULL ,
  `end` DATETIME NOT NULL ,
  `unlocked` TINYINT(1) NOT NULL ,
  `created` DATETIME NOT NULL ,
  `creator` BIGINT NOT NULL ,
  `edited` DATETIME NOT NULL ,
  `editor` BIGINT NOT NULL ,
  `deleted` DATETIME NULL ,
  `deletor` BIGINT NULL ,
  PRIMARY KEY (`id`, `version`) ,
  INDEX `fk_stein_events_versions_creator` (`creator` ASC) ,
  INDEX `fk_stein_events_versions_editor` (`editor` ASC) ,
  INDEX `fk_stein_events_versions_deletor` (`deletor` ASC) ,
  INDEX `fk_stein_events_versions_id` (`id` ASC) ,
  CONSTRAINT `fk_stein_events_versions_creator`
    FOREIGN KEY (`creator` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_events_versions_editor`
    FOREIGN KEY (`editor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_events_versions_deletor`
    FOREIGN KEY (`deletor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_events_versions_id`
    FOREIGN KEY (`id` )
    REFERENCES `stein`.`stein_events` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_article_comments_versions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_article_comments_versions` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_article_comments_versions` (
  `id` BIGINT NOT NULL ,
  `version` BIGINT NOT NULL ,
  `article` BIGINT NOT NULL ,
  `slug` VARCHAR(255) NOT NULL ,
  `student` BIGINT NOT NULL COMMENT 'student id from Schülerbereich' ,
  `title` VARCHAR(255) NOT NULL ,
  `content` TEXT NOT NULL ,
  `unlocked` TINYINT(1) NOT NULL ,
  `created` DATETIME NOT NULL ,
  `edited` DATETIME NOT NULL ,
  `editor` BIGINT NOT NULL ,
  `deleted` DATETIME NULL ,
  `deletor` BIGINT NULL ,
  PRIMARY KEY (`id`, `version`) ,
  INDEX `fk_stein_article_comments_versions_article` (`article` ASC) ,
  INDEX `fk_stein_article_comments_versions_editor` (`editor` ASC) ,
  INDEX `fk_stein_article_comments_versions_deletor` (`deletor` ASC) ,
  INDEX `fk_stein_article_comments_versions_id` (`id` ASC) ,
  CONSTRAINT `fk_stein_article_comments_versions_article`
    FOREIGN KEY (`article` )
    REFERENCES `stein`.`stein_articles` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_article_comments_versions_editor`
    FOREIGN KEY (`editor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_article_comments_versions_deletor`
    FOREIGN KEY (`deletor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_article_comments_versions_id`
    FOREIGN KEY (`id` )
    REFERENCES `stein`.`stein_article_comments` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_teachers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_teachers` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_teachers` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(255) NOT NULL ,
  `last_name` VARCHAR(255) NOT NULL ,
  `signature` VARCHAR(255) NOT NULL ,
  `sex` TINYINT(1) NOT NULL COMMENT '1 = female, 0 = male' ,
  `unlocked` TINYINT(1) NOT NULL ,
  `status` TINYINT NOT NULL COMMENT '0 = current, 1 = former, 2 = other' ,
  `interview` BIGINT NULL ,
  `created` DATETIME NOT NULL ,
  `creator` BIGINT NOT NULL ,
  `edited` DATETIME NOT NULL ,
  `editor` BIGINT NOT NULL ,
  `deleted` DATETIME NULL ,
  `deletor` BIGINT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_stein_teachers_interview` (`interview` ASC) ,
  INDEX `fk_stein_teachers_creator` (`creator` ASC) ,
  INDEX `fk_stein_teachers_editor` (`editor` ASC) ,
  INDEX `fk_stein_teachers_deletor` (`deletor` ASC) ,
  UNIQUE INDEX `signature_UNIQUE` (`signature` ASC) ,
  CONSTRAINT `fk_stein_teachers_interview`
    FOREIGN KEY (`interview` )
    REFERENCES `stein`.`stein_articles` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_teachers_creator`
    FOREIGN KEY (`creator` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_teachers_editor`
    FOREIGN KEY (`editor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_teachers_deletor`
    FOREIGN KEY (`deletor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `stein`.`stein_teachers_versions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stein`.`stein_teachers_versions` ;

CREATE  TABLE IF NOT EXISTS `stein`.`stein_teachers_versions` (
  `id` BIGINT NOT NULL ,
  `version` BIGINT NOT NULL ,
  `first_name` VARCHAR(255) NOT NULL ,
  `last_name` VARCHAR(255) NOT NULL ,
  `signature` VARCHAR(255) NOT NULL ,
  `sex` TINYINT(1) NOT NULL COMMENT '1 = female, 0 = male' ,
  `unlocked` TINYINT(1) NOT NULL ,
  `status` TINYINT NOT NULL COMMENT '0 = current, 1 = former, 2 = other' ,
  `interview` BIGINT NULL ,
  `created` DATETIME NOT NULL ,
  `creator` BIGINT NOT NULL ,
  `edited` DATETIME NOT NULL ,
  `editor` BIGINT NOT NULL ,
  `deleted` DATETIME NULL ,
  `deletor` BIGINT NULL ,
  PRIMARY KEY (`id`, `version`) ,
  INDEX `fk_stein_teachers_interview` (`interview` ASC) ,
  INDEX `fk_stein_teachers_creator` (`creator` ASC) ,
  INDEX `fk_stein_teachers_editor` (`editor` ASC) ,
  INDEX `fk_stein_teachers_deletor` (`deletor` ASC) ,
  INDEX `fk_stein_teachers_versions_id` (`id` ASC) ,
  CONSTRAINT `fk_stein_teachers_versions_interview`
    FOREIGN KEY (`interview` )
    REFERENCES `stein`.`stein_articles` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_teachers_versions_creator`
    FOREIGN KEY (`creator` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_teachers_versions_editor`
    FOREIGN KEY (`editor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_teachers_versions_deletor`
    FOREIGN KEY (`deletor` )
    REFERENCES `stein`.`stein_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stein_teachers_versions_id`
    FOREIGN KEY (`id` )
    REFERENCES `stein`.`stein_teachers` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
