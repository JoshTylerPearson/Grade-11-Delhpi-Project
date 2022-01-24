unit Change_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Grids, DBGrids, dmTournamentData_u, Spin, db;

type
  TfrmDetails = class(TForm)
    imgBg: TImage;
    btnDelete: TButton;
    btnLocate: TButton;
    dbgPlayers: TDBGrid;
    lblNote: TLabel;
    btnEditName: TButton;
    btnEditSurname: TButton;
    btnEditPhone: TButton;
    btnEditAge: TButton;
    edtName: TEdit;
    edtPhoneNum: TEdit;
    edtSurname: TEdit;
    sedAge: TSpinEdit;
    btnEditAll: TButton;
    btnAdmin: TButton;
    edtPassword: TEdit;
    btnRecording: TButton;
    btnSignup: TButton;
    procedure btnLocateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditNameClick(Sender: TObject);
    procedure btnEditSurnameClick(Sender: TObject);
    procedure btnEditPhoneClick(Sender: TObject);
    procedure btnEditAgeClick(Sender: TObject);
    procedure btnEditAllClick(Sender: TObject);
    procedure btnAdminClick(Sender: TObject);
    procedure btnRecordingClick(Sender: TObject);
    procedure btnSignupClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetails: TfrmDetails;

implementation
Uses
 Signup_u, Recording_u;

{$R *.dfm}

procedure TfrmDetails.btnAdminClick(Sender: TObject);
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
   btnSignup.Visible:=True;
   btnSignup.Enabled:=True;
   btnRecording.Visible:=True;
   btnRecording.Enabled:=True;
 end
 else begin
   Showmessage('Incorrect password.');
   Exit;
 end;
edtPassword.Clear;
end;

procedure TfrmDetails.btnDeleteClick(Sender: TObject);
begin
with dmTournamentData do
 if messagedlg('Are you sure you want to delete the record of '+tblPlayers['Name']+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
  tblPlayers.Delete;
  Showmessage('Record deleted.');
  end else Showmessage('Not deleted.');
end;

procedure TfrmDetails.btnEditAgeClick(Sender: TObject);
begin
with dmTournamentData do
 begin
   tblPlayers.Edit;
   tblPlayers['Age']:=sedAge.Value;
   tblPlayers.Post;
 end;
end;

procedure TfrmDetails.btnEditAllClick(Sender: TObject);
begin
with dmTournamentData do
 begin
   tblPlayers.Edit;
   tblPlayers['Name']:=edtName.Text;
   tblPlayers['Surname']:=edtSurname.Text;
   tblPlayers['PhoneNum']:=edtPhoneNum.Text;
   tblPlayers['Age']:=sedAge.Value;
   tblPlayers.Post;
 end;
end;

procedure TfrmDetails.btnEditNameClick(Sender: TObject);
begin
with dmTournamentData do
 begin
   tblPlayers.Edit;
   tblPlayers['Name']:=edtName.Text;
   tblPlayers.Post;
 end;
end;

procedure TfrmDetails.btnEditPhoneClick(Sender: TObject);
begin
with dmTournamentData do
 begin
   tblPlayers.Edit;
   tblPlayers['PhoneNum']:=edtPhoneNum.Text;
   tblPlayers.Post;
 end;
end;

procedure TfrmDetails.btnEditSurnameClick(Sender: TObject);
begin
with dmTournamentData do
 begin
   tblPlayers.Edit;
   tblPlayers['Surname']:=edtSurname.Text;
   tblPlayers.Post;
 end;
end;

procedure TfrmDetails.btnLocateClick(Sender: TObject);
VAR
Name:String;
begin
Name:=InputBox('Player Name','Enter player name','');
With dmTournamentData do
 begin
   if NOT(tblPLayers.Locate('Name',Name,[loPartialKey,loCaseInsensitive])) then
     begin
       showmessage(Name+' not found');
       Exit;
     end else tblPLayers.Locate('Name',Name,[loPartialKey,loCaseInsensitive]);
 end;
end;

procedure TfrmDetails.btnRecordingClick(Sender: TObject);
begin
frmDetails.Hide;
frmRecord.Show;
end;

procedure TfrmDetails.btnSignupClick(Sender: TObject);
begin
frmDetails.Hide;
frmSignup.Show;
end;

procedure TfrmDetails.FormActivate(Sender: TObject);
begin
   btnSignup.Visible:=False;
   btnSignup.Enabled:=False;
   btnRecording.Visible:=False;
   btnRecording.Enabled:=False;
end;

end.
