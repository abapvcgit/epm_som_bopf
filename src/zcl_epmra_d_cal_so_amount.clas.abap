CLASS zcl_epmra_d_cal_so_amount DEFINITION
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



CLASS zcl_epmra_d_cal_so_amount IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.
    DATA :lt_data TYPE ztepmra_i_salesorder,
          lt_item TYPE ztepmra_i_salesorder_item.

    io_read->retrieve(
     EXPORTING
       iv_node                 = is_ctx-node_key   " uuid of node name
       it_key                  = it_key            " keys given to the determination
     IMPORTING
       eo_message              = eo_message        " pass message object
       et_data                 = lt_data           " itab with node data
       et_failed_key           = et_failed_key     " pass failures
   ).

    io_read->retrieve_by_association(
      EXPORTING
        iv_node                 = is_ctx-node_key  " Node Name
        it_key                  = it_key           " Key Table
        iv_association          = zif_epmra_i_salesorder_c=>sc_association-zepmra_i_salesorder-_item" Name of Association
        iv_fill_data            = abap_true        " Data Element for Domain BOOLE: TRUE (="X") and FALSE (=" ")
       IMPORTING
        eo_message              = eo_message        " pass message object
        et_data                 = lt_item           " itab with node data
        et_failed_key           = et_failed_key     " pass failures
      ).
    LOOP AT lt_data REFERENCE INTO DATA(lr_data).
      CLEAR : lr_data->netamount , lr_data->grossamount.
      LOOP AT lt_item REFERENCE INTO DATA(lr_item) WHERE parent_key = lr_data->key .
        lr_data->netamount    = lr_data->netamount + lr_item->net_amount.
        lr_data->grossamount  = lr_data->grossamount + lr_item->grossamount.
        lr_data->currencycode = lr_item->currencycode.
      ENDLOOP.

      io_modify->update(
          EXPORTING
          iv_node           = is_ctx-node_key    " uuid of node
          iv_key            = lr_data->key       " key of line
          is_data           = lr_data            " ref to modified data
          it_changed_fields = VALUE #( ( zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder-netamount )
                                       ( zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder-grossamount )
                                       ( zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder-currencycode ) )
        ).

    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
