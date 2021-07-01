unit uspQuery;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.PGDef,
  FireDAC.Phys, FireDAC.Phys.PG;

  type
		TspQuery = class(TFDQuery)

  private
    FspCondicoes: TStringList;
    FspColunas  : TStringList;
    FspTabelas  : TStringList;
    procedure SetspColunas(const Value: TStringList);
    procedure SetspCondicoes(const Value: TStringList);
    procedure SetspTabelas(const Value: TStringList);

  protected

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function GeraSQL : Tstrings;

  published
  	property spColunas    : TStringList read FspColunas write SetspColunas;
  	property spCondicoes  : TStringList read FspCondicoes write SetspCondicoes;
  	property spTabelas    : TStringList read FspTabelas write SetspTabelas;

  end;


implementation

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FspTabelas := TStringList.Create;
  FspColunas := TStringList.Create;
  FspCondicoes := TStringList.Create;
end;

destructor TspQuery.Destroy;
begin
  if Assigned(FspTabelas) then
    FreeAndNil(FspTabelas);

  if Assigned(FspColunas) then
    FreeAndNil(FspColunas);

  if Assigned(FspCondicoes) then
    FreeAndNil(FspCondicoes);

  inherited;
end;

function TspQuery.GeraSQL: TStrings;
begin
  Self.SQL.Clear;

  if (Trim(Self.spColunas.Text) <> EmptyStr) then
  begin
    Self.SQL.Add('select');
    Self.SQL.Add(Trim(Self.spColunas.Text));
  end
  else
    raise Exception.Create('Não existem colunas informadas');

  if (Trim(Self.spTabelas.Text) <> EmptyStr) then
  begin
    if Self.spTabelas.Count > 1 then
      raise exception.Create('Insira apenas uma tabela!')
    else
    begin
      Self.SQL.Add('from');
      Self.SQL.Add(Trim(Self.spTabelas.Text));
    end;

  end
  else
    raise Exception.Create('Informe uma tabela!');

  if (Trim(Self.spCondicoes.Text) <> EmptyStr) then
  begin
    Self.SQL.Add('where');
    Self.SQL.Add(Trim(Self.spCondicoes.Text));
  end;

  Result := Self.SQL;
end;

procedure TspQuery.SetspColunas(const Value: TStringList);
begin
  FspColunas.Assign(value);
end;

procedure TspQuery.SetspCondicoes(const Value: TStringList);
begin
  FspCondicoes.Assign(value);
end;

procedure TspQuery.SetspTabelas(const Value: TStringList);
begin
  FspTabelas.Assign(value);
end;

initialization
     registerclass(TspQuery);
end.

