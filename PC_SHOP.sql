alter table PRODUS
drop constraint FK_ID_CATEGORIE;

alter table PRODUS
drop constraint FK_ID_PRODUCATOR;

alter table DEPOZIT
drop constraint FK2_ID_LOCATIE;

ALTER TABLE COMANDA
DROP CONSTRAINT FK_COD_CLIENT;

ALTER TABLE COMANDA 
DROP CONSTRAINT FK_ID_LIVRATOR;

DROP TABLE PRODUCATOR;
drop table CATEGORIE;
drop table CLIENT;
DROP TABLE LOCATIE;
DROP TABLE LIVRATOR;
drop table COMANDA_PRODUS;
DROP TABLE PRODUS_DEPOZIT;
DROP TABLE PRODUS;
drop table DEPOZIT;
drop table COMANDA;


create table PRODUCATOR
(
id_producator int constraint pk_producator primary key,
nume varchar(20) NOT NULL unique,
tara varchar(20) NOT NULL
);

create table CATEGORIE
(
id_categorie int constraint pk_categorie primary key,
nume varchar(20) NOT NULL unique,
nr_produse int NOT NULL
);

create table LIVRATOR
(
id_livrator int constraint pk_livrator primary key,
nume varchar(20) NOT NULL unique,
pret_per_100km int NOT NULL
);


create table CLIENT
(
cod_client int constraint pk_client primary key,
usernane varchar(20) NOT NULL unique,
email varchar(20) NOT NULL unique,
telefon number(10,0) NOT NULL unique
);

create table LOCATIE
(
id_locatie int constraint pk_locatie primary key,
oras varchar(20) NOT NULL,
strada varchar(20) NOT NULL
);

create table DEPOZIT
(
id_depozit int constraint pk_depozit primary key,
id_locatie int NOT NULL,
constraint fk2_id_locatie foreign key (id_locatie) references LOCATIE (id_locatie)on delete cascade
);

create table PRODUS
(
id_produs int constraint pk_produs primary key,
titlu varchar(30) NOT NULL unique,
release_date date,
price int NOT NULL,
id_producator int,
id_categorie int,
constraint fk_id_producator foreign key (id_producator) references PRODUCATOR (id_producator)on delete cascade,
constraint fk_id_categorie foreign key (id_categorie) references CATEGORIE (id_categorie) on delete cascade
);

create table COMANDA
(
 nr_comanda int constraint pk_comanda primary key,
 data date,
 plasare_comanda date,
 data_livrare date,
 cod_client int NOT NULL,
 id_livrator int NOT NULL,
 constraint fk_cod_client foreign key (cod_client) references CLIENT (cod_client) on delete cascade,
 constraint fk_id_livrator foreign key (id_livrator) references LIVRATOR (id_livrator)
);

create table COMANDA_PRODUS
(
nr_comanda int NOT NULL,
id_produs int NOT NULL,
cantitate int,
constraint pk_comanda_produs primary key (nr_comanda,id_produs),
constraint fk_nr_comanda1 foreign key (nr_comanda) references COMANDA (nr_comanda) on delete cascade,
constraint fk_id_produs1 foreign key (id_produs) references PRODUS (id_produs) on delete cascade
);

create table PRODUS_DEPOZIT
(
id_produs int NOT NULL,
id_depozit int NOT NULL,
cantitate int,
constraint pk_produs_depozit primary key (id_produs,id_depozit),
constraint fk_id_produs2 foreign key (id_produs) references PRODUS (id_produs) on delete cascade,
constraint fk_id_depozit1 foreign key (id_depozit) references DEPOZIT (id_depozit) on delete cascade
);



---1 INSERARE PRODUCATORI

insert into PRODUCATOR (id_producator, nume, tara)
values (11, 'Logitech', 'Elvetia');

insert into PRODUCATOR (id_producator, nume, tara)
values (12, 'Steelseeries', 'Danemarca');

insert into PRODUCATOR (id_producator, nume, tara)
values (13, 'Asus', 'Taiwan');

insert into PRODUCATOR (id_producator, nume, tara)
values (14, 'Nvidia', 'USA');

insert into PRODUCATOR (id_producator, nume, tara)
values (15, 'Intel', 'USA');

insert into PRODUCATOR (id_producator, nume, tara)
values (16, 'AMD', 'USA');

insert into PRODUCATOR (id_producator, nume, tara)
values (17, 'Seasonic', 'Taiwan');

insert into PRODUCATOR (id_producator, nume, tara)
values (18, 'Seagate', 'USA');

insert into PRODUCATOR (id_producator, nume, tara)
values (19, 'Corsair', 'USA');

insert into PRODUCATOR (id_producator, nume, tara)
values (10, 'Aqirys', 'Romania');


----2 INSERARE CATEGORII

insert into CATEGORIE (id_categorie, nume, nr_produse)
values (21, 'Periferice', 15);

insert into CATEGORIE (id_categorie, nume, nr_produse)
values(22, 'Hardware' , 15);

update CATEGORIE
set nr_produse=20;

----3 INSERARE LIVRATORI

insert into LIVRATOR (id_livrator, nume, pret_per_100km)
values (31, 'GLS', 1);

insert into LIVRATOR (id_livrator, nume, pret_per_100km)
values (32, 'Fan Courier', 4);

insert into LIVRATOR (id_livrator, nume, pret_per_100km)
values (33, 'Same day' , 9);


----4 INSERARE CLIENTI
alter table CLIENT
rename column usernane to username;

insert into CLIENT (cod_client, username, email, telefon)
values (41, 'OlteanuMihai4748', 'oltmihai@gmail.com', 0733123932);

insert into CLIENT (cod_client, username, email, telefon)
values(42, 'DanMihai19', 'MihaiDan@gmail.com', 0735129192);

insert into CLIENT (cod_client, username, email, telefon)
values(43, 'MisterIonut', 'Popaion@gmail.com', 0767430442);

insert into CLIENT (cod_client, username, email, telefon)
values(44, 'MissDana', 'Danafast@yahoo.com', 0754130133);

insert into CLIENT (cod_client, username, email, telefon)
values(45, 'Catlover40', 'Balflorin@.yahoo.com', 0253142132);

insert into CLIENT (cod_client, username, email, telefon)
values(46, 'Grammywinner13', 'costidan@gmail.com', 072666222);

insert into CLIENT (cod_client, username, email, telefon)
values(47, 'BogdanRibera', 'riberabogd@gmail.com', 0253172111);

insert into CLIENT (cod_client, username, email, telefon)
values(48, 'CryptoCristi', 'crischifoi@yahoo.com', 0765172219);

insert into CLIENT (cod_client, username, email, telefon)
values(49, 'Tavustefan', 'octastefan@gmail.com', 0757113433);

insert into CLIENT (cod_client, username, email, telefon)
values(50, 'MeriMarian', 'merisescum@gmail.com', 0723187100);

insert into CLIENT (cod_client, username, email, telefon)
values(51, 'Florinnnn11', 'florinn113@gmail.com', 0723170921);

insert into CLIENT (cod_client, username, email, telefon)
values(52, 'DanNicu', 'nicudandan@gmail.com' ,0253130133);

insert into CLIENT (cod_client, username, email, telefon)
values(53, 'Dragosdrs', 'Dragosdrs@yahoo.com', 0766199199);

insert into CLIENT (cod_client, username, email, telefon)
values(54, 'Stefaniagaming', 'stefaniax@gmail.com', 0787190123);

----5 inserare Locatii

insert into LOCATIE (id_locatie, oras, strada)
values (1001, 'Bacau', 'strada Dedeman');

insert into LOCATIE (id_locatie, oras, strada)
values (1002, 'Bucuresti', 'strada independentei');

insert into LOCATIE (id_locatie, oras, strada)
values (1003, 'Cluj', 'strada panselutelor');


---6 inserare Depozite

insert into DEPOZIT(id_depozit, id_locatie)
values(2001, 1001);

insert into DEPOZIT(id_depozit, id_locatie)
values(2002, 1002);

insert into DEPOZIT(id_depozit, id_locatie)
values(2003, 1003);

---7 inserare produse

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(101, 'Tastatura Corsair', '14-JAN-2022', 250, 19, 21);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(102, 'Monitor Asus 144hz', '14-NOV-2022', 1000, 13, 21);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(103, 'Casti Logitech RGB', '13-JUN-2022', 450, 11, 21);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(104, 'Mouse Pad Asus rog', '12-JUN-2022', 90, 13, 21);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(105, 'Tastatura Corsair P7', '13-FEB-2021', 440, 19, 21);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(106, 'Mouse Aqirys PRO2', '14-SEP-2020', 150, 10, 21);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(107, 'Mouse ASUS rog7', '17-AUG-2019', 120, 13, 21);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(108, 'Casti Steelseries Y3', '14-AUG-2018', 230, 12, 21);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(109, 'Casti Steelseries Y6', '14-AUG-2020', 290, 12, 21);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(110, 'Boxe Logitech Z33', '21-MAR-2019', 299, 11, 21);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(111, 'Camera web Logitech g10', '11-FEB-2017', 110, 11, 21);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(112, 'Monitor ASUS rog TUF F2', '13-OCT-2018', 1120, 13, 21);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(113, 'Tastatura Steelseries Apres2', '30-OCT-2020', 350, 12, 21);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(114, 'Mouse Corsair FPRO', '18-FEB-2016', 100, 19, 21);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(115, 'Casti Aqirys Venzia', '19-FEB-2021', 170, 10, 21);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(116, 'Procesor Intel I7 9700k', '19-FEB-2018', 700, 15, 22);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(117, 'Procesor AMD Ryzen 5 2500', '11-MAR-2018', 500, 16, 22);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(118, 'Placa video AMD Rx290', '13-FEB-2017' , 450, 16, 22);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(119, 'Sursa Seasonic v13 650W', '10-JAN-2019', 370, 17, 22);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(120, 'Memorii Ram Corsair rr19x 16GB', '10-APR-2020', 220, 19, 22);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(121, 'Hard-disk Seagate F30F 2TB', '12-APR-2020', 220, 18, 22);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(122, 'SSD Seagate PROx7 250GB', '16-MAY-2019', 170, 18, 22);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(123, 'Placa video Nvidia RTX 4090', '17-MAY-2022', 7400, 14, 22);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(124, 'Procesor Intel I7 12700k','16-JUL-2022', 2300, 15, 22);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(125, 'Sursa Corsair Pirate550 550W', '07-APR-2017', 400, 19, 22);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(126, 'Procesor AMD Ryzen 3 5100', '13-MAR-2021', 650, 16, 22);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(127, 'Placa de baza Asus H702', '03-JAN-2019', 200, 13, 22);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(128, 'Placa video Nvidia RTX 2060', '17-MAY-2020', 1700, 14, 22);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(129, 'Memorii Ram Asus ultimate 32GB', '17-NOV-2022', 400, 13, 22);

insert into PRODUS(id_produs, titlu, release_date, price, id_producator, id_categorie)
values(130, 'Camera web Asus pro4K', '12-NOV-2018', 160, 13, 22);

----inserare Comenzi

alter table COMANDA
drop column data;

insert into COMANDA(nr_comanda, plasare_comanda, data_livrare, cod_client, id_livrator)
values(301, '17-DEC-2022', '20-DEC-2022', 48, 32);

insert into COMANDA(nr_comanda, plasare_comanda, data_livrare, cod_client, id_livrator)
values(302, '12-DEC-2022', '17-DEC-2022', 41, 31);

insert into COMANDA(nr_comanda, plasare_comanda, data_livrare, cod_client, id_livrator)
values(303, '29-NOV-2022', '3-DEC-2022', 42, 33);

insert into COMANDA(nr_comanda, plasare_comanda, data_livrare, cod_client, id_livrator)
values(304, '15-NOV-2022', '21-NOV-2022', 43, 32);

insert into COMANDA(nr_comanda, plasare_comanda, data_livrare, cod_client, id_livrator)
values(305, '15-OCT-2022', '21-OCT-2022', 44, 32);

insert into COMANDA(nr_comanda, plasare_comanda, data_livrare, cod_client, id_livrator)
values(306, '10-SEP-2022', '17-SEP-2022', 45, 31);


---INSERARE COMANDA_PRODUS

insert into COMANDA_PRODUS(nr_comanda, id_produs, cantitate)
values(301, 130, 1);

insert into COMANDA_PRODUS(nr_comanda, id_produs, cantitate)
values(306, 128, 2);

insert into COMANDA_PRODUS(nr_comanda, id_produs, cantitate)
values(302, 109, 1);

insert into COMANDA_PRODUS(nr_comanda, id_produs, cantitate)
values(303,107, 1);

insert into COMANDA_PRODUS(nr_comanda, id_produs, cantitate)
values(304, 105, 1);

insert into COMANDA_PRODUS(nr_comanda, id_produs, cantitate)
values(305, 110, 3);


---inserare PRODUS_DEPOZIT

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(101, 2001, 10);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(102, 2002, 13);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(104, 2003, 20);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(105, 2002, 7);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(103, 2002, 8);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(106, 2003, 19);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(107, 2001, 3);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(108, 2001, 23);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(109, 2003, 40);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(110, 2002, 15);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(111, 2002, 18);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(112, 2001, 24);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(113, 2001, 19);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(114, 2003, 9);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(115, 2002, 20);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(116, 2002, 19);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(117, 2001, 30);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(118, 2002, 10);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(119, 2002, 2);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(120, 2003, 19);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(121, 2001, 22);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(122, 2002, 21);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(123, 2003, 45);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(124, 2003, 51);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(125, 2001, 39);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(126, 2002, 29);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(127, 2002, 41);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(128, 2002, 5);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(129, 2001, 67);

insert into PRODUS_DEPOZIT(id_produs, id_depozit, cantitate)
values(130, 2002, 21);

commit;
