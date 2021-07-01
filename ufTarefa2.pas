unit ufTarefa2;

interface

uses
//  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
//  Dialogs, StdCtrls, ComCtrls, System.UITypes, MidasLib;
//  //ufTemplateMDIChildBase,
{
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, MidasLib, vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;     }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Win.TaskbarCore,
  Vcl.Taskbar, Vcl.ComCtrls;

type
  TfTarefa2 = class(TForm)
    Button1: TButton;
    edtNumeroThreads: TEdit;
    edtTempoEspera: TEdit;
    pgbIteracao: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    memIteracoes: TMemo;
    procedure edtNumeroThreadsKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

uses uspThreadProvaDelphiapp;

{$R *.dfm}

procedure TfTarefa2.edtNumeroThreadsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet(key, ['0'..'9', #8]) then
    key := #0;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  fTarefa2 := nil;
end;

procedure TfTarefa2.Button1Click(Sender: TObject);
var
  i: integer;
  tmpThread: TspThreadProvaDelphiapp;
begin
  if (StrToIntDef(edtNumeroThreads.Text, 0) = 0) then
  begin
    MessageDlg('Informe um número válido de Threads.', mtInformation, [mbOk], 0);
    edtNumeroThreads.SetFocus;
  end
  else
  begin
    memIteracoes.Lines.Clear;

    pgbIteracao.Position := 0;
    pgbIteracao.Max := (StrToIntDef(edtNumeroThreads.Text, 0) * 101);

    for i := 1 to StrToIntDef(edtNumeroThreads.Text, 0) do
    begin
      tmpThread := TspThreadProvaDelphiapp.Create(
                     pgbIteracao,
                     memIteracoes,
                     StrToIntDef(edtTempoEspera.Text, 0),
                     True);
      tmpThread.Start;
    end;
  end;
end;

end.
