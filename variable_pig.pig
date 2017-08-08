book = load '$input' using TextLoader() as (lines:chararray);

transform = foreach book generate FLATTEN(TOKENIZE(lines)) as word;

transform1 = foreach transform generate TRIM(LOWER(REPLACE(word,'[\\p{Punct}, \\p{Cntrl}]',''))) as word;

--transform2 = filter transform1 by word == '$myword' ;

--dump transform2;

groupbyword = group transform1 by word;

--dump groupbyword;

counttoforeachword = foreach groupbyword generate group , COUNT(transform1);

dump counttoforeachword;
