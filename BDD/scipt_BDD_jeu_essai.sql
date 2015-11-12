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
        serie_id   int (11) Auto_increment  NOT NULL ,
        poster     Varchar (50) NOT NULL ,
        validation int (1) NOT NULL ,
        user_id    Int ,
        PRIMARY KEY (serie_id )
)ENGINE=InnoDB;

# DATA : serie ----------------------------------------------
INSERT INTO serie(serie_id, poster, validation, user_id)
VALUES 
        (1, "serie_id_1.jpg", 1, 1),
        (2, "serie_id_2.jpg", 1, 1),
        (3, "serie_id_3.jpg", 1, 1),
        (4, "serie_id_4.jpg", 1, 1),
        (5, "serie_id_5.jpg", 1, 1),
        (6, "serie_id_6.jpg", 1, 2),
        (7, "serie_id_7.jpg", 0, 3),
        (8, "serie_id_8.jpg", 1, 1);

#------------------------------------------------------------
# Table: season
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS season(
        season_id int (11) Auto_increment  NOT NULL ,
        name      varchar (50) NULL ,
        num       int(4) ,
        serie_id  Int NOT NULL ,
        PRIMARY KEY (season_id )
)ENGINE=InnoDB;

# DATA : season----------------------------------------------
INSERT INTO season(season_id, name, num, serie_id)
VALUES
        (1, "Long fleuve pas tranquil", 1, 1),
        (2, "Rivière pas pourpre", 2, 1),
        (3, "Chien et chat", 1, 2),
        (4, "Arco", 1, 3),
        (5, "Mange ta soupe", 1, 4),
        (6, "Range ta chambre", 2, 4),
        (7, "Trogodyte", 1, 5),
        (8, "Momo et le chien", 1, 6),
        (9, "Greg et marco", 1, 8),
        (10, "Greg et jean", 2, 8);

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
        ban_list_id  Int DEFAULT NULL,
        PRIMARY KEY (user_id )
)ENGINE=InnoDB;

# DATA : user-------------------------------------------------
INSERT INTO user(user_id, first_name, last_name, pseudo, 
                 day_of_birth, email, password, avatar, 
                 language_id, role_id, ban_list_id)
VALUES 
        (1, "Orain", "Guillaume", "Robert44", "1986-06-27",
        "robert44@gmail.com", "45fezfz87", "user_id_1.jpg",
        2, 3, NULL),
        (2, "Cremieux", "Olivier", "DarkLegolas666", "1975-03-20",
        "legolas666@gmail.com", "lkjhfe78zef", "user_id_2.jpg",
        2, 1, NULL),
        (3, "Metivier", "Anthony", "JoeLaMouche", "1990-09-05",
        "mouchetzetze@gmail.com", "45863", "user_id_3.jpg",
        2, 1, NULL),
        (4, "Morlet", "Marie", "PricesseSisi", "1985-01-12",
        "sisi@gmail.com", "azdezfh", "user_id_4.jpg",
        2, 2, NULL),
        (5, "Pomerol", "Henry", "ArthurduFion", "1977-11-29",
        "arturovidal@gmail.com", "f44ff55f", "user_id_5.jpg",
        1, 1, 1),
        (6, "Moumout", "Albert", "Moumoutine", "1958-04-15",
        "viellebranche@gmail.com", "aaaaaa", "user_id_6.jpg",
        2, 1, NULL);

#------------------------------------------------------------
# Table: language
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS language(
        language_id int (11) Auto_increment  NOT NULL ,
        name        Varchar (50) NOT NULL ,
        PRIMARY KEY (language_id )
)ENGINE=InnoDB;

# DATA : language--------------------------------------------
INSERT INTO language(language_id, name)
VALUES 
        (1, "English"),
        (2, "Français");

#------------------------------------------------------------
# Table: translation_serie
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS translation_serie(
        translation_serie_id  int (11) Auto_increment  NOT NULL ,
        synopsis    text ,
        name        Varchar (25) NOT NULL ,
        serie_id    Int NOT NULL ,
        language_id Int NOT NULL ,
        PRIMARY KEY (translation_serie_id )
)ENGINE=InnoDB;

# DATA : translation_serie-----------------------------------
INSERT INTO translation_serie(translation_serie_id, synopsis,
        name, serie_id, language_id)
VALUES
        (1, "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin molestie vulputate diam. Etiam tellus eros, mollis in dictum at, ullamcorper.", 
        "Accapolcos", 1, 1),
        (2, "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamcoprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ", 
        "Accapolcos", 1, 2),
        (3, "Lorem ipsum dolor srunt mollit anim id est laborum. ", 
        "Robert like les frittes", 2, 1),
        (4, "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labo reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ", 
        "Robert aimes les patates", 2, 2),
        (5, "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ", 
        "Venger", 3, 1),
        (6, "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco laboris rit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ",
        "Vangeance", 3, 2),
        (7, "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrudaute irure dolor in reprehenderit in luptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ", 
        "Roule ta bosse", 4, 1),
        (8, "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariaturepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ", 
        "Roule ta bosse", 4, 2),
        (9, "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint est laborum. ", 
        "Ever never", 5, 1),
        (10, "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et doloerunt mollit anim id est laborum. ", 
        "Oui ou non ou pas", 5, 2),
        (11, "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ", 
        "Love birds", 6, 1),
        (12, "Lorem ipsum dolor siagna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ", 
        "Psycophate", 6, 2),
        (13, "Lorem ipsum dolor sit amagna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ", 
        "Affraid", 7, 1),
        (14, "Lorem ipsum dolor sit is nisi ut aliquip ex ea commodo
  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ", 
        "Peur", 7, 2),
        (15, "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et doloExcepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ", 
        "Growing", 8, 1),
        (16, "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco lasint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ", 
        "Fume et bois", 8, 2);

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

# DATA : episode---------------------------------------------
INSERT INTO episode(episode_id, num, release_date, season_id)
VALUES
    (1, 1, "2015-02-28", 1),
    (2, 2, "2015-02-28", 1),
    (3, 3, "2015-02-28", 1),
    (4, 4, "2015-01-12", 1),
    (5, 1, "2015-02-28", 2),
    (6, 2, "2015-06-02", 2),
    (7, 3, "2015-02-28", 2),
    (8, 4, "2015-02-28", 2),
    (9, 5, "2015-02-28", 2),
    (10, 1, "2015-02-28", 3),
    (11, 2, "2015-02-28", 3),
    (12, 3, "2015-02-28", 3),
    (13, 4, "2015-02-28", 3),
    (14, 4, "2015-09-04", 4),
    (15, 1, "2015-02-28", 5),
    (16, 2, "2015-02-28", 5),
    (17, 3, "2015-02-28", 5),
    (18, 4, "2015-02-28", 5),
    (19, 1, "2015-02-28", 6),
    (20, 1, "2015-02-28", 8),
    (21, 2, "2015-02-28", 8),
    (22, 1, "2015-12-11", 9),
    (23, 2, "2015-02-28", 9),
    (24, 3, "2015-02-28", 9),
    (25, 4, "2015-02-28", 9),
    (26, 1, "2015-12-25", 10);


#------------------------------------------------------------
# Table: actor
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS actor(
        actor_id   int (11) Auto_increment  NOT NULL ,
        first_name Varchar (50) NOT NULL ,
        last_name  Varchar (50) NOT NULL ,
        PRIMARY KEY (actor_id )
)ENGINE=InnoDB;

# DATA : actor-----------------------------------------------
INSERT INTO actor(actor_id, first_name, last_name)
VALUES 
    (1, "robert", "redford"),
    (2, "angelina", "moche"),
    (3, "fanfan", "latulipe"),
    (4, "arturo", "vidal"),
    (5, "Brad", "pitt");

#------------------------------------------------------------
# Table: role
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS role(
        role_id   int (11) Auto_increment  NOT NULL ,
        name      Varchar (25) NOT NULL ,
        PRIMARY KEY (role_id )
)ENGINE=InnoDB;

# DATA : role------------------------------------------------
INSERT INTO role(role_id, name)
VALUES 
    (1, "utilisateur"),
    (2, "modérateur"),
    (3, "administrateur");

#------------------------------------------------------------
# Table: category
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS category(
        category_id int (11) Auto_increment  NOT NULL ,
        name        Varchar (50) NOT NULL ,
        PRIMARY KEY (category_id )
)ENGINE=InnoDB;

# DATA : category--------------------------------------------
INSERT INTO category(category_id, name)
VALUES 
    (1, "Fantaisy"),
    (2, "Policier"),
    (3, "Aventure"),
    (4, "Comédie");

#------------------------------------------------------------
# Table: evaluation
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS evaluation(
        evaluation_id int (11) Auto_increment  NOT NULL ,
        score         Int NOT NULL ,
        PRIMARY KEY (evaluation_id )
)ENGINE=InnoDB;

# DATA : evaluation------------------------------------------
INSERT INTO evaluation(evaluation_id, score)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

#------------------------------------------------------------
# Table: comment
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS comment(
        comment_id   int (11) Auto_increment  NOT NULL ,
        validation int (1) NOT NULL ,
        comment_date Date ,
        message      Text NOT NULL ,
        serie_id     Int NOT NULL ,
        user_id      Int NOT NULL ,
        PRIMARY KEY (comment_id )
)ENGINE=InnoDB;

# DATA : comment---------------------------------------------
INSERT INTO comment(comment_id, validation, comment_date, 
            message, serie_id, user_id)
VALUES
    (1, 1, "2015-01-15", 
    "ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor",
    1, 3),
    (2, 1, "2015-01-18", 
    "ipsum dolor sit amet, con dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor",
    1, 5),
    (3, 0, "2015-02-01", 
    "ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dlabori",
    1, 2),
    (4, 1, "2015-03-15", 
    "ipsuamet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dlaborea commodo
    consequat. Duis aute irure dolor",
    3, 6),
    (5, 1, "2015-03-19", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor",
    8, 5);

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

# DATA : translation_episode---------------------------------
INSERT INTO translation_episode(translation_episode_id, name,
            synopsis, episode_id, language_id)
VALUES
    (1, "Accapolcos1", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    1, 1),
    (2, "Accapolcos1", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    1, 2),
    (3, "Accapolcos2", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    2, 1),
    (4, "Accapolcos2", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    2, 2),
    (5, "Accapolcos3", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    3, 1),
    (6, "Accapolcos3", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    3, 2),
    (7, "Accapolcos4", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    4, 1),
    (8, "Accapolcos5", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    5, 1),
    (9, "Accapolcos6", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    6, 1),
    (10, "Accapolcos7", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    7, 1),
    (11, "Accapolcos8", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    8, 1),
    (12, "Accapolcos9", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    9, 1),
    (13, "Accapolcos10", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    10, 1),
    (14, "Accapolcos11", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    11, 1),
    (15, "Accapolcos12", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    12, 1),
    (16, "Accapolcos13", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    13, 1),
    (17, "Accapolcos14", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    14, 1),
    (18, "Accapolcos15", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    15, 1),
    (19, "Accapolcos16", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    16, 1),
    (20, "Accapolcos17", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    17, 1),
    (21, "Accapolcos18", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    18, 1),
    (22, "Accapolcos19", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    19, 1),
    (23, "Accapolcos20", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    20, 1),
    (24, "Accapolcos21", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    21, 1),
    (25, "Accapolcos22", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    22, 1),
    (26, "Accapolcos23", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    23, 1),
    (27, "Accapolcos24", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    24, 1),
    (28, "Accapolcos25", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    25, 1),
    (29, "Accapolcos26", 
    "incididunt ut labore et dlaboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor", 
    26, 1);

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

# DATA : ban_list--------------------------------------------
INSERT INTO ban_list(ban_list_id, ban_date, user_ban_id, 
                    user_banished_id)
VALUES
    (1, "2015-01-26", 5, 4);

#------------------------------------------------------------
# Table: evaluate
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS evaluate(
        serie_id      Int NOT NULL ,
        evaluation_id Int NOT NULL ,
        user_id       Int NOT NULL ,
        PRIMARY KEY (serie_id ,evaluation_id ,user_id )
)ENGINE=InnoDB;

# DATA : evaluate--------------------------------------------
INSERT INTO evaluate(serie_id, evaluation_id, user_id)
VALUES 
    (1,3,1),
    (1,4,2),
    (1,1,3),
    (1,5,6),
    (2,5,1),
    (2,4,5),
    (3,1,2),
    (3,2,4),
    (3,2,6),
    (4,5,6),
    (5,2,3),
    (5,5,5),
    (6,1,5),
    (7,3,6),
    (7,4,6);

#------------------------------------------------------------
# Table: casting
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS casting(
        actor_id  Int NOT NULL ,
        serie_id  Int NOT NULL ,
        PRIMARY KEY (actor_id ,serie_id )
)ENGINE=InnoDB;

# DATA : casting---------------------------------------------
INSERT INTO casting(actor_id, serie_id)
VALUES
    (1,1),
    (3,1),
    (2,2),
    (4,2),
    (5,2),
    (2,3),
    (3,4),
    (1,5),
    (2,5),
    (3,5),
    (5,5),
    (5,6),
    (3,6),
    (4,7),
    (1,8),
    (2,8);

#------------------------------------------------------------
# Table: criticize
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS criticize(
        user_id    Int NOT NULL ,
        comment_id Int NOT NULL ,
        love       Bool NOT NULL ,
        PRIMARY KEY (user_id ,comment_id )
)ENGINE=InnoDB;

# DATA : criticize-------------------------------------------
INSERT INTO criticize(user_id, comment_id, love)
VALUES
    (1,1,1),
    (2,1,1),
    (3,2,1),
    (4,2,1),
    (1,2,1),
    (2,3,1),
    (3,3,1),
    (4,3,1),
    (5,3,1),
    (1,4,1),
    (1,5,1),
    (2,5,1),
    (3,5,1),
    (4,5,1),
    (6,5,1);

#------------------------------------------------------------
# Table: friend_list
#------------------------------------------------------------
# ICI
CREATE TABLE IF NOT EXISTS friend_list(
        user_id   Int NOT NULL ,
        friend_id Int NOT NULL ,
        PRIMARY KEY (user_id ,friend_id )
)ENGINE=InnoDB;

# DATA : friend_list-----------------------------------------
INSERT INTO friend_list(user_id, friend_id)
VALUES 
    (1,2),
    (1,3),
    (5,2),
    (6,5),
    (4,1),
    (3,2);

#------------------------------------------------------------
# Table: follow
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS follow(
        serie_id  Int NOT NULL ,
        user_id   Int NOT NULL ,
        PRIMARY KEY (serie_id ,user_id )
)ENGINE=InnoDB;

# DATA : follow----------------------------------------------
INSERT INTO follow(serie_id, user_id)
VALUES
    (1, 2),
    (2, 2),
    (2, 3),
    (2, 5),
    (2, 6),
    (3, 2),
    (3, 1),
    (3, 6),
    (5, 4),
    (5, 5),
    (6, 6),
    (7, 2),
    (8, 2),
    (8, 3),
    (8, 1),
    (1, 1);

#------------------------------------------------------------
# Table: see
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS see(
        user_id    Int NOT NULL ,
        episode_id Int NOT NULL ,
        PRIMARY KEY (user_id ,episode_id )
)ENGINE=InnoDB;

# DATA : see-------------------------------------------------
INSERT INTO see(user_id, episode_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (6, 1),
    (2, 2),
    (1, 2),
    (1, 3);

#------------------------------------------------------------
# Table: category_serie
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS category_serie(
        serie_id    Int NOT NULL ,
        category_id Int NOT NULL ,
        PRIMARY KEY (serie_id ,category_id )
)ENGINE=InnoDB;

# DATA : category_serie--------------------------------------
INSERT INTO category_serie(serie_id, category_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 1),
    (4, 4),
    (5, 4),
    (6, 3),
    (7, 2),
    (8, 3),
    (1, 3),
    (6, 1),
    (7, 1);

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