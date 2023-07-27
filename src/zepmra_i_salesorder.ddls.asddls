@AbapCatalog.sqlViewName: 'ZEPMRAISO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Header  - BO view'

@Search.searchable: true
@ObjectModel: {
  -- Annotations for transactional processing
  semanticKey: 'SalesOrder',
  compositionRoot: true,
  transactionalProcessingEnabled: true,
  createEnabled: true,
  deleteEnabled: true,
  updateEnabled: true,
  writeActivePersistence: 'znwd_so',
  -- Additional annotations for draft enablement
  draftEnabled: true,
  writeDraftPersistence: 'znwd_so_draft',

  -- Additional ETag annotation (time stamp)
  entityChangeStateId: 'Lchg_Date_Time'
}
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define view zepmra_i_salesorder
  as select from znwd_so as Header
  association [0..*] to zepmra_i_salesorder_item as _Item       on $projection.Souuid = _Item.Souuid
  association [1]    to SEPM_I_BusinessPartner   as _Partner    on $projection.BusinessPartner = _Partner.BusinessPartner
  association [1]    to I_Currency               as _Currency   on $projection.CurrencyCode = _Currency.Currency
  association [1]    to zepmra_overralstatus_vh  as _OvStatus   on $projection.OverallStatus = _OvStatus.OvStatusID
  association [1]    to zepmra_billstatus_vh     as _BillStatus on $projection.BillingStatus = _BillStatus.BillStatusID
  association [1]    to zepmra_delivery_vh       as _DelStatus  on $projection.DeliveryStatus = _DelStatus.DeliveryStatusID
  association [1]    to zepmra_paymentmth_vh     as _PayMethod  on $projection.PaymentMethod = _PayMethod.PaymentID
  association [1]    to zepmra_paymenterms_vh    as _PayTerms   on $projection.PaymentTerms = _PayTerms.PaymentTID
{
  key souuid                    as Souuid,
      @ObjectModel.readOnly: true
      @Search.defaultSearchElement: true
      salesorder                as SalesOrder,
      @Consumption.valueHelpDefinition: [{ association: '_Partner' }]
      @ObjectModel.text.element: ['PartnerName']
      @ObjectModel.mandatory: true
      businesspartner           as BusinessPartner,
      _Partner.CompanyName      as PartnerName,
      @ObjectModel.readOnly: true
      currencycode              as CurrencyCode,
      @Semantics.amount.currencyCode: 'currencycode'
      @ObjectModel.readOnly: true
      grossamount               as GrossAmount,
      @Semantics.amount.currencyCode: 'currencycode'
      @ObjectModel.readOnly: true
      netamount                 as NetAmount,
      @Consumption.valueHelpDefinition: [{ association: '_OvStatus' }]
      @ObjectModel.text.element: ['OvStatusTxt']
      @ObjectModel.readOnly: true
      overallstatus             as OverallStatus,
      _OvStatus.OvStatus        as OvStatusTxt,
      @ObjectModel.text.element: ['BillStatusTxt']
      @Consumption.valueHelpDefinition: [{ association: '_BillStatus' }]
      @ObjectModel.readOnly: true
      billingstatus             as BillingStatus,
      _BillStatus.BillStatus    as BillStatusTxt,
      @Consumption.valueHelpDefinition: [{ association: '_DelStatus' }]
      @ObjectModel.text.element: ['DelivetyStatusTxt']
      @ObjectModel.readOnly: true
      deliverystatus            as DeliveryStatus,
      _DelStatus.DeliveryStatus as DelivetyStatusTxt,

      @Consumption.valueHelpDefinition: [{ association: '_PayMethod' }]
      @ObjectModel.text.element: ['PaymentMethodTxt']
      paymentmethod             as PaymentMethod,
      _PayMethod.PaymentMethod  as PaymentMethodTxt,

      @Consumption.valueHelpDefinition: [{ association: '_PayTerms' }]
      @ObjectModel.text.element: ['PaymentTermsTxt']
      paymentterms              as PaymentTerms,
      _PayTerms.PaymentTerms    as PaymentTermsTxt,
      deliverydate              as DeliveryDate,
      crea_date_time            as Crea_Date_Time,
      crea_uname                as Crea_Uname,
      @ObjectModel.readOnly: true
      lchg_date_time            as Lchg_Date_Time,
      @ObjectModel.readOnly: true
      lchg_uname                as Lchg_Uname,
      /* Associations */
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Item,
      _Partner,
      _Currency,
      _OvStatus,
      _BillStatus,
      _DelStatus,
      _PayMethod,
      _PayTerms
}
