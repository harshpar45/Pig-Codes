qu1A = LOAD  '/home/hduser/temp1/' using PigStorage(',') as (s_no:long, case_status, job_title:chararray,year:int, worksite:chararray,city:chararray);

fy1a = filter qu1A by year == 2011;
fy1b = filter fy1a by job_title =='DATA ENGINEER';
fy1c = GROUP fy1b ALL;
fy1d = FOREACH fy1c GENERATE group as job_title, COUNT(fy1b.s_no) as headcount;
--dump fy1d;
fy1e = RANK fy1d;
--dump fy1e;

fy2a = filter qu1A by year == 2012;
fy2b = filter fy2a by job_title =='DATA ENGINEER';
fy2c = GROUP fy2b ALL;
fy2d = FOREACH fy2c GENERATE group as job_title, COUNT(fy2b.s_no) as headcount;
fy2e = RANK fy2d;

fy3a = filter qu1A by year == 2013;
fy3b = filter fy3a by job_title =='DATA ENGINEER';
fy3c = GROUP fy3b ALL;
fy3d = FOREACH fy3c GENERATE group as job_title, COUNT(fy3b.s_no) as headcount;
fy3e = RANK fy3d;

fy4a = filter qu1A by year == 2014;
fy4b = filter fy4a by job_title =='DATA ENGINEER';
fy4c = GROUP fy4b ALL;
fy4d = FOREACH fy4c GENERATE group as job_title, COUNT(fy4b.s_no) as headcount;
fy4e = RANK fy4d;

fy5a = filter qu1A by year == 2015;
fy5b = filter fy5a by job_title =='DATA ENGINEER';
fy5c = GROUP fy5b ALL;
fy5d = FOREACH fy5c GENERATE group as job_title, COUNT(fy5b.s_no) as headcount;
fy5e = RANK fy5d;

fy6a = filter qu1A by year == 2016;
fy6b = filter fy6a by job_title =='DATA ENGINEER';
fy6c = GROUP fy6b ALL;
fy6d = FOREACH fy6c GENERATE group as job_title, COUNT(fy6b.s_no) as headcount;
fy6e = RANK fy6d;

fgt = join fy1e by $0, fy2e by $0, fy3e by $0, fy4e by $0, fy5e by $0, fy6e by $0;
final = FOREACH fgt GENERATE $2,$5,$8,$11,$14,$17,ROUND_TO(((($5-$2)*100)/$2),4),
ROUND_TO(((($8-$5)*100)/$5),4),ROUND_TO(((($11-$8)*100)/$8),4),ROUND_TO(((($14-$11)*100)/$11),4),
ROUND_TO(((($17-$14)*100)/$14),4);
--dump final;
fin2 = FOREACH final GENERATE $6,$7,$8,$9,$10,ROUND_TO((($6+$7+$8+$9+$10)/5),4);
dump fin2;


