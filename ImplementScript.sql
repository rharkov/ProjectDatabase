CREATE DATABASE CONFERENCE_REVIEW;
SHOW DATABASES;
USE CONFERENCE_REVIEW;
CREATE TABLE AUTHOR
(
EmailAddr VARCHAR(320) NOT NULL UNIQUE,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(100) NOT NULL,
PRIMARY KEY (EmailAddr)
);
CREATE TABLE PAPER
(
Id INTEGER unsigned NOT NULL AUTO_INCREMENT,
Title VARCHAR(150) NOT NULL,
AuthorId VARCHAR(320) NOT NULL,
Abstract VARCHAR(2000) NOT NULL,
FileName VARCHAR(300) NOT NULL,
PRIMARY KEY (Id),
FOREIGN KEY (AuthorId) REFERENCES AUTHOR (EmailAddr)
);



CREATE TABLE TOPIC
(
Id INTEGER unsigned NOT NULL AUTO_INCREMENT,
TopicName VARCHAR(150) NOT NULL,
PRIMARY KEY (Id)
);
CREATE TABLE REVIEWER
(
EmailAddr VARCHAR(320) NOT NULL UNIQUE,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(100) NOT NULL,
AuthorFeedback VARCHAR(2000) NOT NULL,
CommiteeFeedback VARCHAR(2000) NOT NULL,
PhoneNum VARCHAR(15) NOT NULL,
Affiliation VARCHAR(1000) NOT NULL,
PRIMARY KEY (EmailAddr)
);
CREATE TABLE REVIEWER_TOPIC
(
TopicId INTEGER unsigned NOT NULL,
ReviewerId VARCHAR(320) NOT NULL,
FOREIGN KEY (TopicId) REFERENCES TOPIC (Id),
FOREIGN KEY (ReviewerId) REFERENCES REVIEWER (EmailAddr)
);


CREATE TABLE REVIEW
(
Id INTEGER unsigned NOT NULL AUTO_INCREMENT,
Recommendation VARCHAR(300) NOT NULL,
MeritScore INTEGER unsigned NOT NULL,
PaperId INTEGER unsigned NOT NULL,
ReadabilityScore INTEGER unsigned NOT NULL,
ReviewerId VARCHAR(320) NOT NULL,
OriginalityScore INTEGER unsigned NOT NULL,
RelevanceScore INTEGER unsigned NOT NULL,
PRIMARY KEY (Id),
FOREIGN KEY (PaperId) REFERENCES PAPER(Id),
FOREIGN KEY (ReviewerId) REFERENCES REVIEWER(EmailAddr)
);
CREATE TABLE ASSIGNED
(
PaperId INTEGER unsigned NOT NULL,
ReviewerId VARCHAR(320) NOT NULL,
FOREIGN KEY (PaperId) REFERENCES PAPER(Id),
FOREIGN KEY (ReviewerId) REFERENCES REVIEWER(EmailAddr)
);
INSERT INTO AUTHOR VALUES ("firstAuthor@author.com", "FirstName", "AuthorLastName");
INSERT INTO AUTHOR VALUES ("secondAuthor@author.com", "SecondName", "AuthorLastName");
INSERT INTO AUTHOR VALUES ("thirdAuthor@author.com", "ThirdName", "AuthorLastName");

INSERT INTO PAPER (Title, Abstract, FileName,AuthorId) VALUES ("First Paper", "This is my first paper abstract, hope you enjoy!","FirstPaper","firstAuthor@author.com");
INSERT INTO PAPER (Title, Abstract, FileName,AuthorId) VALUES ("Second Paper", "This is my second paper abstract, hope you enjoy!", "SecondPaper","secondAuthor@author.com");
INSERT INTO PAPER (Title, Abstract, FileName,AuthorId) VALUES ("Third Paper", "This is my third paper abstract, hope you enjoy!", "ThirdPaper","thirdAuthor@author.com");




INSERT INTO TOPIC (TopicName) VALUES ("First Topic");
INSERT INTO TOPIC (TopicName) VALUES ("Second Topic");
INSERT INTO TOPIC (TopicName) VALUES ("Third Topic");

INSERT INTO REVIEWER VALUES ("firstReviewer@reviewer.com", "FirstName", "ReviewerLastName","This is feedback to author from first reviewer.","This is feedback for commitee from first reviewer.", "1111111","University of PACE");
INSERT INTO REVIEWER VALUES ("secondReviewer@reviewer.com", "SecondName", "ReviewerLastName","This is feedback to author from second reviewer.","This is feedback for commitee from second reviewer.", "2222222","University of PACE");
INSERT INTO REVIEWER VALUES ("thirdReviewer@reviewer.com", "ThirdName", "ReviewerLastName","This is feedback to author from third reviewer.","This is feedback for commitee from third reviewer.", "3333333","University of PACE");

INSERT INTO REVIEWER_TOPIC VALUES (1,"firstReviewer@reviewer.com");
INSERT INTO REVIEWER_TOPIC VALUES (2,"secondReviewer@reviewer.com");
INSERT INTO REVIEWER_TOPIC VALUES (3,"thirdReviewer@reviewer.com");


INSERT INTO REVIEW (Recommendation, MeritScore, PaperId, ReadabilityScore, ReviewerId, OriginalityScore, RelevanceScore) VALUES ("First Recommendation", 8, 1, 8,"firstReviewer@reviewer.com",8, 8);
INSERT INTO REVIEW (Recommendation, MeritScore, PaperId, ReadabilityScore, ReviewerId, OriginalityScore, RelevanceScore) VALUES ("Second Recommendation", 7, 2, 7,"secondReviewer@reviewer.com",7, 7);
INSERT INTO REVIEW (Recommendation, MeritScore, PaperId, ReadabilityScore, ReviewerId, OriginalityScore, RelevanceScore) VALUES ("Third Recommendation", 9, 3, 9,"thirdReviewer@reviewer.com",9, 9);

INSERT INTO ASSIGNED VALUES (1,"firstReviewer@reviewer.com");
INSERT INTO ASSIGNED VALUES (2,"secondReviewer@reviewer.com");
INSERT INTO ASSIGNED VALUES (3,"thirdReviewer@reviewer.com");
