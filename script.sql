create table ETUDIANTS
(
    NO_ETUDIANT int(6) primary key auto_increment not null,
    NOM_ETUDIANT varchar(255),
    PRENOM_ETUDIANT varchar(255),
    NOTEL_ETUDIANT int(10),
    MAIL_ETUDIANT varchar(255)
);


create table ZONES
(
    ID_ZONE int(6) primary key auto_increment not null,
    NOM_ZONE varchar(255)
);  

create table LIEUX
(
    ID_LIEU int(6) primary key auto_increment not null,
    ADRESSE_LIEU varchar(255),
    ID_ZONE int(6),
    foreign key (ID_ZONE) references ZONES(ID_ZONE)
);

create table EVENEMENTS
(
    ID_EVENT int(6) primary key auto_increment not null,
    TYPE_EVENT varchar(255)
);


create table TRAJETS
(
    ID_TRAJET int(6) primary key auto_increment not null,
    DATE_TRAJET date,
    HEURE_TRAJET time,
    NB_PLACES int(6),
    ID_DEPART int(6),
    ID_ARRIVEE int(6),
    ID_EVENT int(6),
    foreign key (ID_DEPART) references LIEUX(ID_LIEU),
    foreign key (ID_ARRIVEE) references LIEUX(ID_LIEU),
    foreign key (ID_EVENT) references EVENEMENTS(ID_EVENT)
);

create table RATTACHEMENT
(
    ID_TRAJET int(6),
    ID_EVENT int(6),
    primary key (ID_TRAJET,ID_EVENT),
    foreign key (ID_TRAJET) references TRAJETS(ID_TRAJET),
    foreign key (ID_EVENT) references EVENEMENTS(ID_EVENT)
);

create table PARTICIPATIONS
(
    NO_ETUDIANT int(6)not null, 
    ID_TRAJET int(6)not null,
    GESTION varchar(255),
    primary key (NO_ETUDIANT,ID_TRAJET),
    foreign key (NO_ETUDIANT) references ETUDIANTS(NO_ETUDIANT),
    foreign key (ID_TRAJET) references TRAJETS(ID_TRAJET)
);


create table COMMENTAIRES_TRAJETS
(
    ID_COMMENTAIRE int(6) primary key auto_increment not null,
    NOTE int(2),
    CONTENU_COMMENTAIRE varchar(255),
	HEURE_COMMENTAIRE time,
    NO_ETUDIANT int(6),
    ID_TRAJET int(6),
    foreign key (NO_ETUDIANT) references ETUDIANTS(NO_ETUDIANT),
	foreign key (ID_TRAJET) references TRAJETS(ID_TRAJET)
);

create table COMMENTAIRES_PERSONNES
(
    ID_COMMENTAIRE int(6) primary key auto_increment not null,
    NOTE int(2),
    CONTENU_COMMENTAIRE varchar(255),
	HEURE_COMMENTAIRE time,
    NO_ETUDIANT_CIBLE int(6),
    NO_ETUDIANT_SOURCE int(6),
    foreign key (NO_ETUDIANT_CIBLE) references ETUDIANTS(NO_ETUDIANT),
	foreign key (NO_ETUDIANT_SOURCE) references ETUDIANTS(NO_ETUDIANT)
);

create table MESSAGES
(
    ID_MESSAGE int(6) primary key auto_increment not null,
    CONTENU_MESSAGE varchar(255),
    HEURE_MESSAGE time,
    NO_ETUDIANT int(6),
    ID_TRAJET int(6),
    foreign key (NO_ETUDIANT) references ETUDIANTS(NO_ETUDIANT),
    foreign key (ID_TRAJET) references TRAJETS(ID_TRAJET)
);