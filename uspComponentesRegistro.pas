unit uspComponentesRegistro;

interface

uses
  SysUtils, Classes, uspQuery;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('spComponentes', [TspQuery]);
end;

end.