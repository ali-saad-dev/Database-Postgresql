drop table if exists televisions_WallBracket;
drop table if exists wallBrackets;
drop table if exists ciModule;
drop table if exists remoteController;
drop table if exists users;
drop table if exists televisions;
drop table if exists products;



create table users
(
    id serial PRIMARY KEY,
    name varchar(255),
    password varchar(255)
);

create table products
(
    id serial PRIMARY KEY,
    name varchar(255),
    brand varchar(255),
    price double precision,
    currentStock int,
    sold int,
    CONSTRAINT uniqueid_products UNIQUE (id)
);

create table televisions
(
    type varchar(255),
    available double precision,
    refreshRate double precision,
    screenType varchar(255),
    CONSTRAINT uniqueid UNIQUE (id)
) INHERITS (products);

create table wallBrackets
(
    adjustable boolean,
    CONSTRAINT uniqueid_wallBrackets UNIQUE (id)
) INHERITS (products);

create table ciModule
(
    productid int,
    CONSTRAINT uniqueid_ciModule UNIQUE (id)
)INHERITS (products);

create table remoteController
(
    tvId int,
    CONSTRAINT fk_tv FOREIGN KEY (tvId) REFERENCES televisions(id),
    compatibleWith varchar(255),
    batteryType varchar(255),
    CONSTRAINT uniqueid_remoteController UNIQUE (id)
) INHERITS (products);

CREATE TABLE televisions_WallBracket(
                                        tvId int,
                                        wallBracketId int,
                                        CONSTRAINT  pk_tv_wallbracket PRIMARY KEY (tvId, wallBracketId),
                                        CONSTRAINT fk_tv FOREIGN KEY (tvId) REFERENCES televisions(id),
                                        CONSTRAINT fk_wallbrackets FOREIGN KEY (wallBracketId) REFERENCES wallBrackets(id)
);

insert into users(name, password)
values ('Noah Lang', 1223);

insert into televisions(name, brand, price, currentStock, sold, type, available, refreshRate, screenType)
values ('TV', 'Samsung', 15.050, 10, 2000, 'Flat-TV', 80, 100, 'flatScreen'),
       ('TV', 'Sony', 15.050, 10, 2000, 'Flat-TV', 80, 100, 'flatScreen'),
       ('TV', 'LG', 15.050, 10, 2000, 'Flat-TV', 80, 100, 'flatScreen');


insert into wallBrackets(name, brand, price, currentStock, sold, adjustable)
values ('wallBrackets', 'chaina', 15.050, 10, 2000, true),
       ('wallBrackets-TV', 'phlipin', 15.050, 10, 2000, false);

insert into remoteController(tvId, name, brand, price, currentStock, sold, compatibleWith, batteryType)
values ((SELECT id FROM televisions WHERE brand = 'Samsung'),'remoteController', 'Simnus', 15.050, 10, 2000, 'ComputerScreen', 'TeslaBattery');

INSERT INTO televisions_WallBracket (tvId, wallBracketId)
VALUES ((SELECT id FROM televisions WHERE brand = 'Samsung'), (SELECT id FROM wallbrackets WHERE brand = 'chaina')),
       ((SELECT id FROM televisions WHERE brand = 'LG'), (SELECT id FROM wallbrackets WHERE brand = 'phlipin')),
       ((SELECT id FROM televisions WHERE brand = 'Sony'), (SELECT id FROM wallbrackets WHERE brand = 'phlipin'));


select * from televisions

--select * from televisions
