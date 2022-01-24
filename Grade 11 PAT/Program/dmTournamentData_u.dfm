object dmTournamentData: TdmTournamentData
  OldCreateOrder = False
  Height = 209
  Width = 372
  object conTournamentData: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Documents\_Schoo' +
      'l\Grade 11\_IT\PAT\Program\TournamentData.mdb;Mode=ReadWrite;Per' +
      'sist Security Info=False;Jet OLEDB:System database="";Jet OLEDB:' +
      'Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine' +
      ' Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Parti' +
      'al Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New' +
      ' Database Password="";Jet OLEDB:Create System Database=False;Jet' +
      ' OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Com' +
      'pact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OL' +
      'EDB:SFP=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 64
  end
  object tblPlayers: TADOTable
    Active = True
    Connection = conTournamentData
    CursorType = ctStatic
    TableName = 'Players'
    Left = 152
    Top = 32
  end
  object dsrPlayers: TDataSource
    DataSet = tblPlayers
    Left = 256
    Top = 32
  end
  object tblStats: TADOTable
    Active = True
    Connection = conTournamentData
    CursorType = ctStatic
    TableName = 'Stats'
    Left = 152
    Top = 112
  end
  object dsrStats: TDataSource
    DataSet = tblStats
    Left = 256
    Top = 112
  end
end
