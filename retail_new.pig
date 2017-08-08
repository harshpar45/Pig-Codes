bag2000 = LOAD '/home/hduser/2000.txt' USING PigStorage(',') AS (cat_id,cat_name,jan:double,feb:double,march:double,april:double,may:double,june:double,
july:double,aug:double,sep:double,oct:double,nov:double,dec:double);
bag2001 = LOAD '/home/hduser/2001.txt' USING PigStorage(',') AS (cat_id,cat_name,jan:double,feb:double,march:double,april:double,may:double,june:double,
july:double,aug:double,sep:double,oct:double,nov:double,dec:double);
bag2002 = LOAD '/home/hduser/2002.txt' USING PigStorage(',') AS (cat_id,cat_name,jan:double,feb:double,march:double,april:double,may:double,june:double,
july:double,aug:double,sep:double,oct:double,nov:double,dec:double);

totalgroup1 = Group bag2000 ALL;
totalgroup2 = Group bag2001 ALL;
totalgroup3 = Group bag2002 ALL;

--dump totalgroup1;
--describe totalgroup1;

monthwise2000 = foreach totalgroup1 generate SUM(bag2000.jan) AS jantotal, SUM(bag2000.feb) AS febtotal, SUM(bag2000.march) AS marchtotal,SUM(bag2000.april) AS apriltotal , SUM(bag2000.may) AS maytotal , SUM(bag2000.june) AS junetotal, SUM(bag2000.july) AS julytotal, SUM(bag2000.aug) AS augtotal, SUM(bag2000.sep) AS septotal , SUM(bag2000.oct) AS octtotal, SUM(bag2000.nov) AS novtotal, SUM(bag2000.dec) AS dectotal;

monthwise2001 = foreach totalgroup2 generate SUM(bag2001.jan) AS jantotal, SUM(bag2001.feb) AS febtotal, SUM(bag2001.march) AS marchtotal,SUM(bag2001.april) AS apriltotal , SUM(bag2001.may) AS maytotal , SUM(bag2001.june) AS junetotal, SUM(bag2001.july) AS julytotal, SUM(bag2001.aug) AS augtotal, SUM(bag2001.sep) AS septotal , SUM(bag2001.oct) AS octtotal, SUM(bag2001.nov) AS novtotal, SUM(bag2001.dec) AS dectotal;

monthwise2002 = foreach totalgroup3 generate SUM(bag2002.jan) AS jantotal, SUM(bag2002.feb) AS febtotal, SUM(bag2002.march) AS marchtotal,SUM(bag2002.april) AS apriltotal , SUM(bag2002.may) AS maytotal , SUM(bag2002.june) AS junetotal, SUM(bag2002.july) AS julytotal, SUM(bag2002.aug) AS augtotal, SUM(bag2002.sep) AS septotal , SUM(bag2002.oct) AS octtotal, SUM(bag2002.nov) AS novtotal, SUM(bag2002.dec) AS dectotal;

--store monthwise2000 into '/home/hduser/temp21' using PigStorage(',');

--bag1 = load '/home/hduser/temp21' using PigStorage() AS (lines:chararray);

bag2000_pre = foreach monthwise2000 generate FLATTEN(TOBAG(*));

bag2000 = RANK bag2000_pre;

--dump bag3;

bag2001_pre = foreach monthwise2001 generate FLATTEN(TOBAG(*));

bag2001 = RANK bag2001_pre;

bag2002_pre = foreach monthwise2002 generate FLATTEN(TOBAG(*));

bag2002 = RANK bag2002_pre;
--dump bag2002;

top10join = join bag2000 by $0, bag2001 by $0, bag2002 by $0;
--dump top10join;

monthly_compare = foreach top10join generate $0,$1,$3,$5,ROUND_TO((($3-$1)/$1*100),2), ROUND_TO((($5-$3)/$3*100),2);
--dump monthly_compare;

avg_growth = foreach monthly_compare generate $0,$1,$2,$3,$4,$5,ROUND_TO((($4+$5)/2),2);
--dump avg_growth;

final = order avg_growth by $6 desc;
--dump final;

--dump monthwise2000;
dump bag2000_pre;

