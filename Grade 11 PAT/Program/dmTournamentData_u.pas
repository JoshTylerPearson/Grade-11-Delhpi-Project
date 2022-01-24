unit dmTournamentData_u;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmTournamentData = class(TDataModule)
    conTournamentData: TADOConnection;
    tblPlayers: TADOTable;
    dsrPlayers: TDataSource;
    tblStats: TADOTable;
    dsrStats: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTournamentData: TdmTournamentData;

implementation

{$R *.dfm}

end.
