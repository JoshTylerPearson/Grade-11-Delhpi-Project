program Project1;

uses
  Forms,
  Signup_u in 'Signup_u.pas' {frmSignup},
  Recording_u in 'Recording_u.pas' {frmRecord},
  Welcome_u in 'Welcome_u.pas' {frmWelcome},
  Change_u in 'Change_u.pas' {frmDetails},
  dmTournamentData_u in 'dmTournamentData_u.pas' {dmTournamentData: TDataModule},
  Stats_u in 'Stats_u.pas' {frmStats};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmWelcome, frmWelcome);
  Application.CreateForm(TfrmSignup, frmSignup);
  Application.CreateForm(TfrmRecord, frmRecord);
  Application.CreateForm(TfrmDetails, frmDetails);
  Application.CreateForm(TdmTournamentData, dmTournamentData);
  Application.CreateForm(TfrmStats, frmStats);
  Application.Run;
end.
