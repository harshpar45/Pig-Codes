qu1A = LOAD  '/home/hduser/temp1/' using PigStorage(',') as (s_no:long, case_status, job_title:chararray,year:int, worksite:chararray,city:chararray);

fy1a = filter qu1A by year == 2011;
fy1b = filter qu1A by job_title =='DATA ENGINEER';
fy1c = filter fy1b by (case_status =='CERTIFIED');
fy1d = GROUP fy1c by city;
fy1e = FOREACH fy1d GENERATE group as city,COUNT(fy1c.s_no) as counts, '2011' as years;
fy1f = order fy1e by $1 desc;
fy1g = limit fy1f 1;

fy2a = filter qu1A by year == 2012;
fy2b = filter fy2a by job_title =='DATA ENGINEER';
fy2c = filter fy2b by (case_status =='CERTIFIED');
fy2d = GROUP fy2c by city;
fy2e = FOREACH fy2d GENERATE group as city, COUNT(fy2c.s_no) as counts,'2012' as years;
fy2f = order fy2e by $1 desc;
fy2g = limit fy2f 1;

fy3a = filter qu1A by year == 2013;
fy3b = filter fy3a by job_title =='DATA ENGINEER';
fy3c = filter fy3b by (case_status =='CERTIFIED');
fy3d = GROUP fy3c by city;
fy3e = FOREACH fy3d GENERATE group as city, COUNT(fy3c.s_no) as counts,'2013' as years;
fy3f = order fy3e by $1 desc;
fy3g = limit fy3f 1;

fy4a = filter qu1A by year == 2014;
fy4b = filter fy4a by job_title =='DATA ENGINEER';
fy4c = filter fy4b by (case_status =='CERTIFIED');
fy4d = GROUP fy4c by city;
fy4e = FOREACH fy4d GENERATE group as city, COUNT(fy4c.s_no) as counts,'2014' as years;
fy4f = order fy4e by $1 desc;
fy4g = limit fy4f 1;
 
fy5a = filter qu1A by year == 2015;
fy5b = filter fy5a by job_title =='DATA ENGINEER';
fy5c = filter fy5b by (case_status =='CERTIFIED');
fy5d = GROUP fy5c by city;
fy5e = FOREACH fy5d GENERATE group as city, COUNT(fy5c.s_no) as counts, '2015' as years;
fy5f = order fy5e by $1 desc;
fy5g = limit fy5f 1;

fy6a = filter qu1A by year == 2016;
fy6b = filter fy6a by job_title =='DATA ENGINEER';
fy6c = filter fy6b by (case_status =='CERTIFIED');
fy6d = GROUP fy6c by city;
fy6e = FOREACH fy6d GENERATE group as city,COUNT(fy6c.s_no) as counts,'2016' as year;
fy6f = order fy6e by $1 desc;
fy6g = limit fy6f 1;

final = union fy1g,fy2g,fy3g,fy4g,fy5g,fy6g;
fin = order final by $2 asc;
dump fin;

