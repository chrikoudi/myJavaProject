CREATE TABLE users (userId INT NOT NULL AUTO_INCREMENT
PRIMARY KEY, username VARCHAR(200), userpass VARCHAR(200));

INSERT INTO users (username, userpass) VALUES ('admin', 'admin');

INSERT INTO users (username, userpass) VALUES ('user1', 'pass1');

INSERT INTO users (username, userpass) VALUES ('user2', 'pass2');

CREATE TABLE poll (id INT(10) unsigned NOT NULL AUTO_INCREMENT
PRIMARY KEY, question VARCHAR(250) NOT NULL);

CREATE TABLE participation (id INT(10) unsigned NOT NULL AUTO_INCREMENT
PRIMARY KEY, username VARCHAR(250) NOT NULL, voted varchar(5));
