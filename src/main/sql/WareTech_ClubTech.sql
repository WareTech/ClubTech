DROP DATABASE IF EXISTS WareTech_ClubTech;

CREATE DATABASE WareTech_ClubTech;

USE WareTech_ClubTech;

CREATE TABLE IF NOT EXISTS Parameter (
    id bigint(20) NOT NULL auto_increment,
    version bigint(20) NOT NULL default '0',
    value varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    parent bigint(20) NULL,
    position int NULL,
    PRIMARY KEY  (id),
    UNIQUE KEY UK_Parameter_value (value),
    CONSTRAINT FK_Parameter_parent FOREIGN KEY (parent) REFERENCES Parameter (id)
    );

CREATE TABLE IF NOT EXISTS Access (
    id bigint(20) NOT NULL auto_increment,
    version bigint(20) NOT NULL default '0',
    value varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    position int NULL,
    PRIMARY KEY  (id),
    UNIQUE KEY UK_Access_value (value)
    );

CREATE TABLE IF NOT EXISTS User (
    id bigint(20) NOT NULL auto_increment,
    version bigint(20) NOT NULL default '0',
    username varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    PRIMARY KEY  (id),
    UNIQUE KEY UK_User_username (username)
    );

CREATE TABLE IF NOT EXISTS UserAccess (
    id bigint(20) NOT NULL auto_increment,
    version bigint(20) NOT NULL default '0',
    user bigint(20) NOT NULL,
    access bigint(20) NOT NULL,
    PRIMARY KEY  (id),
    UNIQUE KEY UK_UserAccess_user_access (user, access),
    CONSTRAINT FK_UserAccess_user FOREIGN KEY (user) REFERENCES User (id),
    CONSTRAINT FK_UserAccess_access FOREIGN KEY (access) REFERENCES Access (id)
    );

CREATE TABLE IF NOT EXISTS Member (
    id bigint(20) NOT NULL auto_increment,
    version bigint(20) NOT NULL default '0',
    firstname varchar(255) NOT NULL,
    lastname varchar(255) NOT NULL,
    dni varchar(255) NOT NULL,
    birthday varchar(8) NOT NULL,
    phone varchar(255) NULL,
    address varchar(255) NULL,
    email varchar(255) NULL,
    father varchar(255) NULL,
    mother varchar(255) NULL,
    paymentType bigint(20) NOT NULL,
    discount bigint(20) NOT NULL,
    activity bigint(20) NOT NULL,
    status bigint(20) NOT NULL,
    note varchar(255) NULL,
    PRIMARY KEY  (id),
    UNIQUE KEY UK_Member_dni (dni),
    CONSTRAINT FK_Member_paymentType FOREIGN KEY (paymentType) REFERENCES Parameter (id),
    CONSTRAINT FK_Member_discount FOREIGN KEY (discount) REFERENCES Parameter (id),
    CONSTRAINT FK_Member_activity FOREIGN KEY (activity) REFERENCES Parameter (id),
    CONSTRAINT FK_Member_status FOREIGN KEY (status) REFERENCES Parameter (id)
    );

INSERT INTO Parameter (id, version,value, description, parent, position) VALUES
    (100, 1, 'PAYMENT_TYPE', 'Medio de Pago', null, null),
    (101, 1, 'PAYMENT_TYPE_CASH', 'Cobrador', 100, null),
    (102, 1, 'PAYMENT_TYPE_BANK_ACCOUNT', 'Debito en Cuenta', 100, null),
    (103, 1, 'PAYMENT_TYPE_CREDIT_CARD', 'Tarjeta de Credito', 100, null),
    (200, 1, 'DISCOUNT', 'Descuento', null, null),
    (201, 1, 'DISCOUNT_0', 'Sin descuento', 200, null),
    (202, 1, 'DISCOUNT_10', '10%', 200, null),
    (203, 1, 'DISCOUNT_25', '25%', 200, null),
    (204, 1, 'DISCOUNT_33', '33%', 200, null),
    (205, 1, 'DISCOUNT_50', '50%', 200, null),
    (206, 1, 'DISCOUNT_66', '66%', 200, null),
    (207, 1, 'DISCOUNT_75', '75%', 200, null),
    (208, 1, 'DISCOUNT_100', '100%', 200, null),
    (300, 1, 'ACTIVITY', 'Actividad', null, null),
    (301, 1, 'ACTIVITY_NO_ACTIVITY', 'Sin actividad', 300, null),
    (302, 1, 'ACTIVITY_ZUMBA', 'Zumba', 300, null),
    (303, 1, 'ACTIVITY_GYM', 'Gimnasia', 300, null),
    (310, 1, 'ACTIVITY_SOCCER', 'Futbol', 300, null),
    (320, 1, 'ACTIVITY_SOCCER_FEMALE', 'Femenino', 310, null),
    (321, 1, 'ACTIVITY_SOCCER_FEMALE_1', 'Primera', 320, null),
    (322, 1, 'ACTIVITY_SOCCER_FEMALE_3', 'Tercera', 320, null),
    (323, 1, 'ACTIVITY_SOCCER_FEMALE_SUB_18', 'Sub-18', 320, null),
    (324, 1, 'ACTIVITY_SOCCER_FEMALE_SUB_17', 'Sub-17', 320, null),
    (325, 1, 'ACTIVITY_SOCCER_FEMALE_SUB_16', 'Sub-16', 320, null),
    (326, 1, 'ACTIVITY_SOCCER_FEMALE_SUB_14', 'Sub-14', 320, null),
    (327, 1, 'ACTIVITY_SOCCER_FEMALE_SUB_10', 'Sub-10', 320, null),
    (350, 1, 'ACTIVITY_SOCCER_MALE', 'Masculino', 310, null),
    (360, 1, 'ACTIVITY_SOCCER_MALE_MAJOR', 'Mayores', 350, null),
    (370, 1, 'ACTIVITY_SOCCER_MALE_YOUTH', 'Juveniles', 350, null),
    (380, 1, 'ACTIVITY_SOCCER_MALE_INFANT', 'Infantiles', 350, null),
    (400, 1, 'STATUS', 'Estado', null, null),
    (401, 1, 'STATUS_SIGNED', 'Fichado', 400, null),
    (402, 1, 'STATUS_LISTED', 'Listado', 400, null),
    (403, 1, 'STATUS_AVAILABLE', 'Habilitado', 400, null),
    (404, 1, 'STATUS_ADDED', 'Agregado', 400, null),
    (405, 1, 'STATUS_PRE_SIGNED', 'Pre Inscripción', 400, null);

INSERT INTO User (id, version,username, password) VALUES
    (1, 1, 'admin', 'admin'),
    (2, 1, 'Augusto', 'Soncini'),
    (3, 1, 'Valentino', 'Soncini'),
    (4, 1, 'Catalina', 'Olchansky');

INSERT INTO Access (id, version,value, description, position) VALUES
    (1, 1, 'DEVELOPER_ACCESS', 'DEVELOPER_ACCESS', null),
    (2, 1, 'SubscriptionCreateMember.jsp', 'SubscriptionCreateMember', null),
    (3, 1, 'SubscriptionSearch.jsp', 'SubscriptionSearch', null),
    (4, 1, 'SubscriptionEdit.jsp', 'SubscriptionEdit', null),
    (5, 1, 'MemberCreate.jsp', 'MemberCreate', null),
    (6, 1, 'MemberSearch.jsp', 'MemberSearch', null),
    (7, 1, 'TicketCreate.jsp', 'TicketCreate', null),
    (8, 1, 'TicketList.jsp', 'TicketList', null),
    (9, 1, 'PersonSearchPage.jsp', 'PersonSearchPage', null),
    (10, 1, 'BuffetTicketCreate.jsp', 'BuffetTicketCreate', null),
    (11, 1, 'BuffetTicketResume.jsp', 'BuffetTicketResume', null),
    (12, 1, 'StoreTicketCreate.jsp', 'StoreTicketCreate', null),
    (13, 1, 'StoreTicketResume.jsp', 'StoreTicketResume', null),
    (14, 1, 'Activities.jsp', 'Activities', null),
    (15, 1, 'UserList.jsp', 'UserList', null),
    (16, 1, 'AccessList.jsp', 'AccessList', null);

INSERT INTO UserAccess (id, version, user, access) VALUES
    (1, 1, 1, 1),
    (2, 1, 1, 2),
    (3, 1, 1, 3),
    (4, 1, 1, 4),
    (5, 1, 1, 5),
    (6, 1, 1, 6),
    (7, 1, 1, 7),
    (8, 1, 1, 8),
    (9, 1, 1, 9),
    (10, 1, 1, 10),
    (11, 1, 1, 11),
    (12, 1, 1, 12),
    (13, 1, 1, 13),
    (14, 1, 1, 14),
    (15, 1, 1, 15),
    (16, 1, 1, 16);
