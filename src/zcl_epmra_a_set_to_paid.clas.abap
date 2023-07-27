CLASS zcl_epmra_a_set_to_paid DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_a_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_action~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_epmra_a_set_to_paid IMPLEMENTATION.


  METHOD /bobf/if_frw_action~execute.
    " Typed with node's combined table type
    DATA lt_sales_order TYPE ztepmra_i_salesorder.

    " READING BO data ----------------------------------------------

    " Retrieve the data of the requested node instance
    io_read->retrieve(
      EXPORTING
      iv_node         = is_ctx-node_key
      it_key          = it_key
      IMPORTING
      et_data         = lt_sales_order
    ).
    " WRITING BO data ---------------------------------------------

    LOOP AT lt_sales_order ASSIGNING FIELD-SYMBOL(<s_sales_order>).

      " Set the attribute overall_status to new value
      IF <s_sales_order>-billingstatus = ' ' .
        <s_sales_order>-billingstatus  = 'P'.  " PAID

      ENDIF.
      IF <s_sales_order>-billingstatus EQ 'P' AND <s_sales_order>-deliverystatus EQ 'D'.
        <s_sales_order>-overallstatus = 'C'."Completed
      ELSEIF  <s_sales_order>-billingstatus EQ 'P' AND <s_sales_order>-deliverystatus EQ ' '.
        <s_sales_order>-overallstatus = 'I'."In Progress
      ENDIF.

      " Update the changed data (billig_status) of the node instance
      io_modify->update(
        EXPORTING
        iv_node               = is_ctx-node_key
        iv_key                = <s_sales_order>-key
        iv_root_key           = <s_sales_order>-root_key
        is_data               = REF #( <s_sales_order>-node_data )
        it_changed_fields     = VALUE #( ( zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder-overallstatus )
                                         ( zif_epmra_i_salesorder_c=>sc_node_attribute-zepmra_i_salesorder-billingstatus ) )
        ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
