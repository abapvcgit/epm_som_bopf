CLASS zcl_epmra_d_set_salesorderid DEFINITION
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



CLASS zcl_epmra_d_set_salesorderid IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.
    DATA lv_timestamp TYPE timestampl.
    GET TIME STAMP FIELD lv_timestamp.
    "Find the highest used sales order number in both active and draft data

    WITH +both AS ( SELECT salesorder FROM znwd_so   "active data
      UNION ALL
      SELECT salesorder FROM znwd_so_draft )          "draft data
    SELECT SINGLE
      FROM +both
      FIELDS MAX( salesorder ) AS salesorder
      INTO @DATA(lv_max_salesorder).

    "If there are no entries, set a start value
    IF lv_max_salesorder IS INITIAL.
      lv_max_salesorder = '0700000000'.
    ENDIF.

    "Read data with the given keys
    DATA lt_data TYPE ztepmra_i_salesorder.

    io_read->retrieve(
      EXPORTING
        iv_node                 = is_ctx-node_key   " uuid of node name
        it_key                  = it_key            " keys given to the determination
      IMPORTING
        eo_message              = eo_message        " pass message object
        et_data                 = lt_data           " itab with node data
        et_failed_key           = et_failed_key     " pass failures
    ).

    "Assign numbers to each newly created line and tell BOPF about the modification
    LOOP AT lt_data REFERENCE INTO DATA(lr_data).
      IF lr_data->salesorder IS INITIAL.
        ADD 1 TO lv_max_salesorder.
        lr_data->salesorder = lv_max_salesorder.
        lr_data->overallstatus = 'N'.
        lr_data->crea_uname = sy-uname.
        lr_data->lchg_date_time = lv_timestamp.
        lr_data->crea_date_time = lv_timestamp.
        lr_data->lchg_uname = sy-uname.
        " Fill leading zeros for ALPHANUM field on database
        lr_data->salesorder = |{ lr_data->salesorder ALPHA = IN }|.

        io_modify->update(
          EXPORTING
          iv_node           = is_ctx-node_key    " uuid of node
          iv_key            = lr_data->key       " key of line
          is_data           = lr_data            " ref to modified data
          it_changed_fields = VALUE #( ( zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder-salesorder )
                                       ( zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder-overallstatus )
                                       ( zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder-crea_uname )
                                       ( zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder-crea_date_time )
                                       ( zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder-lchg_uname )
                                       ( zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder-lchg_date_time ) )
        ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
