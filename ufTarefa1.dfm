object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  Caption = 'fTarefa1'
  ClientHeight = 388
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblColunas: TLabel
    Left = 16
    Top = 32
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object lblTabelas: TLabel
    Left = 208
    Top = 32
    Width = 37
    Height = 13
    Caption = 'Tabelas'
  end
  object lblCondicoes: TLabel
    Left = 400
    Top = 32
    Width = 49
    Height = 13
    Caption = 'Condi'#231#245'es'
  end
  object lblSQLGerado: TLabel
    Left = 16
    Top = 224
    Width = 57
    Height = 13
    Caption = 'SQL Gerado'
  end
  object memColunas: TMemo
    Left = 16
    Top = 56
    Width = 169
    Height = 137
    TabOrder = 0
  end
  object memTabelas: TMemo
    Left = 208
    Top = 56
    Width = 169
    Height = 137
    TabOrder = 1
  end
  object memCondicoes: TMemo
    Left = 400
    Top = 56
    Width = 169
    Height = 137
    TabOrder = 2
  end
  object btnGeraSQL: TButton
    Left = 592
    Top = 168
    Width = 75
    Height = 25
    Caption = 'GeraSQL'
    TabOrder = 3
    OnClick = btnGeraSQLClick
  end
  object memSQLGerado: TMemo
    Left = 16
    Top = 243
    Width = 651
    Height = 129
    TabOrder = 4
  end
end
