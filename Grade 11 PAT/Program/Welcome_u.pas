unit Welcome_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ComCtrls;

type
  TfrmWelcome = class(TForm)
    imgBg: TImage;
    btnSignUp: TButton;
    redWelcome: TRichEdit;
    btnRules: TButton;
    btnAdminMenu: TButton;
    btnRecord: TButton;
    edtPassword: TEdit;
    btnChange: TButton;
    procedure btnRulesClick(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure btnAdminMenuClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnRecordClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWelcome: TfrmWelcome;

implementation
Uses
 Signup_u, Recording_u, Change_u;
{$R *.dfm}

procedure TfrmWelcome.btnAdminMenuClick(Sender: TObject);
VAR
Password,CorrectPassword:String;
tPassword:Textfile;
begin
Password:=edtPassword.Text;
AssignFile(tPassword,'Password.txt');
if FileExists('Password.txt')=True then
 begin
  Reset(tPassword);
 end
 else begin
   Showmessage('Error finding Password.txt');
   Exit;
 end;
Readln(tPassword,CorrectPassword);
if Password=CorrectPassword then
 begin
  redWelcome.Height:=250;
  btnChange.Enabled:=True;
  btnRecord.Enabled:=True;
 end
 else begin
   Showmessage('Incorrect password.');
   Exit;
 end;
edtPassword.Clear;
end;

procedure TfrmWelcome.btnChangeClick(Sender: TObject);
begin
frmWelcome.Hide;
frmDetails.Show;

end;

procedure TfrmWelcome.btnRecordClick(Sender: TObject);
begin
frmWelcome.Hide;
frmRecord.Show;
end;

procedure TfrmWelcome.btnRulesClick(Sender: TObject);
begin
redWelcome.Height:=315;
redWelcome.Clear;
if FileExists('Rules.txt')=False then
 begin
   Showmessage('Rules.txt not found');
   Exit;
 end;
redWelcome.Lines.LoadFromFile('Rules.txt');


end;

procedure TfrmWelcome.btnSignUpClick(Sender: TObject);
begin
 frmWelcome.Hide;
 frmSignup.Show;
end;

procedure TfrmWelcome.FormActivate(Sender: TObject);
begin
redWelcome.Height:=315;
btnChange.Enabled:=False;
btnRecord.Enabled:=False;
end;

end.
