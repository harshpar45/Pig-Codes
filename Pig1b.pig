qu1A = LOAD  '/home/hduser/temp1/' using PigStorage(',') as (s_no:long, case_status, job_title:chararray,year:int, worksite:chararray,city:chararray);

fy1a = filter qu1A by year == 2011;
fy1b= GROUP fy1a by job_title;
fy1c = FOREACH fy1b GENERATE group as job_title, COUNT(fy1a.s_no) as counts;
fy1d = order fy1c by $0 asc;

fy2a = filter qu1A by year == 2012;
fy2b= GROUP fy2a by job_title;
fy2c = FOREACH fy2b GENERATE group as job_title, COUNT(fy2a.s_no) as counts;
fy2d = order fy2c by $0 asc;

fy3a = filter qu1A by year == 2013;
fy3b= GROUP fy3a by job_title;
fy3c = FOREACH fy3b GENERATE group as job_title, COUNT(fy3a.s_no) as counts;
fy3d = order fy3c by $0 asc;

fy4a = filter qu1A by year == 2014;
fy4b= GROUP fy4a by job_title;
fy4c = FOREACH fy4b GENERATE group as job_title, COUNT(fy4a.s_no) as counts;
fy4d = order fy4c by $0 asc;

fy5a = filter qu1A by year == 2015;
fy5b= GROUP fy5a by job_title;
fy5c = FOREACH fy5b GENERATE group as job_title, COUNT(fy5a.s_no) as counts;
fy5d = order fy5c by $0 asc;

fy6a = filter qu1A by year == 2016;
fy6b= GROUP fy6a by job_title;
fy6c = FOREACH fy6b GENERATE group as job_title, COUNT(fy6a.s_no) as counts;
fy6d = order fy6c by $0 asc;

tgt = join fy1d by $0, fy2d by $0, fy3d by $0,fy4d by $0,fy5d by $0,fy6d by $0;
final = FOREACH tgt GENERATE $0, $1,$3,$5,$7,$9,$11, ($3-$1), ($5-$3), ($7-$5),($9-$7), ($11-$9);
fin = FOREACH final GENERATE $0, ROUND_TO((($7+$8+$9+$10+$11)/5),2);
fin2 = order fin by $1 desc;
fin3 = LIMIT fin2 5;
dump fin3;

