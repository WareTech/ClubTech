DROP DATABASE WareTech_ClubTech;

CREATE DATABASE WareTech_ClubTech;

USE WareTech_ClubTech;

CREATE TABLE IF NOT EXISTS Access (
    id bigint(20) NOT NULL auto_increment,
    version bigint(20) NOT NULL default '0',
    value varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
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
    KEY FK_UserAccess_user (user),
    KEY FK_UserAccess_access (access)
);

INSERT INTO User (id, version,username, password) VALUES
    (1, 1, 'Augusto', 'Soncini'),
    (2, 1, 'Valentino', 'Soncini'),
    (3, 1, 'Catalina', 'Soncini'),
    (4, 1, 'Katia', 'Olchansky');

INSERT INTO Access (id, version,value, description) VALUES
    (1, 1, 'DEVELOPER_ACCESS', 'DEVELOPER_ACCESS'),
    (2, 1, 'SubscriptionCreateMember.jsp', 'SubscriptionCreateMember'),
    (3, 1, 'SubscriptionSearch.jsp', 'SubscriptionSearch'),
    (4, 1, 'SubscriptionEdit.jsp', 'SubscriptionEdit'),
    (5, 1, 'MemberCreate.jsp', 'MemberCreate'),
    (6, 1, 'MemberSearch.jsp', 'MemberSearch'),
    (7, 1, 'TicketCreate.jsp', 'TicketCreate'),
    (8, 1, 'TicketList.jsp', 'TicketList'),
    (9, 1, 'PersonSearchPage.jsp', 'PersonSearchPage'),
    (10, 1, 'BuffetTicketCreate.jsp', 'BuffetTicketCreate'),
    (11, 1, 'BuffetTicketResume.jsp', 'BuffetTicketResume'),
    (12, 1, 'StoreTicketCreate.jsp', 'StoreTicketCreate'),
    (13, 1, 'StoreTicketResume.jsp', 'StoreTicketResume'),
    (14, 1, 'Activities.jsp', 'Activities'),
    (15, 1, 'UserList.jsp', 'UserList'),
    (16, 1, 'AccessList.jsp', 'AccessList');

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
    (16, 1, 1, 16)
  ;
