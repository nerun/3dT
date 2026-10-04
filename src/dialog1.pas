unit dialog1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,abrsalv;

type
  TfrmDialogNovo = class(TForm)
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
  frmDialogNovo: TfrmDialogNovo;

implementation

uses Main;

{$R *.DFM}

procedure TfrmDialogNovo.BitBtn1Click(Sender: TObject);
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
else goto final
end;
abrirfile('ddt.lib');
pers.nomearq:='';
abrsalv.mudou:=false;
final:
frmdialognovo.close;
end;
end;

procedure TfrmDialogNovo.BitBtn2Click(Sender: TObject);
begin
frmdialognovo.close;
abrirfile('ddt.lib');
pers.nomearq:='';
abrsalv.mudou:=false;

end;

procedure TfrmDialogNovo.BitBtn3Click(Sender: TObject);
begin
frmdialognovo.close;
end;


end.
