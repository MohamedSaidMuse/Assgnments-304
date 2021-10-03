CREATE DATABASE Lab2;
USE Lab2;
CREATE TABLE Publisher ( 
id INT,
Name varchar(60),
 primary key (id)
);

CREATE TABLE Category (
id INT,
name varchar(60),
parentId INT,
FOREIGN KEY (parentId) REFERENCES Publisher(id) ON DELETE CASCADE ON UPDATE CASCADE,
primary key (id)


/*FOREIGN KEY  parentId REFERENCES */
);
CREATE TABLE App  ( 
id INT,
name varchar(60),
publisherId INT,
categoryId INT,
/*FOREIGN KEY (publisherId) REFERENCES Publisher(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (categoryId) REFERENCES category(id) ON DELETE CASCADE ON UPDATE CASCADE, */
description VARCHAR(255)

);
CREATE TABLE  AppVersion  ( 
appId INT,
version char(10),

releaseDate DATETIME,
rating INT,
price Decimal(10,2), 
description VARCHAR(500)

);
CREATE TABLE AppVersionReview  ( 
appId INT,
PRIMARY KEY  (appId),
version CHAR(10),
reviewer CHAR(20),
reviewDate DATETIME,
rating INT,
review VARCHAR(1000));

/*Insert*/
INSERT INTO Publisher (id,name)
 VALUES (1,'Adobe'),
        (2,'Ubisoft');
INSERT INTO Category(id,name,parentId)
VALUES  (1,'Photo and Video',null),
(2,'Editing photos and videos',1),
(3,'Games',null),
(4,'Strategy Games',3);

INSERT INTO App (id,name,publisherId,categoryId,description)
 VALUES (100, 'Photoshop', 1, 2, 'Bring your pictures to life'),
(200, 'Hungry Shark World', 2, 3, 'Endless hunt, eat to survive!');
INSERT INTO AppVersion (appId,version,releaseDate,rating,price,description)
 VALUES (100, '1.0', '2008-09-11', 1, 4.99, 'First version'),
(100, '2.0', '2020-01-01', 5, 19.99, 'Premium version for more money'),
(200, '5.0', '2018-05-23', 3, 1.99, null),
(200, '6.1', '2020-07-11', 5, 0.99, 'Have fun!');



        /* DELETE*/
DELETE FROM  AppVersionReview WHERE rating <= 3;
DELETE FROM  Publisher WHERE id <= 3;


/* Update */
UPDATE AppVersion 
SET price = 2.99
WHERE  appId = 200;
UPDATE App SET id = 700 WHERE id = 100;
UPDATE  AppVersion SET Version = 6.2 WHERE appid = 200;
 UPDATE  AppVersion SET releaseDate = NOW()   WHERE appid = 200;
 
 
 
 































































