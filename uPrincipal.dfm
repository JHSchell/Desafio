object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Menu principal'
  ClientHeight = 491
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 232
    object Tarefas: TMenuItem
      Caption = 'Tarefas'
      object arefa11: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = Tarefa1Click
      end
      object Tarefa2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = Tarefa2Click
      end
      object arefa31: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = Tarefa3Click
      end
    end
  end
  object ActionList1: TActionList
    Left = 232
    Top = 48
    object acTarefa1: TAction
      Caption = 'Tarefa 1'
      OnExecute = Tarefa1Click
    end
    object acTarefa2: TAction
      Caption = 'Tarefa 2'
      OnExecute = Tarefa2Click
    end
    object acTarefa3: TAction
      Caption = 'Tarefa 3'
      OnExecute = Tarefa3Click
    end
  end
end
