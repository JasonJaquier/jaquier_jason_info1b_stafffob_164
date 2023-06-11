/* Module 164 JASON JAQUIER / 09.03.2023 - 10h30 */
-- 27.04.23 - 10:50 / UPDATE: change db name, add [Auto_Increment] to [t_personne > idPersonne]

-- Préparation de la place : 
DROP DATABASE IF EXISTS `jaquier_jason_info1b_stafffob_164_2023`;
CREATE DATABASE IF NOT EXISTS `jaquier_jason_info1b_stafffob_164_2023`;

/* Create table */
DROP TABLE t_personne;
CREATE TABLE t_personne (
    idPersonne INT NOT NULL,
--    pNumero INT NOT NULL,
    pNom VARCHAR(50),
    pPrenom VARCHAR(50),
    pDateDeNaissance DATE
);

CREATE TABLE t_coordonnees (
    idCoordonnees INT NOT NULL,
    pAdresse VARCHAR(50),
    pNoAdresse INT,
    pNoNPA INT,
    pLocalite VARCHAR(50),
    pEmail VARCHAR(50),
    pTelephone INT
);

CREATE TABLE t_choix (
    idChoix INT NOT NULL,
    idMatch INT NOT NULL,
    idPersonne INT NOT NULL,
    pChoix INT
);

CREATE TABLE t_match (
    idMatch INT NOT NULL,
    dateMatch DATE
);

/* Create PRIMARY & FOREIGN KEY */
/* t_personne */
ALTER TABLE t_personne
    ADD CONSTRAINT PKpersonne
    PRIMARY KEY (idPersonne);
ALTER TABLE t_personne CHANGE idPersonne idPersonne INT NOT NULL AUTO_INCREMENT;

/* t_coordonnees */
ALTER TABLE t_coordonnees
    ADD CONSTRAINT PKcoordonnees
    PRIMARY KEY (idCoordonnees);
ALTER TABLE t_coordonnees
    ADD CONSTRAINT FKcoordonneesPersonne
    FOREIGN KEY (idCoordonnees)
    REFERENCES t_personne(idPersonne);

/* t_match */
ALTER TABLE t_match
    ADD CONSTRAINT PKmatch
    PRIMARY KEY (idMatch);
ALTER TABLE t_match CHANGE idMatch idMatch INT NOT NULL AUTO_INCREMENT;

/* t_choix */
ALTER TABLE t_choix
    ADD CONSTRAINT PKchoix
    PRIMARY KEY (idChoix);
ALTER TABLE t_choix CHANGE idChoix idChoix INT NOT NULL AUTO_INCREMENT;

ALTER TABLE t_choix
    ADD CONSTRAINT FKChoixMatch
    FOREIGN KEY (fk_match)
    REFERENCES t_match(idMatch);

ALTER TABLE t_choix
    ADD CONSTRAINT FKChoixPersonne
    FOREIGN KEY (idPersonne)
    REFERENCES t_personne(idPersonne);