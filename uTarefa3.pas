unit uTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, MidasLib,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uspQuery;

type
  TfTarefa3 = class(TForm)
    lblValores: TLabel;
    DBGrid1: TDBGrid;
    btnObterTot: TButton;
    btnTotDivisoes: TButton;
    edTotal: TEdit;
    edTotDivisao: TEdit;
    lblTotal: TLabel;
    lblTotDiv: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnObterTotClick(Sender: TObject);
    procedure btnTotDivisoesClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    FClientDataSet: TClientDataSet;
    FDataSource: TDataSource;
    procedure criarCamposcds;
    procedure PreencheGrid;
    procedure ObterTotal;
    procedure CalcTotDivisao;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure tfTarefa3.btnObterTotClick(Sender: TObject);
begin
  ObterTotal;
end;

procedure tfTarefa3.btnTotDivisoesClick(Sender: TObject);
begin
  CalcTotDivisao;
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  fTarefa3 := nil;
end;

procedure tfTarefa3.FormDestroy(Sender: TObject);
begin
  if Assigned(FClientDataSet) then
    FreeAndNil(FClientDataSet);

  if Assigned(FDataSource) then
    FreeAndNil(FDataSource);

  inherited;
end;

procedure tfTarefa3.criarCamposcds;
begin
  FClientDataSet.Close;
  FClientDataSet.FieldDefs.Clear;
  FClientDataSet.FieldDefs.Add('IdProjeto', ftInteger);
  FClientDataSet.FieldDefs.Add('NomeProjeto', ftString, 20);
  FClientDataSet.FieldDefs.Add('Valor', ftFloat);
  FClientDataSet.CreateDataSet;
end;

procedure tfTarefa3.PreencheGrid;
var
  I            : Integer;
  vNomeProjeto : string;
  vValor       : Real;
begin
	I            := 1;
  vNomeProjeto := 'Projeto ';
  vValor       := 10;

  while I < 11 do
  begin
	  FClientDataSet.Append;
  	FClientDataSet.FieldByName('idProjeto').AsInteger  := I;
  	FClientDataSet.FieldByName('NomeProjeto').AsString := vNomeProjeto + IntToStr(I);
    FClientDataSet.FieldByName('Valor').AsFloat        := vValor;
    FClientDataSet.Post;

    I      := I + 1;
    vValor := vValor + 10;
  end;
end;

procedure tfTarefa3.ObterTotal;
var
  vTotal : Real;
begin
  vTotal       := 0;
  FClientDataSet.Edit;
  FClientDataSet.DisableControls;
  FClientDataSet.First;
  while not FClientDataSet.Eof do
  begin
    vTotal := vTotal + FClientDataSet.FieldByName('Valor').AsFloat;
		FClientDataSet.Next;
  end;
  edtotal.Text :=  FormatFloat('0.00', vTotal); //FloatToStr( FormatFloat('0.00', vTotal) );
end;

procedure tfTarefa3.CalcTotDivisao;
var
	vValor, vValorAnt : Real;
begin
	vValor    := 0;
  vValorAnt := 0;
	FClientDataSet.Edit;
	FClientDataSet.First;
  while  not FClientDataSet.Eof do
  begin
  	if FClientDataSet.FieldByName('idProjeto').AsInteger > 1 then
      vValor := vValor + (FClientDataSet.FieldByName('Valor').AsFloat / vValorAnt);

    vValorAnt :=  FClientDataSet.FieldByName('Valor').AsFloat;  // Valor atual do registro
    FClientDataSet.Next;
  end;
  edTotDivisao.Text := FormatFloat('0.00', vValor);// FloatToStr( FormatFloat('0.00', vValor) );
end;

procedure tfTarefa3.FormShow(Sender: TObject);
begin
  inherited;

  FClientDataSet := TClientDataSet.Create(nil);
  criarCamposcds;
  PreencheGrid;

  FDataSource := TDataSource.Create(nil);
  FDataSource.DataSet := FClientDataSet;

  DBGrid1.DataSource := FDataSource;
end;

end.

