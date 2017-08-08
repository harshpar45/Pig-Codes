cust = LOAD  '/home/hduser/h1b.csv'  using  PigStorage(',')  AS (s_no:long,case_status, employer_name, soc_name, job_title:chararray, full_time_position,prevailing_wage,year:int, worksite, longitute, latitute);

samp = sample cust 0.3;

dump samp;
