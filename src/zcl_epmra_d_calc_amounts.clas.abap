CLASS zcl_epmra_d_calc_amounts DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_determination~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_epmra_d_calc_amounts IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.
    " Read data with the given keys (typed with combined type table)
    DATA lt_item TYPE  ztepmra_i_salesorder_item.

    io_read->retrieve(
      EXPORTING
      iv_node                 =  is_ctx-node_key
      it_key                  =  it_key
      IMPORTING
      eo_message              =  eo_message
      et_data                 =  lt_item
      et_failed_key           =  et_failed_key
    ).

    " Read price-relevant product data from EPM product table SNWD_PD
    SELECT FROM snwd_pd
      FIELDS
        product_id AS product,
        price,
        currency_code,
        measure_unit
      FOR ALL ENTRIES IN @lt_item
      WHERE product_id = @lt_item-prodid
      INTO TABLE @DATA(lt_prices).

    SORT lt_prices BY product.
    LOOP AT lt_item REFERENCE INTO DATA(lr_item).
      IF lr_item->prodid IS NOT INITIAL AND lr_item->quantity > 0.
        READ TABLE lt_prices WITH KEY product = lr_item->prodid ASSIGNING FIELD-SYMBOL(<ls_price>) BINARY SEARCH.
        IF sy-subrc = 0.
          DATA(lv_new_amount) = lr_item->quantity * <ls_price>-price.
          IF lv_new_amount <> lr_item->grossamount.
            lr_item->grossamount = lv_new_amount.
            lr_item->currencycode = <ls_price>-currency_code.
            lr_item->net_amount = <ls_price>-price.
            lr_item->unitid = <ls_price>-measure_unit.
            io_modify->update(
              EXPORTING
                iv_node           =  is_ctx-node_key
                iv_key            =  lr_item->key
                is_data           =  lr_item
                it_changed_fields =  VALUE #( ( zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder_item-grossamount )
                                              ( zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder_item-currencycode )
                                              ( zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder_item-net_amount )
                                              ( zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder_item-unitid )
                                          ) ).
          ENDIF.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
