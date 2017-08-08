book1 = load '/home/hduser/book1.txt' using PigStorage() as (lines:chararray);
book2 = load '/home/hduser/book2.txt' using PigStorage() as (lines:chararray);
book3 = load '/home/hduser/book3.txt' using PigStorage(',') as (lines:chararray,number:int,booktype:chararray,subject:chararray);

bookcombined = union book1, book2,book3;
dump bookcombined;

describe bookcombined;
