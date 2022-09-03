object dmBase: TdmBase
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 369
  Width = 524
  object queryCadastro: TFDQuery
    Connection = dmConexaoBanco.base
    Left = 136
    Top = 168
  end
  object dsCadastro: TDataSource
    DataSet = queryCadastro
    Left = 296
    Top = 176
  end
end
