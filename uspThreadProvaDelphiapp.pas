unit uspThreadProvaDelphiapp;

interface

uses
  Classes, ComCtrls, StdCtrls, SysUtils;

type
  TspThreadProvaDelphiapp = class(TThread)
  private
    FProgressBar: TProgressBar;
    FMemo: TMemo;
    FMaxMiliSegundos: integer;
  protected

  public
    property ProgressBar: TProgressBar read FProgressBar write FProgressBar;
    property Memo: TMemo read FMemo write FMemo;
    property MaxMiliSegundos: integer read FMaxMiliSegundos write FMaxMiliSegundos;

    constructor Create(
      AProgressBar: TProgressBar = nil;
      AMemo: TMemo = nil;
      AMaxMiliSegundos: integer = 0;
      AFreeOnTerminate: Boolean = True); reintroduce;

    procedure Execute; override;

    procedure IniciandoProcessamento;
    procedure AtualizarProgressBar;
    procedure ProcessamentoFinalizado;
  end;

implementation

{ TspThreadProvaDelphiapp }

procedure TspThreadProvaDelphiapp.AtualizarProgressBar;
begin
  if (Self.ProgressBar.Parent <> nil) then
    Self.ProgressBar.Position := FProgressBar.Position + 1
  else
    Self.Terminate
end;

constructor TspThreadProvaDelphiapp.Create(AProgressBar: TProgressBar = nil;
  AMemo: TMemo = nil; AMaxMiliSegundos: integer = 0;
  AFreeOnTerminate: Boolean = True);
begin
  inherited Create(True);

  Self.ProgressBar := AProgressBar;
  Self.Memo := AMemo;
  Self.MaxMiliSegundos := AMaxMiliSegundos;
  Self.FreeOnTerminate := AFreeOnTerminate;
end;

procedure TspThreadProvaDelphiapp.Execute;
var
  i: integer;
begin
  Self.Synchronize(Self.IniciandoProcessamento);

  i := 0;
  while not Self.Terminated and (i <= 100) do
  begin
    Randomize;
    Sleep(Random(Self.MaxMiliSegundos));

    Self.Synchronize(Self.AtualizarProgressBar);
    Inc(i);
  end;

  Self.Synchronize(Self.ProcessamentoFinalizado);
end;

procedure TspThreadProvaDelphiapp.IniciandoProcessamento;
begin
  if (Self.Memo.Parent <> nil) then
    Self.Memo.Lines.Add(
      Format('%u - %s', [Self.ThreadID, 'Processamento iniciando']))
  else
    Self.Terminate
end;

procedure TspThreadProvaDelphiapp.ProcessamentoFinalizado;
begin
  if (Self.Memo.Parent <> nil) then
    Self.Memo.Lines.Add(
      Format('%u - %s', [Self.ThreadID, 'Processamento finalizado']))
  else
    Self.Terminate
end;

end.

