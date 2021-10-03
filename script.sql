-- CREATE
CREATE TABLE Publisher ( 
        id INT,
        name VARCHAR(60),
        PRIMARY KEY (id)
);

CREATE TABLE Category (
        id INT,
        name varchar(60),
        parentId INT,
        PRIMARY KEY (id),
        FOREIGN KEY (parentId) REFERENCES Category(id)
);

CREATE TABLE App  ( 
        id INT,
        name VARCHAR(60),
        publisherId INT,
        categoryId INT,
        description VARCHAR(255),
        PRIMARY KEY (id),
        FOREIGN KEY (publisherId) REFERENCES Publisher(id) 
                ON DELETE SET NULL ON UPDATE NO ACTION,
        FOREIGN KEY (categoryId) REFERENCES Category(id) 
                ON DELETE SET NULL ON UPDATE NO ACTION
);

CREATE TABLE  AppVersion  ( 
        appId INT,
        version CHAR(10),
        releaseDate DATETIME,
        rating INT,
        price DECIMAL(10,2), 
        description VARCHAR(500),
        PRIMARY KEY (appId, version),
        FOREIGN KEY (appId) REFERENCES App(id)
                ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE AppVersionReview  ( 
        appId INT,
        version CHAR(10),
        reviewer CHAR(20),
        reviewDate DATETIME NOT NULL,
        rating INT,
        review VARCHAR(1000),
        PRIMARY KEY (appId, version, reviewer),
        FOREIGN KEY (appId, version) REFERENCES AppVersion(appId, version)
                ON DELETE CASCADE ON UPDATE CASCADE
);

-- INSERT
INSERT INTO Publisher VALUES 
(1,'Adobe'),
(2,'Ubisoft');

INSERT INTO Category VALUES  
(1,'Photo and Video',null),
(2,'Editing photos and videos',1),
(3,'Games',null),
(4,'Strategy Games',3);

INSERT INTO App VALUES 
(100, 'Photoshop', 1, 2, 'Bring your pictures to life'),
(200, 'Hungry Shark World', 2, 3, 'Endless hunt, eat to survive!');

INSERT INTO AppVersion VALUES 
(100, '1.0', '2008-09-11', 1, 4.99, 'First version'),
(100, '2.0', '2020-01-01', 5, 19.99, 'Premium version for more money'),
(200, '5.0', '2018-05-23', 3, 1.99, null),
(200, '6.1', '2020-07-11', 5, 0.99, 'Have fun!');


-- DELETE
DELETE FROM  AppVersionReview WHERE rating <= 3;
DELETE FROM  App WHERE publisherId IN (SELECT id FROM Publisher WHERE name = 'Adobe');
-- The number of row being deleted: 7 rows

-- UPDATE
UPDATE AppVersion SET price = 2.99 WHERE appId = 200;
UPDATE App SET id = 700 WHERE id = 100;
UPDATE AppVersion SET version = 6.2, releaseDate = '2021-08-13 12:00:00' WHERE appid = 200 and version = '6.1';
 
 