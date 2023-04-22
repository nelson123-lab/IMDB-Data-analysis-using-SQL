SPOOL preprocessing.txt
set echo on
set timing on
column column_name format a20
set linesize 200
SELECT
  table_name, owner
FROM
  all_tables
WHERE 
    owner LIKE 'IMDB00'
ORDER BY
  owner, table_name;
set timing off
set echo off
SPOOL off

SELECT * FROM IMDB00.NAME_BASICS fetch first 5 rows only
-- nconst, primaryname, birthyear, deathyear, primaryprofession, knownfortitles, 
SELECT * FROM IMDB00.TITLE_AKAS fetch first 5 rows only
--titleid, ordering, title, region, language, types, attributes, isoriginaltitle
SELECT * FROM IMDB00.TITLE_CREW fetch first 5 rows only
-- tconst, directors, writers
SELECT * FROM IMDB00.TITLE_BASICS fetch first 5 rows only
-- tconst, titletype, primarytitle, originaltitle, isadult, startyear, endyear, runtimeminutes, genres
SELECT * FROM IMDB00.TITLE_EPISODE fetch first 5 rows only
-- tconst, parenttconst, seasonnumber, episodenumber
SELECT * FROM IMDB00.TITLE_PRINCIPALS fetch first 5 rows only
-- tconst, ordering, nconst, category, job, characters
SELECT * FROM IMDB00.TITLE_RATINGS fetch first 5 rows only;
-- tconst, averagerating, numvotes

SPOOL preprocessing1.txt
set echo on
set timing on
column column_name format a20
set linesize 200
-- To find out the movies in which the selected actors are known for.
SELECT DISTINCT
    nconst,
    primaryname,
    knownfortitles,
    birthyear
FROM
    imdb00.name_basics
WHERE
    lower(primaryname) IN ( 'sylvester stallone', 'jim carrey', 'emma stone', 'kate winslet' ) 
    AND birthyear NOT LIKE '\N';
--The actors and actress are famous for these movies
--nm0000120	Jim Carrey	tt0110475,tt0338013,tt0109040,tt0315327
--nm0000230	Sylvester Stallone	tt3076658,tt0075148,tt0089927,tt0084602
--nm0000701	Kate Winslet	tt0114388,tt0959337,tt0338013,tt0120338
--nm1297015	Emma Stone	tt3783958,tt1872181,tt1282140,tt1454029
set timing off
set echo off
SPOOL off