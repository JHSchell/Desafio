unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfTarefa1 = class(TForm)
    lblColunas: TLabel;
    memColunas: TMemo;
    lblTabelas: TLabel;
    memTabelas: TMemo;
    lblCondicoes: TLabel;
    memCondicoes: TMemo;
    btnGeraSQL: TButton;
    lblSQLGerado: TLabel;
    memSQLGerado: TMemo;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGeraSQLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

uses uspQuery;

procedure TfTarefa1.btnGeraSQLClick(Sender: TObject);
var
  tmpQuery: TspQuery;
begin
  tmpQuery := TspQuery.Create(nil);
  try
    try
      tmpQuery.spColunas.Text := memColunas.Text;
      tmpQuery.spTabelas.Text := memTabelas.Text;
      tmpQuery.spCondicoes.Text := memCondicoes.Text;

      memSqlGerado.Lines := tmpQuery.GeraSQL;
    except
      on e: Exception do
      begin
        MessageDlg('Não foi possível gerar SQL:' + #13 + #13 + e.Message, mtWarning, [mbOk], 0)
      end;
    end;
  finally
    if Assigned(tmpQuery) then
      FreeAndNil(tmpQuery)
  end;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  fTarefa1 := nil;
end;

end.
