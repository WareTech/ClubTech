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

CREATE TABLE IF NOT EXISTS User (
    id bigint(20) NOT NULL auto_increment,
    version bigint(20) NOT NULL default '0',
    username varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    token varchar(255) NULL,
    PRIMARY KEY  (id),
    UNIQUE KEY UK_User_username (username),
    UNIQUE KEY UK_User_token (token)
    );

CREATE TABLE IF NOT EXISTS Access (
    id bigint(20) NOT NULL auto_increment,
    version bigint(20) NOT NULL default '0',
    value varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    PRIMARY KEY  (id),
    UNIQUE KEY UK_Access_value (value)
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
    dni varchar(255) NULL,
    birthday varchar(8) NULL,
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
    CONSTRAINT FK_Member_paymentType FOREIGN KEY (paymentType) REFERENCES Parameter (id),
    CONSTRAINT FK_Member_discount FOREIGN KEY (discount) REFERENCES Parameter (id),
    CONSTRAINT FK_Member_activity FOREIGN KEY (activity) REFERENCES Parameter (id),
    CONSTRAINT FK_Member_status FOREIGN KEY (status) REFERENCES Parameter (id)
    );

CREATE TABLE IF NOT EXISTS Subscription (
    id bigint(20) NOT NULL auto_increment,
    version bigint(20) NOT NULL default '0',
    activity bigint(20) NOT NULL,
    period bigint(20) NOT NULL,
    amount int(5) NOT NULL,
    PRIMARY KEY  (id),
    CONSTRAINT FK_Suscription_activity FOREIGN KEY (activity) REFERENCES Parameter (id),
    CONSTRAINT FK_Suscription_period FOREIGN KEY (period) REFERENCES Parameter (id),
    UNIQUE KEY UK_Suscription_period_activity (period, activity)
    );

CREATE TABLE IF NOT EXISTS Payment (
    id bigint(20) NOT NULL auto_increment,
    version bigint(20) NOT NULL default '0',
    member bigint(20) NOT NULL,
    subscription bigint(20) NOT NULL,
    amount int(5) NOT NULL,
    user bigint(20) NULL,
    datetime varchar(14) NULL,
    PRIMARY KEY  (id),
    CONSTRAINT FK_Payment_member FOREIGN KEY (member) REFERENCES Member (id),
    CONSTRAINT FK_Payment_subscription FOREIGN KEY (subscription) REFERENCES Subscription (id),
    CONSTRAINT FK_Payment_user FOREIGN KEY (user) REFERENCES User (id),
    UNIQUE KEY UK_Payment_member_subscription (member, subscription)
    );

INSERT INTO Parameter (id, version,value, description, parent, position) VALUES
    (1, 0, 'PERIOD', 'Periodo', null, null),
    (2, 0, 'PERIOD_202000', '2020 Anual', 1, 1),
    (3, 0, 'PERIOD_202001', '2020 Enero', 1, 2),
    (4, 0, 'PERIOD_202002', '2020 Febrero', 1, 3),
    (5, 0, 'PERIOD_202003', '2020 Marzo', 1, 4),
    (6, 0, 'PERIOD_202004', '2020 Abril', 1, 5),
    (7, 0, 'PERIOD_202005', '2020 Mayo', 1, 6),
    (8, 0, 'PERIOD_202006', '2020 Junio', 1, 7),
    (9, 0, 'PERIOD_202007', '2020 Julio', 1, 8),
    (10, 0, 'PERIOD_202008', '2020 Agosto', 1, 9),
    (11, 0, 'PERIOD_202009', '2020 Septiembre', 1, 10),
    (12, 0, 'PERIOD_202010', '2020 Octubre', 1, 11),
    (13, 0, 'PERIOD_202011', '2020 Noviembre', 1, 12),
    (14, 0, 'PERIOD_202012', '2020 Diciembre', 1, 13),
    (100, 0, 'PAYMENT_TYPE', 'Medio de Pago', null, null),
    (101, 0, 'PAYMENT_TYPE_CASH', 'Cobrador', 100, 1),
    (102, 0, 'PAYMENT_TYPE_BANK_ACCOUNT', 'Debito en Cuenta', 100, 2),
    (103, 0, 'PAYMENT_TYPE_CREDIT_CARD', 'Tarjeta de Credito', 100, 3),
    (200, 0, 'DISCOUNT', 'Descuento', null, null),
    (201, 0, 'DISCOUNT_0', 'Sin descuento', 200, 1),
    (202, 0, 'DISCOUNT_10', '10%', 200, 2),
    (203, 0, 'DISCOUNT_25', '25%', 200, 3),
    (204, 0, 'DISCOUNT_33', '33%', 200, 4),
    (205, 0, 'DISCOUNT_50', '50%', 200, 5),
    (206, 0, 'DISCOUNT_66', '66%', 200, 6),
    (207, 0, 'DISCOUNT_75', '75%', 200, 7),
    (208, 0, 'DISCOUNT_100', '100%', 200, 8),
    (300, 0, 'ACTIVITY', 'Actividad', null, null),
    (301, 0, 'ACTIVITY_NO_ACTIVITY', 'Sin actividad', 300, 4),
    (302, 0, 'ACTIVITY_ZUMBA', 'Zumba', 300, 2),
    (303, 0, 'ACTIVITY_GYM', 'Gimnasia', 300, 3),
    (310, 0, 'ACTIVITY_SOCCER', 'Futbol', 300, 1),
    (320, 0, 'ACTIVITY_SOCCER_FEMALE', 'Femenino', 310, null),
    (321, 0, 'ACTIVITY_SOCCER_FEMALE_1', 'Primera', 320, null),
    (322, 0, 'ACTIVITY_SOCCER_FEMALE_3', 'Tercera', 320, null),
    (323, 0, 'ACTIVITY_SOCCER_FEMALE_SUB_18', 'Sub-18', 320, null),
    (324, 0, 'ACTIVITY_SOCCER_FEMALE_SUB_17', 'Sub-17', 320, null),
    (325, 0, 'ACTIVITY_SOCCER_FEMALE_SUB_16', 'Sub-16', 320, null),
    (326, 0, 'ACTIVITY_SOCCER_FEMALE_SUB_14', 'Sub-14', 320, null),
    (327, 0, 'ACTIVITY_SOCCER_FEMALE_SUB_10', 'Sub-10', 320, null),
    (350, 0, 'ACTIVITY_SOCCER_MALE', 'Masculino', 310, null),
    (360, 0, 'ACTIVITY_SOCCER_MALE_MAJOR', 'Mayores', 350, null),
    (370, 0, 'ACTIVITY_SOCCER_MALE_YOUTH', 'Juveniles', 350, null),
    (380, 0, 'ACTIVITY_SOCCER_MALE_INFANT', 'Infantiles', 350, null),
    (400, 0, 'STATUS', 'Estado', null, null),
    (401, 0, 'STATUS_SIGNED', 'Fichado', 400, null),
    (402, 0, 'STATUS_LISTED', 'Listado', 400, null),
    (403, 0, 'STATUS_AVAILABLE', 'Habilitado', 400, null),
    (404, 0, 'STATUS_ADDED', 'Agregado', 400, null),
    (405, 0, 'STATUS_PRE_SIGNED', 'Pre Inscripción', 400, null),
    (406, 0, 'STATUS_SCHOOL', 'Escuelita', 400, null);

INSERT INTO User (id, version,username, password, token) VALUES
    (1, 0, 'admin', 'YWRtaW4=', null), -- admin
    (2, 0, 'Augusto', 'Q2x1YlRlY2g=', null), -- ClubTech
    (3, 0, 'Valentino', 'Q2x1YlRlY2g=', null), -- ClubTech
    (4, 0, 'Catalina', 'Q2x1YlRlY2g=', null); -- ClubTech

INSERT INTO Access (id, version,value, description) VALUES
    (1, 0, 'DEVELOPER_ACCESS', 'DEVELOPER_ACCESS'),
    (2, 0, 'PaymentCreateMember.jsp', 'PaymentCreateMember'),
    (3, 0, 'SubscriptionSearch.jsp', 'SubscriptionSearch'),
    (4, 0, 'SubscriptionEdit.jsp', 'SubscriptionEdit'),
    (5, 0, 'MemberCreate.jsp', 'MemberCreate'),
    (6, 0, 'MemberSearch.jsp', 'MemberSearch'),
    (7, 0, 'TicketCreate.jsp', 'TicketCreate'),
    (8, 0, 'TicketList.jsp', 'TicketList'),
    (9, 0, 'PersonSearchPage.jsp', 'PersonSearchPage'),
    (10, 0, 'BuffetTicketCreate.jsp', 'BuffetTicketCreate'),
    (11, 0, 'BuffetTicketResume.jsp', 'BuffetTicketResume'),
    (12, 0, 'StoreTicketCreate.jsp', 'StoreTicketCreate'),
    (13, 0, 'StoreTicketResume.jsp', 'StoreTicketResume'),
    (14, 0, 'ActivitySearch.jsp', 'ActivitySearch'),
    (15, 0, 'UserSearch.jsp', 'UserSearch'),
    (16, 0, 'AccessSearch.jsp', 'AccessSearch'),
    (17, 0, 'MembersLoad.jsp', 'MembersLoad'),
    (18, 0, 'ProcessList.jsp', 'ProcessList'),
    (19, 0, 'MemberEdit.jsp', 'MemberEdit'),
    (20, 0, 'UserProfile.jsp', 'UserProfile'),
    (21, 0, 'UserView.jsp', 'UserView'),
    (22, 0, 'AccessView.jsp', 'AccessView'),
    (23, 0, 'ActivityView.jsp', 'ActivityView'),
    (24, 0, 'ActivityEdit.jsp', 'ActivityEdit'),
    (25, 0, 'ActivityCreate.jsp', 'ActivityCreate'),
    (26, 0, 'UserCreate.jsp', 'UserCreate'),
    (27, 0, 'PaymentCreateSubscription.jsp', 'PaymentCreateSubscription'),
    (28, 0, 'PaymentCreateConfirm.jsp', 'PaymentCreateConfirm'),
    (29, 0, 'PaymentSearch.jsp', 'PaymentSearch');

INSERT INTO UserAccess (id, version, user, access) VALUES
    (1, 0, 1, 1),
    (2, 0, 1, 2),
    (3, 0, 1, 3),
    (4, 0, 1, 4),
    (5, 0, 1, 5),
    (6, 0, 1, 6),
    (7, 0, 1, 7),
    (8, 0, 1, 8),
    (9, 0, 1, 9),
    (10, 0, 1, 10),
    (11, 0, 1, 11),
    (12, 0, 1, 12),
    (13, 0, 1, 13),
    (14, 0, 1, 14),
    (15, 0, 1, 15),
    (16, 0, 1, 16),
    (17, 0, 1, 17),
    (18, 0, 1, 18),
    (19, 0, 1, 19),
    (20, 0, 1, 20),
    (21, 0, 1, 21),
    (22, 0, 1, 22),
    (23, 0, 1, 23),
    (24, 0, 1, 24),
    (25, 0, 1, 25),
    (26, 0, 1, 26),
    (27, 0, 1, 27),
    (28, 0, 1, 28),
    (29, 0, 1, 29);