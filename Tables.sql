create table ETUDIANTS
(
    NO_ETUDIANT number(6) primary key auto_increment not null,
    NOM_ETUDIANT varchar(255),
    PRENOM_ETUDIANT varchar(255),
    NOTEL_ETUDIANT number(10),
    MAIL_ETUDIANT varchar(255),
);

create table PARTICIPATIONS
(
    NO_ETUDIANT number(6) primary key not null, 
    ID_TRAJET number(6) primary key not null,
    GESTION varchar(255),
);

create table TRAJETS
(
    ID_TRAJET number(6) primary key auto_increment not null,
    DATE_TRAJET date,
    HEURE_TRAJET time,
    NB_PLACES number(6),
    constraint FK_ID_LIEU_DEPART foreign key (ID_TRAJET) references LIEU(ID_LIEU),
    constraint FK_ID_LIEU_ARRIVEE foreign key (ID_TRAJET) references LIEU(ID_LIEU),
    constaint FK_ID_EVENT foreign key (ID_TRAJET) references EVENEMENT(ID_EVENT),
);

create table LIEUX
(
    ID_LIEU number(6) primary keyc auto_increment not null,
    ADRESSE_LIEU varchar(255),
    constraint FK_ID_ZONE foreign key (ID_LIEU) references ZONE(ID_ZONE),
);

create table ZONES
(
    ID_ZONE number(6) primary key auto_increment not null,
    NOM_ZONE varchar(255),
);

create table EVENEMENTS
(
    ID_EVENT number(6) primary key auto_increment not null,
    TYPE_EVENT varchar(255),
);

create table RATTACHEMENT
(
    ID_TRAJET number(6) primary key,
    ID_EVENT number(6) primary key,
);

create table COMMENTAIRES
(
    ID_COMMENTAIRE number(6) primary key auto_increment not null,
    NOTE number(2),
    CONTENU_COMMENTAIRE varchar(255),
    heure_commentaire time,
    constraint FK_NO_ETUDIANT foreign key (NO_ETUDIANT) references ETUDIANTS(NO_ETUDIANT) not null,
    constraint FK_ID_TRAJET foreign key (ID_TRAJET) references TRAJET(ID_TRAJET) not null,
);

create table MESSAGES
(
    ID_MESSAGE number(6) primary key auto_increment not null,
    CONTENU_MESSAGE varchar(255),
    HEURE_MESSAGE time,
    constraint FK_NO_ETUDIANT foreign key (NO_ETUDIANT) references ETUDIANTS(NO_ETUDIANT) not null,
    constraint FK_ID_TRAJET foreign key (ID_TRAJET) references TRAJET(ID_TRAJET) not null,
    
);
