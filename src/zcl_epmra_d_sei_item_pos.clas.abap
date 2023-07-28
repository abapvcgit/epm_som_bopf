CLASS zcl_epmra_d_sei_item_pos DEFINITION
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



CLASS zcl_epmra_d_sei_item_pos IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    DATA lt_data TYPE ztepmra_i_salesorder_item.

    io_read->retrieve(
      EXPORTING
      iv_node                 = is_ctx-node_key   " uuid of node name
      it_key                  = it_key            " keys given to the determination
      IMPORTING
      eo_message              = eo_message        " pass message object
      et_data                 = lt_data           " itab with node data
      et_failed_key           = et_failed_key     " pass failures
    ).

    SELECT FROM znwd_so_i_draft
      FIELDS souuid, MAX( itempos ) AS max
      GROUP BY souuid
      INTO TABLE @DATA(lt_max_item).


    " Assign numbers to each newly created item and trigger the modification in BOPF
    LOOP AT lt_data REFERENCE INTO DATA(lr_data).
      IF lr_data->itempos IS INITIAL.

        " If a SalesOrderItem already exists increment it be 10 otherwise define the first one (and append it to the table of maximum SOI IDs)
        READ TABLE lt_max_item WITH KEY souuid = lr_data->parent_key REFERENCE INTO DATA(lr_max_item).
        IF sy-subrc = 0. "row is found
          lr_max_item->max = lr_max_item->max + 10.
        ELSE. "row not found
          APPEND INITIAL LINE TO lt_max_item REFERENCE INTO lr_max_item.
          lr_max_item->souuid = lr_data->parent_key.
          lr_max_item->max = 10.
        ENDIF.

        " Fill leading zeros for ALPHANUM field on database
        lr_data->itempos = |{ lr_max_item->max ALPHA = IN }|.

        io_modify->update(
          EXPORTING
          iv_node           = is_ctx-node_key   " uuid of node
          iv_key            = lr_data->key      " key of line
          is_data           = lr_data           " ref to modified data
          it_changed_fields = VALUE #( ( zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder_item-itempos ) )
        ).
      ENDIF.
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
