declare
  cod2 number(6);
begin

for x in (select cod from DD_DATA_MES where  cod_any_mes > 1000 order by cod_any_mes) loop
  for i in 0..23 loop
    
    cod2 := to_number(to_char(add_months(to_date(to_char(x.sku),'yyyymm'),-i),'yyyymm'));
    

BEGIN
    if to_number(substr(x.sku,1,4)-1 || '01') <=  to_number(cod2)
    then
  INSERT INTO  DATA_MES_24A	(COD_ANY_MES,COD_24A,BAIXA_LOGICA,SISTEMA,ID_CARREGA,DATA_ACT) VALUES
(x.sku,cod2,0,'N',1,SYSDATE);
  end if;
 END;
  end loop;

end loop;

end;
