unit dialog2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,abrsalv;

type
  TfrmDialogSair = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogSair: TfrmDialogSair;

implementation

uses main;

{$R *.DFM}
procedure TfrmDialogSair.BitBtn1Click(Sender: TObject);
var xis : boolean;
label final;
begin
begin
if not(pers.nomearq='')then
savefile(pers.nomearq)
else
begin
frmmain.savedlg.filename:=frmMain.tx_nome.text;
xis:=frmmain.savedlg.execute;
if xis then
begin
savefile(frmmain.savedlg.filename);
abrsalv.mudou:=false;
end
else goto final;
end;
application.terminate;
final:
frmdialogsair.close;
end;
end;

procedure TfrmDialogSair.BitBtn2Click(Sender: TObject);
begin
frmdialogsair.close;
application.terminate;
end;

procedure TfrmDialogSair.BitBtn3Click(Sender: TObject);
begin
frmdialogsair.close;
end;

end.
