unit Stats_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Grids, DBGrids, dmtournamentData_u, StdCtrls, DB;

type
  TfrmStats = class(TForm)
    imgBg: TImage;
    dbgStats: TDBGrid;
    Button1: TButton;
    btnPlusAsc: TButton;
    btnPowerAsc: TButton;
    btnPlusDesc: TButton;
    Button2: TButton;
    edtPassword: TEdit;
    btnAdmin: TButton;
    btnRecording: TButton;
    btnDetails: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnAdminClick(Sender: TObject);
    procedure btnRecordingClick(Sender: TObject);
    procedure btnDetailsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnPlusAscClick(Sender: TObject);
    procedure btnPlusDescClick(Sender: TObject);
    procedure btnPowerAscClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    rgpNames:TRadioGroup;
  public
    { Public declarations }
  end;

var
  frmStats: TfrmStats;

implementation
Uses
 Recording_u, Change_u;

{$R *.dfm}

procedure TfrmStats.btnAdminClick(Sender: TObject);
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
   btnRecording.Visible:=True;
   btnRecording.Enabled:=True;
 end;
edtPassword.Clear;
end;

procedure TfrmStats.btnDetailsClick(Sender: TObject);
begin
frmStats.Hide;
frmDetails.Show;
end;

procedure TfrmStats.btnPlusAscClick(Sender: TObject);
begin
with dmTournamentData do
 begin
   tblStats.Sort:='NumPlus  ASC';
 end;
end;

procedure TfrmStats.btnPlusDescClick(Sender: TObject);
begin
with dmTournamentData do
 begin
   tblStats.Sort:='NumPlus  DESC';
 end;
end;

procedure TfrmStats.btnPowerAscClick(Sender: TObject);
begin
with dmTournamentData do
 begin
   tblStats.Sort:='NumPower  ASC';
 end;
end;

procedure TfrmStats.btnRecordingClick(Sender: TObject);
begin
frmStats.Hide;
frmRecord.Show;
end;

procedure TfrmStats.Button1Click(Sender: TObject);
begin
with dmTournamentData do
 begin
   tblStats.Filtered:=False;
   tblStats.Filter:='Winner ='+QuotedStr(rgpNames.Items[rgpNames.ItemIndex]);
   tblStats.Filtered:=true;
 end;
end;

procedure TfrmStats.Button2Click(Sender: TObject);
begin
with dmTournamentData do
 begin
   tblStats.Sort:='NumPower  DESC';
 end;
end;

procedure TfrmStats.FormActivate(Sender: TObject);
VAR
arrNames:Array[1..250] of String;
Count,K:Integer;
begin
btnDetails.Enabled:=False;
btnDetails.Visible:=False;
btnRecording.Enabled:=False;
btnrecording.Visible:=False;
With dmTournamentData do
 begin
   tblPLayers.First;
   while not(tblPlayers.Eof) do
    begin
      ArrNames[Count]:=tblPlayers['Name'];
      tblPlayers.Next;
      Inc(Count);
    end;
 end;
rgpNames:=TRadioGroup.Create(frmStats);
With rgpNames Do
 begin
   Parent:=frmStats;
   Name:='rgpNames';
   Columns:=3;
   Top:=8;
   Left:=105;
   Width:=185;
   Height:=105;
   for K := 1 to Count do
   begin
     Items.Add(arrNames[K]);
   end;

 end;
end;
end.
