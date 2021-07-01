object fTarefa2: TfTarefa2
  Left = 496
  Top = 141
  Caption = 'Tarefa 2'
  ClientHeight = 394
  ClientWidth = 514
  Color = clBtnFace
  Constraints.MinHeight = 433
  Constraints.MinWidth = 530
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 160
    Top = 38
    Width = 242
    Height = 13
    Caption = 'Informe a quantidade de Threads a serem criadas '
  end
  object Label2: TLabel
    Left = 48
    Top = 11
    Width = 354
    Height = 13
    Caption = 
      'Tempo m'#225'ximo (milissegundos) de espera para cada itera'#231#227'o das th' +
      'reads '
  end
  object Button1: TButton
    Left = 376
    Top = 64
    Width = 121
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edtNumeroThreads: TEdit
    Left = 408
    Top = 35
    Width = 89
    Height = 21
    Alignment = taRightJustify
    TabOrder = 2
    OnKeyPress = edtNumeroThreadsKeyPress
  end
  object edtTempoEspera: TEdit
    Left = 408
    Top = 8
    Width = 89
    Height = 21
    Alignment = taRightJustify
    TabOrder = 1
    OnKeyPress = edtNumeroThreadsKeyPress
  end
  object pgbIteracao: TProgressBar
    Left = 16
    Top = 95
    Width = 481
    Height = 26
    Smooth = True
    BarColor = 12615680
    Step = 1
    TabOrder = 3
  end
  object memIteracoes: TMemo
    Left = 16
    Top = 127
    Width = 481
    Height = 250
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
end
