book = load '/home/hduser/book-data' using PigStorage(',') as (book_id:int, price:int, author_id:int);
author = load '/home/hduser/author-data' using PigStorage(',') as (author_id:int, author_name:chararray);
book_filter = filter book by price >200;
author_filter = filter author by SUBSTRING(author_name,0,1) == 'J';
joined_data = join book_filter by $2, author_filter by $0;
dump joined_data;
