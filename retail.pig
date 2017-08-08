bag2000 = LOAD '/home/hduser/2000.txt' USING PigStorage(',') AS (cat_id,cat_name,jan:double,feb:double,march:double,april:double,may:double,june:double,
july:double,aug:double,sep:double,oct:double,nov:double,dec:double);
bag2001 = LOAD '/home/hduser/2001.txt' USING PigStorage(',') AS (cat_id,cat_name,jan:double,feb:double,march:double,april:double,may:double,june:double,
july:double,aug:double,sep:double,oct:double,nov:double,dec:double);
bag2002 = LOAD '/home/hduser/2002.txt' USING PigStorage(',') AS (cat_id,cat_name,jan:double,feb:double,march:double,april:double,may:double,june:double,
july:double,aug:double,sep:double,oct:double,nov:double,dec:double);
total_2000 = foreach bag2000 generate $0, $1, ($2+$3+$4+$5+$6+$7+$8+$9+$10+$11+$12+$13) AS total_month1;
total_2001 = foreach bag2001 generate $0, $1, ($2+$3+$4+$5+$6+$7+$8+$9+$10+$11+$12+$13) AS total_month2;
total_2002 = foreach bag2002 generate $0, $1, ($2+$3+$4+$5+$6+$7+$8+$9+$10+$11+$12+$13) AS total_month3;
retailjoin = join total_2000 by $0, total_2001 by $0, total_2002 by $0;
retail_join= foreach retailjoin generate $0,$1,$2,$5,$8;
retail_sum= foreach retail_join generate $0,$1,ROUND_TO($2+$3+$4,2) as totalsales;


ordertop5 = order retail_sum by $2 desc;
--dump ordertop5;

--top5product = limit ordertop5 5;
--dump top5product;

orderbottom5 = order retail_sum by $2 asc;
btm5product = limit orderbottom5 5; 
dump btm5product;

--dump retail_join;
--growth2001= foreach retail_join generate $0,$1,ROUND_TO((($3-$2)/$2*100),2) as growth1,ROUND_TO((($4-$3)/$3*100),2) as growth2;
--avg_growth = foreach growth2001 generate $0,$1,$2,$3,ROUND_TO((($3+$2)/2),2) as avg_growth;

--dump avg_growth;

--growth10 = filter avg_growth by avg_growth>10;
--growth10 = filter avg_growth by avg_growth<-5;
--dump growth10;
