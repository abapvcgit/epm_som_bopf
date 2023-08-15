CLASS zcl_d_epmra_i_salesorder_actio DEFINITION
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



CLASS zcl_d_epmra_i_salesorder_actio IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.


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

    " (2) Create a property helper object
    DATA(lo_property_helper) = NEW /bobf/cl_lib_h_set_property( io_modify = io_modify
                                                    is_context = is_ctx ).


    " (3 ) Set the attribute "comments" to read-only for all paid invoices
    LOOP AT lt_data INTO DATA(ls_data).

      SELECT SINGLE salesorder
      INTO @DATA(lv_so)
      FROM znwd_so WHERE salesorder = @ls_data-salesorder.
      IF sy-subrc EQ 0.
        lo_property_helper->set_attribute_read_only(
            iv_attribute_name = zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder-businesspartner
            iv_key            = ls_data-key ).
      ENDIF.

      IF ls_data-deliverystatus IS NOT INITIAL.
        lo_property_helper->set_action_enabled(
          EXPORTING
            iv_action_key = zif_epmra_i_salesorder_c=>sc_action-zepmra_i_salesorder-set_to_del                " Key of the action for which the property is to be set
            iv_key        =  ls_data-key                " Key of the instance for which the property is to be set
            iv_value      = abap_false        " New value of this property (true/false)
        ).
      ENDIF.
      IF ls_data-billingstatus IS NOT INITIAL.
        lo_property_helper->set_action_enabled(
        EXPORTING
          iv_action_key = zif_epmra_i_salesorder_c=>sc_action-zepmra_i_salesorder-set_to_paid                " Key of the action for which the property is to be set
          iv_key        =  ls_data-key                " Key of the instance for which the property is to be set
          iv_value      = abap_false        " New value of this property (true/false)
      ).
      ENDIF.

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
