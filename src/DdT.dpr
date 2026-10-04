program DdT;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  vant in 'vant.pas' {addvant},
  desvant in 'desvant.pas' {addDV},
  massage in 'massage.pas' {msgbox},
  abrsalv in 'abrsalv.pas',
  massage2 in 'massage2.pas' {msgbox2},
  Help in 'Help.pas' {frmHelp},
  about in 'about.pas' {AboutBox},
  dialog1 in 'dialog1.pas' {frmDialogNovo},
  dialog2 in 'dialog2.pas' {frmDialogSair};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '3D&T For Windows 95';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Taddvant, addvant);
  Application.CreateForm(TaddDV, addDV);
  Application.CreateForm(Tmsgbox, msgbox);
  Application.CreateForm(Tmsgbox2, msgbox2);
  Application.CreateForm(TfrmHelp, frmHelp);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TfrmDialogNovo, frmDialogNovo);
  Application.CreateForm(TfrmDialogSair, frmDialogSair);
  Application.Run;
end.
