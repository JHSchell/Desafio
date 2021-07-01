object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  Caption = 'Tarefa 3'
  ClientHeight = 405
  ClientWidth = 498
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblValores: TLabel
    Left = 16
    Top = 8
    Width = 96
    Height = 13
    Caption = 'Valores por Projeto:'
  end
  object lblTotal: TLabel
    Left = 441
    Top = 319
    Width = 40
    Height = 13
    Caption = 'Total R$'
  end
  object lblTotDiv: TLabel
    Left = 400
    Top = 361
    Width = 81
    Height = 13
    Caption = 'Total divis'#245'es R$'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 29
    Width = 473
    Height = 281
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnObterTot: TButton
    Left = 312
    Top = 332
    Width = 75
    Height = 25
    Caption = 'Obter Total'
    TabOrder = 1
    OnClick = btnObterTotClick
  end
  object btnTotDivisoes: TButton
    Left = 264
    Top = 374
    Width = 123
    Height = 25
    Caption = 'Obter Total Divis'#245'es'
    TabOrder = 2
    OnClick = btnTotDivisoesClick
  end
  object edTotal: TEdit
    Left = 392
    Top = 334
    Width = 89
    Height = 21
    TabOrder = 3
  end
  object edTotDivisao: TEdit
    Left = 392
    Top = 376
    Width = 89
    Height = 21
    TabOrder = 4
  end
end
