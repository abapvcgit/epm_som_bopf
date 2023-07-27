@AbapCatalog.sqlViewName: 'ZEPMRACSO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order - Consumption View'


@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel:{
      compositionRoot: true,
      transactionalProcessingDelegated: true,
      createEnabled: true,
      deleteEnabled: true,
      updateEnabled: true,
      semanticKey: ['SalesOrder'],
      draftEnabled: true
}

define view zepmra_c_salesorder
  as select from zepmra_i_salesorder
  association [0..*] to zepmra_c_salesorder_item as _Item on $projection.Souuid = _Item.Souuid
{
  key Souuid,
      @Search.defaultSearchElement: true
      SalesOrder,
      BusinessPartner,
      PartnerName,
      CurrencyCode,
      GrossAmount,
      NetAmount,
      OverallStatus,
      OvStatusTxt,
      BillingStatus,
      BillStatusTxt,
      DeliveryStatus,
      DelivetyStatusTxt,
      PaymentMethod,
      PaymentMethodTxt,
      PaymentTerms,
      PaymentTermsTxt,
      DeliveryDate,
      Crea_Date_Time,
      Crea_Uname,
      Lchg_Date_Time,
      Lchg_Uname,
      /* Associations */
      _BillStatus,
      _Currency,
      _DelStatus,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Item,
      _OvStatus,
      _Partner,
      _PayMethod,
      _PayTerms
}
