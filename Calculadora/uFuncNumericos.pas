unit uFuncNumericos;



interface

  function CalcImpA(fValor : Double): Double;
  function CalcImpB(fValor : Double): Double;
  function CalcImpC(fValor : Double): Double;


implementation

function CalcImpA(fValor : Double): Double;
begin
  Result := (fValor * 0.2) - 500;
end;

function CalcImpB(fValor : Double): Double;
begin
  Result := CalcImpA(fValor) - 15;
end;

function CalcImpC(fValor : Double): Double;
begin
  Result := CalcImpA(fValor) + CalcImpB(fValor);
end;

end.
