unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Grids, DBGrids, DB, DBTables, StdCtrls, Menus, Mask,
  Buttons,abrsalv;

type
  TfrmMain = class(TForm)
    Menus: TMainMenu;
    Arquivo: TMenuItem;
    Novo: TMenuItem;
    Abrir: TMenuItem;
    Salvar: TMenuItem;
    SalvarComo: TMenuItem;
    Sair: TMenuItem;
    Ajuda: TMenuItem;
    Contedo: TMenuItem;
    Sobre: TMenuItem;
    Label1: TLabel;
    tx_nome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    tx_forca: TEdit;
    tx_habilidade: TEdit;
    tx_resistencia: TEdit;
    tx_armadura: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    tx_poderdefogo: TEdit;
    ls_Vant: TListBox;
    Label15: TLabel;
    ls_vant_adq: TListBox;
    Label16: TLabel;
    ls_DV: TListBox;
    Label17: TLabel;
    ls_DV_adq: TListBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    lb_cs_vant: TLabel;
    lb_cs_DV: TLabel;
    ls_cs_dv: TListBox;
    ls_cs_vant: TListBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    lb_atrib: TLabel;
    lb_vanttotal: TLabel;
    lb_DVtotal: TLabel;
    lb_magtotal: TLabel;
    Label26: TLabel;
    Imprimir1: TMenuItem;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    figura: TImage;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Mm_observ: TMemo;
    lb_total: TLabel;
    Label11: TLabel;
    opendlg: TOpenDialog;
    savedlg: TSaveDialog;
    openpicdlg: TOpenDialog;
    Bevel1: TBevel;
    nada: TImage;
    BitBtn5: TBitBtn;
    modelo: TImage;
    PRNDLG: TPrintDialog;
    icone: TImage;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    tx_fogo: TEdit;
    tx_terra: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    tx_agua: TEdit;
    tx_ar: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    tx_luz: TEdit;
    Label28: TLabel;
    tx_trevas: TEdit;
    procedure tx_atribChange(Sender: TObject);
    procedure tx_focusChange(Sender: TObject);
    procedure ls_vantclick(Sender: TObject);
    procedure ls_DVClick(Sender: TObject);
    procedure ls_vantdblclick(Sender: TObject);
    procedure ls_DVdblclick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SalvarClick(Sender: TObject);
    procedure SalvarComoClick(Sender: TObject);
    procedure NovoClick(Sender: TObject);
    procedure AbrirClick(Sender: TObject);
    procedure ls_vant_adqDblClick(Sender: TObject);
    procedure ls_DV_adqDblClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure bitbtn5click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure ContedoClick(Sender: TObject);
    procedure SobreClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure tx_nomeChange(Sender: TObject);
    procedure calctotal;
    procedure supercalctotal;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
      { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses vant, desvant, massage2, Help, about, dialog2, dialog1;

{$R *.DFM}

procedure Tfrmmain.calctotal;
var custos:array[1..4] of integer;
    totalval,code:integer;
    totalstr:string;
begin
val (frmMain.lb_atrib.caption,custos[1],code);
val (frmMain.lb_vanttotal.caption,custos[2],code);
val (frmMain.lb_dvtotal.caption,custos[3],code);
val (frmMain.lb_magtotal.caption,custos[4],code);
totalval:=custos[1]+custos[2]-custos[3]+custos[4];
str(totalval,totalstr);
frmMain.lb_total.caption:=totalstr;
end;
procedure TfrmMain.tx_atribChange(Sender: TObject);
var code:integer;
    custos:array[1..5] of integer;
    chrcusto:string;
begin
abrsalv.mudou:=true;
val(tx_forca.text,custos[1],code);
val(tx_habilidade.text,custos[2],code);
val(tx_resistencia.text,custos[3],code);
val(tx_armadura.text,custos[4],code);
val(tx_poderdefogo.text,custos[5],code);
custos[1]:=custos[1]+custos[2]+custos[3]+custos[4]+custos[5];
str(custos[1],chrcusto);
lb_atrib.caption:=chrcusto;
calctotal;
end;

procedure TfrmMain.tx_focusChange(Sender: TObject);
var code:integer;
    custos:array[1..6] of integer;
    chrcusto:string;
begin
abrsalv.mudou:=true;
val(tx_fogo.text,custos[1],code);
val(tx_terra.text,custos[2],code);
val(tx_agua.text,custos[3],code);
val(tx_ar.text,custos[4],code);
val(tx_luz.text,custos[5],code);
val(tx_trevas.text,custos[6],code);
custos[1]:=custos[1]+custos[2]+custos[3]+custos[4]+custos[5]+custos[6];
str(custos[1],chrcusto);
lb_magtotal.caption:=chrcusto;
calctotal;
end;


procedure TfrmMain.ls_vantclick(Sender: TObject);
begin
lb_cs_vant.caption:=ls_cs_vant.items[ls_Vant.itemindex];
if lb_cs_vant.caption='-1' then lb_cs_vant.caption:='Var.';
end;

procedure TfrmMain.ls_DVClick(Sender: TObject);
begin
lb_cs_DV.caption:=ls_cs_DV.items[ls_DV.itemindex];
if lb_cs_DV.caption='--1' then lb_cs_DV.caption:='Var.';

end;

procedure TfrmMain.ls_vantdblclick(Sender: TObject);
label final;
begin
if ls_vant_adq.items.count>9 then
begin
msgbox2.show;
goto final
end;
abrsalv.mudou:=true;
addvant.show;
final:
frmMain.enabled:=false;
end;

procedure TfrmMain.ls_DVdblclick(Sender: TObject);
label final;
begin
if ls_dv_adq.items.count>9 then
begin
msgbox2.show;
goto final;
end;
abrsalv.mudou:=true;
addDV.show;
final:
frmMain.enabled:=false;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var F1,F2:textfile;
    babo:string;
    xs:boolean;
begin
abrsalv.mudou:=false;
xs:=setcurrentdir(extractfiledir(paramstr(0)));
assignfile(F1,'vantagem.lib');
assignfile(F2,'desvant.lib');
reset(F1);
reset(F2);
while not eof(F1) do
begin
readln(F1,babo);
ls_vant.items.add (babo);
readln(F1,babo);
ls_cs_vant.items.add (babo);
end;
while not eof(F2) do
begin
readln(F2,babo);
ls_dv.items.add (babo);
readln(F2,babo);
ls_cs_dv.items.add (babo);
end;
figurapontopicture:='modelo.bmp';
if not(paramstr(1)='') then abrirfile(paramstr(1));
end;

procedure TfrmMain.SalvarClick(Sender: TObject);
var xis:boolean;
begin
if not(pers.nomearq='')then
savefile(pers.nomearq)
else
begin
savedlg.filename:=frmMain.tx_nome.text;
xis:=savedlg.execute;
if xis then
begin
savefile(savedlg.filename);
abrsalv.mudou:=false;
end;
end;
end;

procedure TfrmMain.SalvarComoClick(Sender: TObject);
var xis:boolean;
begin
if not (pers.nomearq='') then
begin
savedlg.filename:=pers.nomearq;
xis:=savedlg.execute;
if xis then
begin
abrsalv.mudou:=false;
savefile(savedlg.filename);
end;
end
else
begin
savedlg.filename:=frmMain.tx_nome.text;
xis:=savedlg.execute;
if xis then
begin
abrsalv.mudou:=false;
savefile(savedlg.filename);
end;
end;
end;

procedure TfrmMain.NovoClick(Sender: TObject);
begin
if abrsalv.mudou then
frmdialognovo.showmodal
else
begin
abrirfile('ddt.lib');
pers.nomearq:='';
abrsalv.mudou:=false;
end;
end;

procedure TfrmMain.AbrirClick(Sender: TObject);
var xeaz:boolean;
begin
xeaz:=opendlg.execute;
if xeaz then
begin
abrirfile(opendlg.filename);
abrsalv.mudou:=false;
end;
end;

procedure TfrmMain.ls_vant_adqDblClick(Sender: TObject);
var costs,cost,code,i:integer;
    cat:string;
begin
costs:=0;
abrsalv.mudou:=true;
ls_vant_adq.items.delete(ls_vant_adq.itemindex);
for i:=0 to ls_vant_adq.items.count-1 do
begin
val(ls_vant_adq.items[i],cost,code);
costs:=costs+cost;
end;
str(costs,cat);
lb_vanttotal.caption:=cat;
calctotal;end;

procedure TfrmMain.ls_DV_adqDblClick(Sender: TObject);
var costs,cost,code,i:integer;
    cat:string;
begin
costs:=0;
abrsalv.mudou:=true;
ls_dv_adq.items.delete(ls_dv_adq.itemindex);
for i:=0 to ls_dv_adq.items.count-1 do
begin
val(ls_dv_adq.items[i],cost,code);
costs:=costs+cost;
end;
str(costs,cat);
lb_dvtotal.caption:=cat;
calctotal;
end;

procedure TfrmMain.BitBtn4Click(Sender: TObject);
begin
abrsalv.mudou:=true;
figura.picture:=nada.picture;
end;

procedure TfrmMain.BitBtn3Click(Sender: TObject);
var xis:boolean;
begin
xis:=openpicdlg.execute;
if xis then
begin
abrsalv.mudou:=true;
figura.picture.loadfromfile(openpicdlg.filename);
figurapontopicture:=openpicdlg.filename;
end;
end;

procedure TfrmMain.bitbtn5click(Sender: TObject);
begin
figura.picture:=modelo.picture;
abrsalv.mudou:=true;
end;

procedure TfrmMain.Imprimir1Click(Sender: TObject);
var xeaz:boolean;
begin
xeaz:=prndlg.execute;
if xeaz then printfile;
end;

procedure TfrmMain.ContedoClick(Sender: TObject);
begin
frmHelp.show;
end;

procedure TfrmMain.SobreClick(Sender: TObject);
begin
aboutbox.showmodal
end;

procedure TfrmMain.SairClick(Sender: TObject);
begin
if abrsalv.mudou then frmdialogsair.showmodal else application.terminate;
end;

procedure TfrmMain.tx_nomeChange(Sender: TObject);
begin
abrsalv.mudou:=true;
end;

procedure TfrmMain.supercalctotal;
var costs,cost,code,i:integer;
var strcosts,cat:string;
begin
costs:=0;
for i:=0 to frmMain.ls_vant_adq.items.count-1 do
begin
val(frmMain.ls_vant_adq.items[i],cost,code);
costs:=costs+cost;
end;
str(costs,strcosts);
frmMain.lb_vanttotal.caption:=strcosts;
costs:=0;
for i:=0 to frmMain.ls_dv_adq.items.count-1 do
begin
val(frmMain.ls_dv_adq.items[i],cost,code);
costs:=costs+cost;
end;
str(costs,strcosts);
frmMain.lb_dvtotal.caption:=strcosts;
calctotal
end;
procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=canone;
if abrsalv.mudou then frmdialogsair.showmodal else application.terminate;
end;

end.
