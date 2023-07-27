@AbapCatalog.sqlViewName: 'ZEPMRABILLSVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Billing Status Value help'

@Search.searchable: true
@ObjectModel:{
  resultSet.sizeCategory: #XS // smal size for dropdow helpvalue
}
define view zepmra_billstatus_vh
  as select from    dd07l as FixedValue
    left outer join dd07t as ValueText on  FixedValue.domname    = ValueText.domname
                                       and FixedValue.domvalue_l = ValueText.domvalue_l
                                       and FixedValue.as4local   = ValueText.as4local
{

       @Search.defaultSearchElement: true
       @Search.fuzzinessThreshold: 0.8
       @ObjectModel.text.element: ['BillStatus']
  key  FixedValue.domvalue_l as BillStatusID,
       @Semantics.text: true -- identifies the text field
       ValueText.ddtext      as BillStatus
}

where
      FixedValue.domname   = 'D_SO_CF'
  and FixedValue.as4local  = 'A' --Active
  and ValueText.ddlanguage = $session.system_language
