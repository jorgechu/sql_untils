
declare
  cod2 number(6);
begin

for x in (select cod from DATA_MES where  cod_any_mes > 1000 order by cod_any_mes) loop
  for i in 0..11 loop
    cod2 := to_number(to_char(add_months(to_date(to_char(x.sku),'yyyymm'),-i),'yyyymm'));
  --  dbms_output.put_line(x.sku||' - '||cod2);
  BEGIN
INSERT INTO  DATA_MES_12A	(COD_ANY_MES,COD_12A,BAIXA_LOGICA,SISTEMA,ID_CARREGA,DATA_ACT) VALUES
(x.sku,cod2,0,'N',1,SYSDATE);
	  END;
  end loop;

end loop;

end;
