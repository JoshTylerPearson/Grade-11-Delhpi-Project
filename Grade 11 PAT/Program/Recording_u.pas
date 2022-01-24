unit Recording_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, dmTournamentData_u, Grids, DBGrids, StdCtrls, Spin;

type
  TfrmRecord = class(TForm)
    imgBg: TImage;
    dbgStats: TDBGrid;
    edtWinner: TEdit;
    sedPlus: TSpinEdit;
    sedPower: TSpinEdit;
    lblName: TLabel;
    lblPlus: TLabel;
    lblPower: TLabel;
    btnInsert: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    lblNote: TLabel;
    Button2: TButton;
    btnSignUp: TButton;
    btnDetails: TButton;
    edtPassword: TEdit;
    btnStats: TButton;
    procedure btnInsertClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure btnDetailsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnStatsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecord: TfrmRecord;

implementation
uses
Signup_u, Change_u, Stats_u;

{$R *.dfm}

procedure TfrmRecord.btnDeleteClick(Sender: TObject);
begin
with dmTournamentData do
 if messagedlg('Are you sure you want to delete the record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
  tblStats.Delete;
  Showmessage('Record deleted.');
  end else Showmessage('Not deleted.');
end;

procedure TfrmRecord.btnDetailsClick(Sender: TObject);
begin
frmDetails.Show;
frmRecord.Hide;
end;

procedure TfrmRecord.btnEditClick(Sender: TObject);
begin
with dmTournamentData do
 begin
   tblStats.Edit;
   tblStats['Winner']:=edtWinner.Text;
   tblStats['NumPlus']:=sedPlus.Value;
   tblStats['NumPower']:=sedPower.Value;
   tblStats.Post;
 end;
end;

procedure TfrmRecord.btnInsertClick(Sender: TObject);
begin
with dmTournamentData do
 begin
   tblStats.Last;
   tblStats.Insert;
   tblStats['Winner']:=edtWinner.Text;
   tblStats['NumPlus']:=sedPlus.Value;
   tblStats['NumPower']:=sedPower.Value;
   tblStats.Post;
 end;
end;

procedure TfrmRecord.btnSignUpClick(Sender: TObject);
begin
frmSignup.Show;
frmRecord.Hide;
end;

procedure TfrmRecord.btnStatsClick(Sender: TObject);
begin
 frmStats.Show;
 frmRecord.Hide;
end;

procedure TfrmRecord.Button2Click(Sender: TObject);
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
   btnDetails.Visible:=True;
   btnDetails.Enabled:=True;
   btnSignUp.Visible:=True;
   btnSignUp.Enabled:=True;
   btnStats.Enabled:=True;
   btnStats.Visible:=True;
 end;
end;

procedure TfrmRecord.FormActivate(Sender: TObject);
begin
   btnDetails.Visible:=False;
   btnDetails.Enabled:=False;
   btnSignUp.Visible:=False;
   btnSignUp.Enabled:=False;
   btnStats.Enabled:=False;
   btnStats.Visible:=False;
end;

end.
