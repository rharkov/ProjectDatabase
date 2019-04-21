INSERT INTO PAPER (Title, Abstract, FileName) VALUES ("First Paper", "This is my first paper abstract, hope you enjoy!","FirstPaper");
INSERT INTO PAPER (Title, Abstract, FileName) VALUES ("Second Paper", "This is my second paper abstract, hope you enjoy!", "SecondPaper");
INSERT INTO PAPER (Title, Abstract, FileName) VALUES ("Third Paper", "This is my third paper abstract, hope you enjoy!", "ThirdPaper");

INSERT INTO AUTHOR VALUES ("firstAuthor@author.com", "FirstName", "AuthorLastName");
INSERT INTO AUTHOR VALUES ("secondAuthor@author.com", "SecondName", "AuthorLastName");
INSERT INTO AUTHOR VALUES ("thirdAuthor@author.com", "ThirdName", "AuthorLastName");

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