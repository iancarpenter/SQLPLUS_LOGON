SET TERM OFF
SET VERIFY OFF
-- set the size of the column from ianc_debug_tbl
COLUMN varchar2_col FORMAT a50
SET PAGESIZE 999
SET LINESIZE 132
SET LONG 2000000000
REM SET SQLPROMPT "_USER'@'_CONNECT_IDENTIFIER > "
REM sql prompt from from effective oracle by design
define gname=idle
column global_name new_value gname
select lower(user) || '@' ||
substr(global_name, 1, decode (dot, 0, length(global_name), dot-1)) global_name
from (select global_name, instr(global_name, '.') dot from global_name);
SET sqlprompt '&gname> '
ALTER SESSION SET PLSQL_WARNINGS='ENABLE:ALL';
ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';
SET SERVEROUTPUT ON
SET VERIFY ON
SET TERMOUT ON