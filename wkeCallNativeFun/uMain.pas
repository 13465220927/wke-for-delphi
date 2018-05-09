/// <summary>
/// Html����Delphi���ط��� demo
/// by �о� (QQ:71051699)
/// </summary>

unit uMain;

interface

uses
  WkeBrowser, Wke,
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs;

type
  TfrmMain = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FWkeWebbrowser: TWkeWebbrowser;
  public
    { Public declarations }
  end;

function _Test(p1, p2, es_: wkeJSState): wkeJSValue;
function test: String;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

function _Test(p1, p2, es_: wkeJSState): wkeJSValue;
begin
  Result := es_.String_(test);
end;

function test: String;
var
  AMsg: string;
begin
  AMsg := '����Delphi�ַ���!!!';
  // ShowMessage(AMsg);
  Result := AMsg;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FWkeWebbrowser := TWkeWebbrowser.Create(Self);
  FWkeWebbrowser.Parent := Self;
  FWkeWebbrowser.Align := alClient;

  // ע�᱾�غ���
  JScript.BindFunction('delphi_Test', @_Test, 1);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FWkeWebbrowser.Free;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  FWkeWebbrowser.Show;
  FWkeWebbrowser.LoadFile('index.html');
  FWkeWebbrowser.WebView.ShowWindow(True); // ע��: ���û��ʹ�ù�LoadURL����,���뱣ִ֤��һ��wke��ShowWindow����!!!
end;

end.
