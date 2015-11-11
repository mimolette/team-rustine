#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS fil_rouge;
CREATE DATABASE fil_rouge;
USE fil_rouge;

#------------------------------------------------------------
# Table: serie
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS serie(
        serie_id  int (11) Auto_increment  NOT NULL ,
        poster     Varchar (50) NOT NULL ,
        validation Bool NOT NULL ,
        user_id    Int ,
        PRIMARY KEY (serie_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: season
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS season(
        season_id int (11) Auto_increment  NOT NULL ,
        name      varchar (50) NULL ,
        num       int(4) ,
        serie_id Int NOT NULL ,
        PRIMARY KEY (season_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS user(
        user_id      int (11) Auto_increment  NOT NULL ,
        first_name   Varchar (50) NOT NULL ,
        last_name    Varchar (50) NOT NULL ,
        pseudo       Varchar (50) NOT NULL ,
        day_of_birth Date NOT NULL ,
        email        Varchar (100) NOT NULL ,
        password     Varchar (50) NOT NULL ,
        avatar       Varchar (50) NOT NULL ,
        language_id  Int NOT NULL ,
        role_id      Int NOT NULL ,
        ban_list_id  Int NULL ,
        PRIMARY KEY (user_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: language
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS language(
        language_id int (11) Auto_increment  NOT NULL ,
        name        Varchar (50) NOT NULL ,
        PRIMARY KEY (language_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: translation_serie
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS translation_serie(
        translation_serie_id  int (11) Auto_increment  NOT NULL ,
        synopsis    text ,
        name        Varchar (25) NOT NULL ,
        serie_id   Int NOT NULL ,
        language_id Int NOT NULL ,
        PRIMARY KEY (translation_serie_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: episode
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS episode(
        episode_id   int (11) Auto_increment  NOT NULL ,
        num          Int (4) NOT NULL ,
        release_date Date NOT NULL ,
        season_id    Int NOT NULL ,
        PRIMARY KEY (episode_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: actor
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS actor(
        actor_id   int (11) Auto_increment  NOT NULL ,
        first_name Varchar (50) NOT NULL ,
        last_name  Varchar (50) NOT NULL ,
        PRIMARY KEY (actor_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: role
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS role(
        role_id   int (11) Auto_increment  NOT NULL ,
        name      Varchar (25) NOT NULL ,
        PRIMARY KEY (role_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: category
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS category(
        category_id int (11) Auto_increment  NOT NULL ,
        name        Varchar (50) NOT NULL ,
        PRIMARY KEY (category_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: evaluation
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS evaluation(
        evaluation_id int (11) Auto_increment  NOT NULL ,
        score         Int NOT NULL ,
        PRIMARY KEY (evaluation_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: comment
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS comment(
        comment_id   int (11) Auto_increment  NOT NULL ,
        validation   Bool NOT NULL ,
        comment_date Date ,
        message      Text NOT NULL ,
        serie_id    Int NOT NULL ,
        user_id      Int NOT NULL ,
        PRIMARY KEY (comment_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: translation_episode
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS translation_episode(
        translation_episode_id int (11) Auto_increment  NOT NULL ,
        name               Varchar (50) NOT NULL ,
        synopsis           Text NOT NULL ,
        episode_id         Int NOT NULL ,
        language_id        Int NOT NULL ,
        PRIMARY KEY (translation_episode_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ban_list
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ban_list(
        ban_list_id int (11) Auto_increment  NOT NULL ,
        ban_date    Date NOT NULL ,
        user_ban_id     Int NOT NULL ,
        user_banished_id   Int NOT NULL ,
        PRIMARY KEY (ban_list_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: evaluate
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS evaluate(
        serie_id     Int NOT NULL ,
        evaluation_id Int NOT NULL ,
        user_id       Int NOT NULL ,
        PRIMARY KEY (serie_id ,evaluation_id ,user_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: casting
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS casting(
        actor_id  Int NOT NULL ,
        serie_id  Int NOT NULL ,
        PRIMARY KEY (actor_id ,serie_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: criticize
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS criticize(
        user_id    Int NOT NULL ,
        comment_id Int NOT NULL ,
        love       Bool NOT NULL ,
        PRIMARY KEY (user_id ,comment_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: friend_list
#------------------------------------------------------------
# ICI
CREATE TABLE IF NOT EXISTS friend_list(
        user_id   Int NOT NULL ,
        friend_id Int NOT NULL ,
        PRIMARY KEY (user_id ,friend_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: follow
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS follow(
        serie_id Int NOT NULL ,
        user_id   Int NOT NULL ,
        PRIMARY KEY (serie_id ,user_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: see
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS see(
        user_id    Int NOT NULL ,
        episode_id Int NOT NULL ,
        PRIMARY KEY (user_id ,episode_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: category_serie
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS category_serie(
        serie_id   Int NOT NULL ,
        category_id Int NOT NULL ,
        PRIMARY KEY (serie_id ,category_id )
)ENGINE=InnoDB;

#------------------------------------------------------------
#---------------------::  CONSTRAINT ::----------------------
#------------------------------------------------------------

# CONSTRAINT : Table : serie --> a serie is created by a user
ALTER TABLE serie ADD CONSTRAINT FK_serie_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);

# CONSTRAINT : Table : season --> a season belongs to a serie
ALTER TABLE season ADD CONSTRAINT FK_season_serie_id FOREIGN KEY (serie_id) REFERENCES serie(serie_id);

# CONSTRAINT : Table : user --> a user speak one language
ALTER TABLE user ADD CONSTRAINT FK_user_language_id FOREIGN KEY (language_id) REFERENCES language(language_id);
# CONSTRAINT : Table : user --> a user has a role
ALTER TABLE user ADD CONSTRAINT FK_user_status_id FOREIGN KEY (role_id) REFERENCES role(role_id);
# CONSTRAINT : Table : user --> a user may be banned
ALTER TABLE user ADD CONSTRAINT FK_user_ban_list_id FOREIGN KEY (ban_list_id) REFERENCES ban_list(ban_list_id);

# CONSTRAINT : Table : translation_serie --> translation refers to a serie
ALTER TABLE translation_serie ADD CONSTRAINT FK_translation_serie_serie_id FOREIGN KEY (serie_id) REFERENCES serie(serie_id);
# CONSTRAINT : Table : translation_serie --> translation is write in one language
ALTER TABLE translation_serie ADD CONSTRAINT FK_translation_serie_language_id FOREIGN KEY (language_id) REFERENCES language(language_id);

# CONSTRAINT : Table : episode --> a episode belongs to a season
ALTER TABLE episode ADD CONSTRAINT FK_episode_season_id FOREIGN KEY (season_id) REFERENCES season(season_id);

# CONSTRAINT : Table : comment --> comment refers to a serie
ALTER TABLE comment ADD CONSTRAINT FK_comment_serie_id FOREIGN KEY (serie_id) REFERENCES serie(serie_id);
# CONSTRAINT : Table : comment --> comment is write by one user
ALTER TABLE comment ADD CONSTRAINT FK_comment_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);

# CONSTRAINT : Table : translation_episode --> translation refers to a episode
ALTER TABLE translation_episode ADD CONSTRAINT FK_translation_episode_episode_id FOREIGN KEY (episode_id) REFERENCES episode(episode_id);
# CONSTRAINT : Table : translation_episode --> translation is write in one language
ALTER TABLE translation_episode ADD CONSTRAINT FK_translation_episode_language_id FOREIGN KEY (language_id) REFERENCES language(language_id);

# CONSTRAINT : Table : ban_list --> a ban concern one user
ALTER TABLE ban_list ADD CONSTRAINT FK_ban_list_user_id FOREIGN KEY (user_ban_id) REFERENCES user(user_id);
# CONSTRAINT : Table : ban_list --> a ban is made by one user
ALTER TABLE ban_list ADD CONSTRAINT FK_ban_list_user_id_1 FOREIGN KEY (user_banished_id) REFERENCES user(user_id);

# CONSTRAINT : Table : evaluate --> a evaluation concern one serie
ALTER TABLE evaluate ADD CONSTRAINT FK_evaluate_serie_id FOREIGN KEY (serie_id) REFERENCES serie(serie_id);
# CONSTRAINT : Table : evaluate --> a evaluation as one score
ALTER TABLE evaluate ADD CONSTRAINT FK_evaluate_evaluation_id FOREIGN KEY (evaluation_id) REFERENCES evaluation(evaluation_id);
# CONSTRAINT : Table : evaluate --> a evaluation is made by one user
ALTER TABLE evaluate ADD CONSTRAINT FK_evaluate_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);

# CONSTRAINT : Table : casting --> a casting concern one actor
ALTER TABLE casting ADD CONSTRAINT FK_casting_actor_id FOREIGN KEY (actor_id) REFERENCES actor(actor_id);
# CONSTRAINT : Table : casting --> a casting refers to a serie
ALTER TABLE casting ADD CONSTRAINT FK_casting_serie_id FOREIGN KEY (serie_id) REFERENCES serie(serie_id);

# CONSTRAINT : Table : criticize --> a criticize is made by one user
ALTER TABLE criticize ADD CONSTRAINT FK_criticize_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);
# CONSTRAINT : Table : criticize --> a criticize apply to a comment
ALTER TABLE criticize ADD CONSTRAINT FK_criticize_comment_id FOREIGN KEY (comment_id) REFERENCES comment(comment_id);

# CONSTRAINT : Table : friend_list --> a friendship refers to a user
ALTER TABLE friend_list ADD CONSTRAINT FK_friend_list_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);
# CONSTRAINT : Table : friend_list --> a friendship apply to another user
ALTER TABLE friend_list ADD CONSTRAINT FK_friend_list_friend_id FOREIGN KEY (friend_id) REFERENCES user(user_id);

# CONSTRAINT : Table : follow --> a following refers to a serie
ALTER TABLE follow ADD CONSTRAINT FK_follow_serie_id FOREIGN KEY (serie_id) REFERENCES serie(serie_id);
# CONSTRAINT : Table : follow --> a following concern one user
ALTER TABLE follow ADD CONSTRAINT FK_follow_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);

# CONSTRAINT : Table : see --> concern a user
ALTER TABLE see ADD CONSTRAINT FK_see_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);
# CONSTRAINT : Table : see --> concern a episode
ALTER TABLE see ADD CONSTRAINT FK_see_episode_id FOREIGN KEY (episode_id) REFERENCES episode(episode_id);

# CONSTRAINT : Table : category_serie --> concern a serie
ALTER TABLE category_serie ADD CONSTRAINT FK_category_serie_serie_id FOREIGN KEY (serie_id) REFERENCES serie(serie_id);
# CONSTRAINT : Table : category_serie --> concern a category
ALTER TABLE category_serie ADD CONSTRAINT FK_category_serie_category_id FOREIGN KEY (category_id) REFERENCES category(category_id);