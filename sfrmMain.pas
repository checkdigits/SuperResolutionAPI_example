unit sfrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ExtDlgs,  Vcl.Imaging.JConsts, Vcl.Imaging.jpeg, json, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmMain = class(TForm)
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    imgOri: TImage;
    splImages: TSplitter;
    imgImproved: TImage;
    pnlBottom: TPanel;
    btnBrowse: TButton;
    btnUpscale: TButton;
    dlgOpenImage: TOpenDialog;
    lblAPI: TLabel;
    edtAPIKey: TEdit;
    http: TIdHTTP;
    lblWait: TLabel;
    procedure FormResize(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnUpscaleClick(Sender: TObject);
  private
    strImgPath: string;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnBrowseClick(Sender: TObject);
var
   Picture: TPicture;
begin
  if not dlgOpenImage.Execute then
    exit;
  strImgPath := dlgOpenImage.FileName;
  btnUpscale.Enabled := strImgPath <> '';

  Picture := TPicture.Create;
  Picture.LoadFromFile(strImgPath);
  imgOri.Picture := Picture;
end;

procedure TfrmMain.btnUpscaleClick(Sender: TObject);
var
  lparam : Trestrequestparameter;
  jsonObj: TJSONObject;
  MS: TMemoryStream;
  Picture: TPicture;
begin
  lblWait.Visible := true;
  Application.ProcessMessages;
  RESTRequest.Params.Clear;
  RESTResponse.RootElement := '';
  lparam := RESTRequest.Params.AddItem;
  lparam.name := 'api-key';
  lparam.Value := edtAPIKey.Text;
  lparam.ContentType := ctNone;
  lparam.Kind := pkHTTPHEADER;
  lparam.Options := [poDoNotEncode];

  lparam := RESTRequest.Params.AddItem;
  lparam.name := 'image';
  lparam.Value := strImgPath;
  lparam.ContentType := ctNone;
  lparam.Kind := pkFile;
  lparam.Options := [poDoNotEncode];

  RESTRequest.Execute;
  if not RESTResponse.Status.Success then
    showmessage(RESTResponse.StatusText + ' ' +
      inttostr(RESTResponse.StatusCode))
  else
  begin
    jsonObj := RESTResponse.JSONValue as TJSONObject;
    MS := TMemoryStream.Create;
    http.Get(StringReplace(jsonObj.Values['output_url'].Value, 'https', 'http',[rfReplaceAll, rfIgnoreCase]), MS);
    MS.Position := 0;
    Picture := TPicture.Create;
    Picture.LoadFromStream(MS);
    imgImproved.Picture := Picture;
    MS.Free;
  end;
  lblWait.Visible := false;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  TPicture.RegisterFileFormat('jpg', sJPEGImageFile, TJPEGImage);
  TPicture.RegisterFileFormat('jpeg', sJPEGImageFile, TJPEGImage);
  TPicture.RegisterFileFormat('png', sJPEGImageFile, TJPEGImage);
  TPicture.RegisterFileFormat('bmp', sJPEGImageFile, TJPEGImage);
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  imgOri.Width := round(self.ClientWidth / 2);
end;

end.
