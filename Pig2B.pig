qu1A = LOAD  '/home/hduser/temp1/' using PigStorage(',') as (s_no:long, case_status, job_title:chararray,year:int, worksite:chararray,city:chararray);

fy1a = filter qu1A by year == 2011;
fy1b= filter fy1a by case_status == 'CERTIFIED';
fy1c = GROUP fy1b by (worksite);
fy1d = FOREACH fy1c GENERATE group as worksite, COUNT(fy1b.s_no) as counts,'2011' as years;
fy1e = order fy1d by $1;
fy1f = limit fy1e 5;

fy2a = filter qu1A by year == 2012;
fy2b= filter fy2a by case_status == 'CERTIFIED';
fy2c = GROUP fy2b by (worksite);
fy2d = FOREACH fy2c GENERATE group as worksite, COUNT(fy2b.s_no) as counts,'2012' as years;
fy2e = order fy2d by $1;
fy2f = limit fy2e 5;

fy3a = filter qu1A by year == 2013;
fy3b= filter fy3a by case_status == 'CERTIFIED';
fy3c = GROUP fy3b by (worksite);
fy3d = FOREACH fy3c GENERATE group as worksite, COUNT(fy3b.s_no) as counts, '2013' as years;
fy3e = order fy3d by $1;
fy3f = limit fy3e 5;

fy4a = filter qu1A by year == 2014;
fy4b= filter fy4a by case_status == 'CERTIFIED';
fy4c = GROUP fy4b by (worksite);
fy4d = FOREACH fy4c GENERATE group as worksite, COUNT(fy4b.s_no) as counts,'2014' as years;
fy4e = order fy4d by $1;
fy4f = limit fy4e 5;

fy5a = filter qu1A by year == 2015;
fy5b= filter fy5a by case_status == 'CERTIFIED';
fy5c = GROUP fy5b by (worksite);
fy5d = FOREACH fy5c GENERATE group as worksite, COUNT(fy5b.s_no) as counts,'2015' as years;
fy5e = order fy5d by $1;
fy5f = limit fy5e 5;

fy6a = filter qu1A by year == 2016;
fy6b= filter fy6a by case_status == 'CERTIFIED';
fy6c = GROUP fy6b by (worksite);
fy6d = FOREACH fy6c GENERATE group as worksite, COUNT(fy6b.s_no) as counts,'2016' as years;
fy6e = order fy6d by $1;
fy6f = limit fy6e 5;

final = union fy1f,fy2f,fy3f,fy4f,fy5f,fy6f;
fin = order final by $2 asc;
dump fin;

