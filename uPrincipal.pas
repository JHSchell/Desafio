unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList;

type
  TfPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Tarefas: TMenuItem;
    arefa11: TMenuItem;
    Tarefa2: TMenuItem;
    arefa31: TMenuItem;
    ActionList1: TActionList;
    acTarefa1: TAction;
    acTarefa2: TAction;
    acTarefa3: TAction;
    procedure Tarefa1Click(Sender: TObject);
    procedure Tarefa3Click(Sender: TObject);
    procedure Tarefa2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

uses ufTarefa1, uTarefa3, ufTarefa2;

procedure TfPrincipal.Tarefa3Click(Sender: TObject);
begin
  if (fTarefa3 = nil) then
    Application.CreateForm(TfTarefa3, fTarefa3);
end;

procedure TfPrincipal.Tarefa2Click(Sender: TObject);
begin
  if (fTarefa2 = nil) then
    Application.CreateForm(TfTarefa2, fTarefa2);
end;

procedure TfPrincipal.Tarefa1Click(Sender: TObject);
begin
  if (fTarefa1 = nil) then
    Application.CreateForm(TfTarefa1, fTarefa1);
end;

end.
