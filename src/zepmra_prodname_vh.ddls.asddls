@AbapCatalog.sqlViewName: 'ZEPMRAPRODNVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Name Value help'

/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view zepmra_prodname_vh
  as select from SEPM_I_ProductText_E
{
  key Product,
      Language,
      ProductName,
      ProductDescription
}
where
  Language = $session.system_language
