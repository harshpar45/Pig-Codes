log1 = load '/home/hduser/logger1.log' using PigStorage() as (lines:chararray);

split log1 into log2 if SUBSTRING(lines,24,28) =='INFO', log3 if SUBSTRING(lines,24,29) =='ERROR',log4 if SUBSTRING(lines,24,28) == 'WARN';
groupoflog2 = group log2 ALL;
groupoflog3 = group log3 ALL;
groupoflog4 = group log4 ALL;

countoflog2 = foreach groupoflog2 generate group, COUNT(log2);

countoflog3 = foreach groupoflog3 generate group, COUNT(log3);

countoflog4 = foreach groupoflog4 generate group, COUNT(log4);
--dump countoflog2;
--dump countoflog3;
--dump countoflog4;

infogroup = group log2 by SUBSTRING(lines,20,23);
infocount = foreach infogroup generate group, COUNT(log2);
--dump infocount;

