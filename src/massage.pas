unit massage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  Tmsgbox = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  msgbox: Tmsgbox;

implementation

{$R *.DFM}

procedure Tmsgbox.BitBtn1Click(Sender: TObject);
begin
msgbox.close;
end;

end.
