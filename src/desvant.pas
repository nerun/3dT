unit desvant;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TaddDV = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    nm_addDV: TEdit;
    cs_addDV: TEdit;
    cm_OK: TBitBtn;
    cm_cancelar: TBitBtn;
    procedure cm_cancelarClick(Sender: TObject);
    procedure Formpaint(Sender: TObject);
    procedure cm_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  addDV: TaddDV;

implementation

uses Main, massage;

{$R *.DFM}

procedure calctotal;
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
procedure TaddDV.cm_cancelarClick(Sender: TObject);
begin
frmMain.enabled:=true;
adddv.close;
end;

procedure TaddDV.Formpaint(Sender: TObject);
begin
nm_adddv.text:=frmMain.ls_dv.items[frmMain.ls_dv.itemindex];
cs_adddv.text:=frmMain.lb_cs_dv.caption;
if cs_adddv.text='Var.'then cs_adddv.text:='';
end;

procedure TaddDV.cm_OKClick(Sender: TObject);
label fim,fimmesmo;
var i,code,costs,cost:integer;
    strcosts:string;
begin
if cs_adddv.text='' then goto fim;
frmMain.ls_dv_adq.items.add (cs_addDV.text+' '+nm_adddv.text);
frmMain.enabled:=true;
cost:=0;
costs:=0;
for i:=0 to frmMain.ls_dv_adq.items.count-1 do
begin
val(frmMain.ls_dv_adq.items[i],cost,code);
costs:=costs+cost;
end;
str(costs,strcosts);
frmMain.lb_dvtotal.caption:=strcosts;
calctotal;
adddv.close;
goto fimmesmo;
fim:
msgbox.show;
fimmesmo:
end;

end.
