object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Example 1 - Basic .NET Class Library'
  ClientHeight = 272
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 107
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 0
    OnClick = Button1Click
  end
  object EditX: TEdit
    Left = 8
    Top = 24
    Width = 129
    Height = 21
    TabOrder = 1
  end
  object EditY: TEdit
    Left = 8
    Top = 59
    Width = 129
    Height = 21
    TabOrder = 2
  end
  object EditResult: TEdit
    Left = 8
    Top = 160
    Width = 129
    Height = 21
    TabOrder = 3
  end
end
