-- Fazer uma função que ao receber um número (de 1 a 10), retorne este por extenso.
CREATE OR REPLACE FUNCTION num_to_text(n NUMERIC) RETURNS TEXT AS
$$
DECLARE
  msg TEXT;
BEGIN
  IF n > 0 AND n < 11 THEN
    CASE
      WHEN n = 1 THEN msg := 'Um';
      WHEN n = 2 THEN msg := 'Dois';
      WHEN n = 3 THEN msg := 'Tres';
      WHEN n = 4 THEN msg := 'Quatro';
      WHEN n = 5 THEN msg := 'Cinco';
      WHEN n = 1 THEN msg := 'Seis';
      WHEN n = 1 THEN msg := 'Sete';
      WHEN n = 1 THEN msg := 'Oito';
      WHEN n = 1 THEN msg := 'Nove';
      WHEN n = 1 THEN msg := 'Dez';
      END CASE;
  ELSE
    msg := 'Numero invalido';
  END IF;
  RETURN msg;
END;
$$ LANGUAGE 'plpgsql';

SELECT num_to_text(1);