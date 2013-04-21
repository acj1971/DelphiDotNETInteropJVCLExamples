program Example2;

uses
  Forms,
  Main in 'Main.pas' {frmMain};

{$R *.res}

begin
  Set8087CW($133F);


  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
