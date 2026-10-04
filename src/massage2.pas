unit massage2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  Tmsgbox2 = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  msgbox2: Tmsgbox2;

implementation

uses Main;

{$R *.DFM}

procedure Tmsgbox2.BitBtn1Click(Sender: TObject);
begin
frmMain.enabled:=true;
msgbox2.close;
end;

end.
