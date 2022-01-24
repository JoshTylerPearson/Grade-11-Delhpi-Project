unit Signup_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, StdCtrls, jpeg, ExtCtrls, dmTournamentData_u;

type
  TfrmSignup = class(TForm)
    imgBg: TImage;
    edtName: TEdit;
    edtSurname: TEdit;
    edtPhone: TEdit;
    Button1: TButton;
    btnAdmin: TButton;
    lblName: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    sedAge: TSpinEdit;
    edtPassword: TEdit;
    btnRecording: TButton;
    btnDetails: TButton;
    procedure Button2Click(Sender: TObject);
    procedure btnAdminClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDetailsClick(Sender: TObject);
    procedure btnRecordingClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignup: TfrmSignup;

implementation
Uses
 Welcome_u, Change_u, Recording_u;
{$R *.dfm}

procedure TfrmSignup.btnAdminClick(Sender: TObject);
VAR
CorrectPassword,Password:String;
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
   btnDetails.Visible:=True;
   btnDetails.Enabled:=True;
   btnRecording.Visible:=True;
   btnRecording.Enabled:=True;
 end
 else begin
   Showmessage('Incorrect password.');
   Exit;
 end;
edtPassword.Clear;
end;

procedure TfrmSignup.btnDetailsClick(Sender: TObject);
begin
frmSignup.Hide;
frmDetails.Show;
end;

procedure TfrmSignup.btnRecordingClick(Sender: TObject);
begin
frmSignup.Hide;
frmRecord.Show;
end;

procedure TfrmSignup.Button1Click(Sender: TObject);
VAR
Name,Surname,PhoneNum:String;
Age:Integer;
begin
With dmTournamentData do
 begin
   tblPlayers.Last;
   tblPlayers.Insert;
   tblPlayers['Name']:=edtName.Text;
   tblPlayers['Surname']:=edtSurname.Text;
   tblPlayers['PhoneNum']:=edtPhone.Text;
   tblPlayers['Age']:=sedAge.Value;
   tblPlayers.Post;
 end;
 Showmessage('Welcome and good luck, '+edtName.Text+'!');
end;

procedure TfrmSignup.Button2Click(Sender: TObject);
begin
frmSignup.Hide;
frmWelcome.Show;
end;

procedure TfrmSignup.FormActivate(Sender: TObject);
begin
   btnDetails.Visible:=False;
   btnDetails.Enabled:=False;
   btnRecording.Visible:=False;
   btnRecording.Enabled:=False;
end;

end.
