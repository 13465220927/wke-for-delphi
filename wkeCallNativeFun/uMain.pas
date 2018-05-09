/// <summary>
/// Html����Delphi���ط��� demo
/// by �о� (QQ:71051699)
/// </summary>

unit uMain;

interface

uses
  WkeBrowser, Wke,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

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
function _Test1(p1, p2, es_: wkeJSState): wkeJSValue; //���Դ�Html������
function test: String;
function test1(msg: String): String;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

function _Test(p1, p2, es_: wkeJSState): wkeJSValue;
begin
  Result := es_.String_(test);
end;

function _Test1(p1, p2, es_: wkeJSState): wkeJSValue;
var
  _msg: String;
begin
  _msg := (es_.ArgToString(es_, 0));  // ��ȡ��Html����Ĳ���
  Result := es_.String_(test1(_msg));
end;

function test: String;
var
  AMsg: string;
begin
  AMsg := '����Delphi�ַ���!!!';
  // ShowMessage(AMsg);
  Result := AMsg;
end;

function test1(msg: String): String;
var
  AMsg: string;
begin
  AMsg := msg + ', ����Delphi�ַ���!!!';
  Result := AMsg;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FWkeWebbrowser := TWkeWebbrowser.Create(Self);
  FWkeWebbrowser.Parent := Self;
  FWkeWebbrowser.Align := alClient;

  // ע�᱾�غ���
  JScript.BindFunction('delphi_Test', @_Test, 1);
  JScript.BindFunction('delphi_Test1', @_Test1, 1);
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
