unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, JclDotNet;

type
  TfrmMain = class(TForm)
    Button1: TButton;
    EditX: TEdit;
    EditY: TEdit;
    EditResult: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function AddFunctionX(aXValue: Integer; aYValue:Integer): Integer;
  public
    { Public declarations }
  end;


var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  EditResult.text := IntToStr(AddFunctionX(StrToInt(EditX.text), StrtoInt(EditY.text)));
end;

function TfrmMain.AddFunctionX(aXValue: Integer; aYValue:Integer): Integer;
var
  Host: TJclClrHost;
  Obj: OleVariant;
begin
  try
    Host := TJclClrHost.Create('v4.0.30319');

    Host.Start();     //

    Obj := Host.DefaultAppDomain
                .CreateInstance('Example1ClassLibrary',
                               'Example1ClassLibrary.Example1')
               .UnWrap();

    Result := Obj.Addfunction(aXValue, aYValue);



    Host.Stop();        //

    Host.Free;
  except
    on E : Exception do
     begin
       ShowMessage('Exception class name = '+E.ClassName + ' ' + 'Exception message = '+E.Message);

     end;
  end;

end;


end.
