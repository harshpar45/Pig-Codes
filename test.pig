cust = LOAD  '/home/hduser/h1b.csv'  using  PigStorage(',')  AS ( s_no:long,case_status, employer_name, soc_name, job_title:chararray, full_time_position,prevailing_wage,year:int, worksite, longitute, latitute);

s2011 = FILTER cust BY year == 2011;
--s2012 = FILTER cust BY year == 2012;
--s2013 = FILTER cust BY year == 2013;
--s2014 = FILTER cust BY year == 2014;
--s2015 = FILTER cust BY year == 2015;

se2011 = FILTER s2011 BY job_title =='Data Engineer';
--se2012 = FILTER s2012 BY job_title =='Data Engineer';
--se2013 = FILTER s2013 BY job_title =='Data Engineer';
--se2014 = FILTER s2014 BY job_title =='Data Engineer';
--se2015 = FILTER s2015 BY job_title =='Data Engineer';

tse2011 = group se2011 ALL;
--tse2012 = group se2012 ALL;
--tse2013 = group se2013 ALL;
--tse2014 = group se2014 ALL;
--tse2015 = group se2015 ALL;

ctse2011 = FOREACH tse2011 GENERATE COUNT(se2011.s_no) as headcount;
dump ctse2011;
--describe tse2011;
--sep2011 = LIMIT se2011 20;
--dump sep2011;
