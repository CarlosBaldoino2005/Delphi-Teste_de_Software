object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 316
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 336
    Top = 24
    Width = 249
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object edtNumeroNota: TLabeledEdit
    Left = 24
    Top = 32
    Width = 225
    Height = 21
    EditLabel.Width = 63
    EditLabel.Height = 13
    EditLabel.Caption = 'Numero Nota'
    TabOrder = 1
  end
  object btnNFe: TButton
    Left = 24
    Top = 59
    Width = 89
    Height = 25
    Caption = 'Enviar NFe'
    TabOrder = 2
    OnClick = btnNFeClick
  end
  object edtChaveEletronica: TLabeledEdit
    Left = 24
    Top = 152
    Width = 561
    Height = 21
    EditLabel.Width = 81
    EditLabel.Height = 13
    EditLabel.Caption = 'Chave Eletr'#244'nica'
    TabOrder = 3
  end
  object edtProtocolo: TLabeledEdit
    Left = 24
    Top = 208
    Width = 561
    Height = 21
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'Protocolo'
    TabOrder = 4
  end
end
