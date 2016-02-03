SET serveroutput ON SIZE 30000;
SET SERVEROUTPUT ON;

DECLARE

TABLA VARCHAR2(30);
USUARIO VARCHAR2(30) := 'BI_JUS_SRC_EPJ';
TOTAL NUMBER(30);

CURSOR LISTADO_TABLAS IS SELECT TABLE_NAME FROM ALL_TABLES WHERE TABLE_NAME LIKE '%EPJ%';

BEGIN
OPEN LISTADO_TABLAS;
LOOP
FETCH LISTADO_TABLAS INTO TABLA;
EXIT WHEN LISTADO_TABLAS%NOTFOUND;

	DBMS_OUTPUT.PUT_LINE('borrando tabla - '|| TABLA);
	EXECUTE IMMEDIATE 'DROP TABLE ' || USUARIO || '.' || TAULA || ' PURGE';
	DBMS_OUTPUT.PUT_LINE('Tabla borrada - '|| TABLA);
  
END LOOP;
CLOSE LISTADO_TABLAS;

END;
/