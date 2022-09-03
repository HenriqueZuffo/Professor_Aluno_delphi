object dmConexaoBanco: TdmConexaoBanco
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 369
  Width = 456
  object base: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=sdb162sw'
      
        'Database=C:\Users\henri\Desktop\a\Delphi\HenriqueGabrelDeAndrade' +
        '_PROJETOESCOLA_02092022\banco\PROJETO_ESCOLA.FDB'
      'DriverID=FB')
    Left = 160
    Top = 152
  end
  object queryGenerica: TFDQuery
    Connection = base
    Left = 232
    Top = 192
  end
end
