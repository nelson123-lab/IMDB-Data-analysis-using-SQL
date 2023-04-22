SPOOL analysis_1a.txt
set echo on
set timing on
column column_name format a20
set linesize 200

SELECT
    nconst,
    primaryname
FROM
    imdb00.name_basics
WHERE
    lower(primaryname) IN ( 'sylvester stallone', 'jim carrey', 'emma stone', 'kate winslet' )
    AND birthyear NOT LIKE '\N';
--nm0000120	Jim Carrey
--nm0000230	Sylvester Stallone
--nm0000701	Kate Winslet
--nm1297015	Emma Stone

SELECT
    nb.primaryname
    || ','
    || tb.startyear
    || ','
    || COUNT(*)

FROM
    imdb00.name_basics      nb,
    imdb00.title_principals tp,
    imdb00.title_basics     tb
    
WHERE
        nb.nconst = tp.nconst
    AND tp.tconst = tb.tconst
    AND nb.nconst IN ( 'nm0000230', 'nm0000120', 'nm1297015', 'nm0000701' )
    AND lower(tb.titletype) = 'movie'
    AND lower(tp.category) IN ( 'actor', 'actress' )
    AND tb.startyear NOT LIKE '\N'
GROUP BY
    nb.nconst,
    nb.primaryname,
    tb.startyear
ORDER BY
    nb.primaryname,
    tb.startyear;
set timing off
set echo off
SPOOL off