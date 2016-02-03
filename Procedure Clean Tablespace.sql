CREATE OR REPLACE PROCEDURE NETEJAR_TABLESPACE
(
  ESQUEMA IN VARCHAR2, 
  NOM_TABLESPACE IN VARCHAR2
) PARALLEL_ENABLE IS

	CURSOR LLISTAT_TAULES IS SELECT TABLE_NAME FROM ALL_TABLES WHERE OWNER = ESQUEMA AND TABLESPACE_NAME = NOM_TABLESPACE;
	NOM_TAULA ALL_TABLES.TABLE_NAME%TYPE;
	
BEGIN
	
	DBMS_OUTPUT.PUT_LINE('INICIO TRUNCATE TABLES');
	OPEN LLISTAT_TAULES;
	LOOP FETCH LLISTAT_TAULES INTO NOM_TAULA;
		EXIT WHEN LLISTAT_TAULES%NOTFOUND;
		
		--EXECUTE IMMEDIATE 'TRUNCATE TABLE ' || NOM_TAULA;
		DBMS_OUTPUT.PUT_LINE('TABLA TRUNCADA: ' || NOM_TAULA);
			
	END LOOP;
	CLOSE LLISTAT_TAULES;
	DBMS_OUTPUT.PUT_LINE('FIN TRUNCATE TABLES');

	DBMS_OUTPUT.PUT_LINE('INICIO LIMPIEZA TABLESPACE');
	OPEN LLISTAT_TAULES;
	LOOP FETCH LLISTAT_TAULES INTO NOM_TAULA;
		EXIT WHEN LLISTAT_TAULES%NOTFOUND;
		
		--EXECUTE IMMEDIATE 'ALTER TABLE ' || NOM_TAULA || ' ENABLE ROW MOVEMENT';
		DBMS_OUTPUT.PUT_LINE('ENABLE ROW MOVEMENT: ' || NOM_TAULA);
		
		--EXECUTE IMMEDIATE 'ALTER TABLE ' || NOM_TAULA || ' SHRINK SPACE';
		DBMS_OUTPUT.PUT_LINE('SHRINK SPACE: ' || NOM_TAULA);
		
		--EXECUTE IMMEDIATE 'ALTER TABLE ' || NOM_TAULA || ' DISABLE ROW MOVEMENT';
		DBMS_OUTPUT.PUT_LINE('DISABLE ROW MOVEMENT: ' || NOM_TAULA);
	
	END LOOP; 
	CLOSE LLISTAT_TAULES;
	DBMS_OUTPUT.PUT_LINE('FIN LIMPIEZA TABLESPACE');
	
END NETEJAR_TABLESPACE;
