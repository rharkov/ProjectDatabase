# ProjectDatabase
CS 623 Database Management Project Repository

IMPLEMENTATION

I have created a database CONFERENCE_REVIEW and then I create 7 tables (AUTHOR,TOPIC,REVIEWER,REVIEWER_TOPIC,REVIEW,ASSIGNED).

REVIEW_TOPIC is a intermediate table using foreign keys from TOPIC table and REVIEWER table. Otherwise if the same REVIEWER would review different topic but a REVIEWER ReviewerId which is PK would be duplicate which results in violation of integrity constraint.

ASSIGNED table is also intermediate table, because the relationship between PAPER table and REVIEWER is M:N. 

PAPER table has primary key Id which uniquely identify each paper and it is also auto incremented.

AUTHOR table has primary key as EmailAddr which uniquely identify each author.

TOPIC table has primary key Id which uniquely identify each topic and it is also auto incremented.

REVIEWER table has primary key EmailAddr which uniquely identify each reviewer.

REVIEWER_TOPIC table has two foreign keys: TopicId and ReviewerId. It helps to assign the same reviewer to multiple topics without violating integrity constraint.

REVIEW table has primary key Id which uniquely identify each review and it is also auto incremented. It has two foreign keys: PaperId and ReviewerId. Review must have relationship with paper and reviewer, because without those two the review would not exist.

ASSIGNED table has two foreign keys: PaperId and ReviewerId.

POPULATING

I have successfully populated each table with three instances. The data is not very realistic but it was done to understand how to populate the data. 

CONCLUSION

I have learned how to implement the database and create tables and populate tables with data. I have also learned how important are intermediate tables and foreign keys, because theory is theory and practice is practice. 



