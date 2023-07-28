@AbapCatalog.sqlViewName: 'ZEPMRAISOIT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item - BO view'

@Search.searchable:true
@ObjectModel: {
  semanticKey:  [ 'Itempos' ],
  writeActivePersistence: 'znwd_so_i',
  createEnabled: true,
  deleteEnabled: true,
  updateEnabled: true,
  writeDraftPersistence: 'znwd_so_i_draft'      -- Draft persistence
}
define view zepmra_i_salesorder_item
  as select from znwd_so_i as Item

  association [1] to zepmra_i_salesorder as _Header  on $projection.Souuid = _Header.Souuid
  association [1] to SEPM_I_Product_E    as _Product on $projection.Prodid = _Product.Product
  association [1] to zepmra_atp_vh       as _Atp     on $projection.Available = _Atp.Atp
  association [1] to zepmra_prodname_vh  as _Pdesc   on $projection.Prodid = _Pdesc.Product
{

  key soitemuuid         as SoItemuuid,
      souuid             as Souuid,
      @Search.defaultSearchElement: true
      @ObjectModel.readOnly: true
      itempos            as Itempos,
      @Consumption.valueHelpDefinition: [{ association: '_Product' }]
      @ObjectModel.text.element: ['PrdName']
      prodid             as Prodid,
      _Pdesc.ProductName as PrdName,
      @ObjectModel.readOnly: true
      unitid             as Unitid,
      @Semantics.quantity.unitOfMeasure: 'unitid'
      quantity           as Quantity,
      @ObjectModel.readOnly: true
      currencycode       as Currencycode,
      @Semantics.amount.currencyCode: 'currencycode'
      @ObjectModel.readOnly: true
      grossamount        as Grossamount,
      @Semantics.amount.currencyCode: 'currencycode'
      @ObjectModel.readOnly: true
      net_amount         as Net_Amount,
      @Consumption.valueHelpDefinition: [{ association: '_Atp' }]
      @ObjectModel.text.element: ['AtpStatus']
      available          as Available,
      _Atp.ATPstatus     as AtpStatus,
      @Semantics.imageUrl: true
      _Product.ProductPictureURL as ProdPicture,
      /*  Exposed associations  */
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
      _Header,
      _Product,
      _Atp,
      _Pdesc
}
