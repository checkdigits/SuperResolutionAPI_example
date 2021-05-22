object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Super Resolution API'
  ClientHeight = 746
  ClientWidth = 1078
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  StyleName = 'Sky'
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    1078
    746)
  PixelsPerInch = 96
  TextHeight = 13
  object imgOri: TImage
    Left = 0
    Top = 0
    Width = 550
    Height = 708
    Align = alLeft
    Center = True
    Proportional = True
    ExplicitHeight = 702
  end
  object splImages: TSplitter
    Left = 550
    Top = 0
    Width = 5
    Height = 708
    Beveled = True
    ExplicitLeft = 521
    ExplicitHeight = 749
  end
  object imgImproved: TImage
    Left = 555
    Top = 0
    Width = 523
    Height = 708
    Align = alClient
    Center = True
    Proportional = True
    ExplicitLeft = 556
    ExplicitWidth = 530
    ExplicitHeight = 702
  end
  object lblWait: TLabel
    Left = 872
    Top = 8
    Width = 198
    Height = 40
    Anchors = [akTop, akRight]
    Caption = 'Please Wait...'
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -33
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
    ExplicitLeft = 879
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 708
    Width = 1078
    Height = 38
    Align = alBottom
    Caption = 'pnlBottom'
    ShowCaption = False
    TabOrder = 0
    ExplicitTop = 699
    ExplicitWidth = 1095
    DesignSize = (
      1078
      38)
    object lblAPI: TLabel
      Left = 550
      Top = 11
      Width = 38
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'API Key'
      ExplicitLeft = 526
    end
    object btnBrowse: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Browse'
      TabOrder = 0
      OnClick = btnBrowseClick
    end
    object btnUpscale: TButton
      Left = 991
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Upscale'
      Enabled = False
      TabOrder = 1
      OnClick = btnUpscaleClick
      ExplicitLeft = 1008
    end
    object edtAPIKey: TEdit
      Left = 594
      Top = 8
      Width = 391
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 570
    end
  end
  object RESTClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://api.deepai.org/api/torch-srgan'
    ContentType = 
      'multipart/form-data; boundary=-------Embt-Boundary--475800A36E30' +
      'D536'
    Params = <>
    Left = 504
    Top = 136
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Method = rmPOST
    Params = <>
    Response = RESTResponse
    Left = 504
    Top = 200
  end
  object RESTResponse: TRESTResponse
    ContentType = 'application/json'
    Left = 504
    Top = 264
  end
  object dlgOpenImage: TOpenDialog
    Filter = 
      'All (*.svg;*.gif;*.jpg;*.jpeg;*.png;*.bmp;*.ico;*.emf;*.wmf;*.ti' +
      'f;*.tiff)|*.svg;*.gif;*.jpg;*.jpeg;*.png;*.bmp;*.ico;*.emf;*.wmf' +
      ';*.tif;*.tiff|Scalable Vector Graphics (FNC) (*.svg)|*.svg|GIF I' +
      'mage (*.gif)|*.gif|JPEG Image File (*.jpg)|*.jpg|JPEG Image File' +
      ' (*.jpeg)|*.jpeg|Portable Network Graphics (*.png)|*.png|Bitmaps' +
      ' (*.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles (*.emf)|*.' +
      'emf|Metafiles (*.wmf)|*.wmf|TIFF Images (*.tif)|*.tif|TIFF Image' +
      's (*.tiff)|*.tiff'
    Left = 648
    Top = 208
  end
  object http: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 808
    Top = 480
  end
end
