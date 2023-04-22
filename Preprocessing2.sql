SPOOL preprocessing1.txt
set echo on
set timing on
column column_name format a20
set linesize 200

SELECT DISTINCT
    nb.primaryname,
    tb.primarytitle,
    tb.startyear,
    tb.genres
FROM
    imdb00.title_basics tb,
    imdb00.name_basics nb,
    imdb00.title_principals tp
WHERE
    nb.nconst = tp.nconst
    AND lower(nb.primaryname)  = 'sylvester stallone' AND lower(tb.tconst) IN ('tt3076658','tt0075148','tt0089927','tt0084602') -- sylvester stallone
--    fetch first 4 rows only;
    OR
    nb.nconst = tp.nconst
    AND lower(nb.primaryname)  = 'jim carrey' AND lower(tb.tconst) IN ('tt0110475','tt0338013','tt0109040','tt0315327') -- jim carrey
--    fetch first 4 rows only;
    OR
    nb.nconst = tp.nconst
    AND lower(nb.primaryname)  = 'kate winslet' AND lower(tb.tconst) IN ('tt0114388','tt0959337','tt0338013','tt0120338') -- kate winslet
--    fetch first 4 rows only;
    OR
    nb.nconst = tp.nconst
    AND lower(nb.primaryname)  = 'emma stone' AND lower(tb.tconst) IN ('tt3783958','tt1872181','tt1282140','tt1454029'); -- emma stone

set timing off
set echo off
SPOOL off
