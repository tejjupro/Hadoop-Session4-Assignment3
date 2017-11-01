lines = LOAD'/home/acadgild/Desktop/hdf/word_count.txt' AS (line:chararray);
words = foreach lines GENERATE flatten(TOKENIZE(line, ' '));
group_words  = group  words by $0;
cnt_words = foreach group_words GENERATE group, COUNT(words);
ord_words = order cnt_words by $0;
dump ord_words;

