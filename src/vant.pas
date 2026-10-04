unit vant;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  Taddvant = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    nm_addvant: TEdit;
    cs_addvant: TEdit;
    cm_OK: TBitBtn;
    cm_cancelar: TBitBtn;
    procedure cm_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cm_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  addvant: Taddvant;

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
procedure Taddvant.cm_cancelarClick(Sender: TObject);
begin
frmMain.enabled:=true;
addvant.close;
end;

procedure Taddvant.FormShow(Sender: TObject);
begin
nm_addvant.text:=frmMain.ls_vant.items[frmMain.ls_vant.itemindex];
cs_addvant.text:=frmMain.lb_cs_vant.caption;
if cs_addvant.text='Var.' then cs_addvant.text:='';
end;

procedure Taddvant.cm_OKClick(Sender: TObject);
label fim,fimmesmo;
var i,code,costs,cost:integer;
    strcosts:string;
begin
if cs_addvant.text='' then goto fim;
cost:=0;
costs:=0;
frmMain.ls_vant_adq.items.add (cs_addvant.text+' '+nm_addvant.text);
frmMain.enabled:=true;
for i:=0 to frmMain.ls_vant_adq.items.count-1 do
begin
val(frmMain.ls_vant_adq.items[i],cost,code);
costs:=costs+cost;
end;
str(costs,strcosts);
frmMain.lb_vanttotal.caption:=strcosts;
calctotal;
addvant.close;
goto fimmesmo;
fim:
msgbox.show;
fimmesmo:
end;

end.
