@AbapCatalog.sqlViewName: 'ZEPMRACSOIT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order items - Consumption View'


@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel:{
      semanticKey: ['Itempos'],
      createEnabled: true,
      deleteEnabled: true,
      updateEnabled: true
}
define view zepmra_c_salesorder_item
  as select from zepmra_i_salesorder_item
  association [1] to zepmra_c_salesorder as _Header on $projection.Souuid = _Header.Souuid
{
  key SoItemuuid,
      Souuid,
      @Search.defaultSearchElement: true
      Itempos,
      Prodid,
      PrdName,
      Unitid,
      Quantity,
      Currencycode,
      Grossamount,
      Net_Amount,
      Available,
      AtpStatus,
      ProdPicture,
      /* Associations */
      _Atp,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
      _Header,
      _Pdesc,
      _Product
}
