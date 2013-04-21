unit Main;

interface

uses
  mscorlib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, JclDotNet;

type
  TfrmMain = class(TForm)
    Button1: TButton;
    EditX: TEdit;
    EditY: TEdit;
    EditResult: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FClrHost: TJclClrHost;
    function AddFunction(aXValue: Integer; aYValue:Integer): Integer;
  public
    { Public declarations }
  end;


var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  EditResult.text := IntToStr(AddFunction(StrToInt(EditX.text), StrtoInt(EditY.text)));
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FClrHost := TJclClrHost.Create('v4.0.30319');
  FClrHost.Start;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FClrHost.Stop();
  FClrHost.Free;
end;

function TfrmMain.AddFunction(aXValue: Integer; aYValue:Integer): Integer;
var
  Fads: TJclClrAppDomainSetup;
  Fad: TJclClrAppDomain;
  Ov: OleVariant;
  obj: _ObjectHandle;
begin
  try
    Fads := FClrhost.CreateDomainSetup;

    Fads.ApplicationBase := '..\Example2\Debug\Win32\';

    Fad := FClrHost.CreateAppDomain('myNET', Fads);

    obj := (Fad as _AppDomain).CreateInstanceFrom('Example2ClassLibrary.dll',
                                   'Example2ClassLibrary.Example2');
    ov := obj.Unwrap;

    result := ov.AddFunction(aXValue, aYValue);

  except
    on E : Exception do
     begin
       ShowMessage('Exception class name = '+E.ClassName + ' ' + 'Exception message = '+E.Message);

     end;
  end;
end;

end.
