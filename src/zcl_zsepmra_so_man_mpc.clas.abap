class ZCL_ZSEPMRA_SO_MAN_MPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_MODEL
  create public .

public section.

  interfaces IF_SADL_GW_MODEL_EXPOSURE_DATA .

  types:
    begin of TS_I_CURRENCYTYPE.
      include type IFICURRENCY.
  types:
      T_CURRENCY type IFICURRENCYTEXT-CURRENCYNAME,
    end of TS_I_CURRENCYTYPE .
  types:
   TT_I_CURRENCYTYPE type standard table of TS_I_CURRENCYTYPE .
  types:
   TS_I_DRAFTADMINISTRATIVEDATATY type SDRAFT_ADMIN_CDS .
  types:
   TT_I_DRAFTADMINISTRATIVEDATATY type standard table of TS_I_DRAFTADMINISTRATIVEDATATY .
  types:
    begin of TS_SEPM_I_BUSINESSPARTNERTYPE.
      include type SEPM_IBUPA.
      include type INCL_TRF_SNWD_BPA.
  types:
    end of TS_SEPM_I_BUSINESSPARTNERTYPE .
  types:
   TT_SEPM_I_BUSINESSPARTNERTYPE type standard table of TS_SEPM_I_BUSINESSPARTNERTYPE .
  types:
    begin of TS_SEPM_I_PRODUCT_ETYPE.
      include type SEPM_IPRODUCTE.
      include type INCL_TRF_SNWD_PD.
  types:
      generated_id type string,
      T_PRODUCT type SEPM_IPRODUCTTE-PRODUCTNAME,
    end of TS_SEPM_I_PRODUCT_ETYPE .
  types:
   TT_SEPM_I_PRODUCT_ETYPE type standard table of TS_SEPM_I_PRODUCT_ETYPE .
  types:
   TS_ZEPMRA_ATP_VHTYPE type ZEPMRATPVH .
  types:
   TT_ZEPMRA_ATP_VHTYPE type standard table of TS_ZEPMRA_ATP_VHTYPE .
  types:
   TS_ZEPMRA_BILLSTATUS_VHTYPE type ZEPMRABILLSVH .
  types:
   TT_ZEPMRA_BILLSTATUS_VHTYPE type standard table of TS_ZEPMRA_BILLSTATUS_VHTYPE .
  types:
    begin of TS_ZEPMRA_C_SALESORDERTYPE.
      include type ZEPMRACSO.
  types:
      ACTIVEUUID type ZNWD_SO_DRAFT-ACTIVEUUID,
      DRAFTENTITYCREATIONDATETIME type ZNWD_SO_DRAFT-DRAFTENTITYCREATIONDATETIME,
      DRAFTENTITYLASTCHANGEDATETIME type ZNWD_SO_DRAFT-DRAFTENTITYLASTCHANGEDATETIME,
      HASACTIVEENTITY type SDRAFT_HAS_ACTIVE,
      HASDRAFTENTITY type SDRAFT_HAS_DRAFT,
      ISACTIVEENTITY type SDRAFT_IS_ACTIVE,
      A_ACTIVATION type SADL_GW_DYNAMIC_ACTN_PROPERTY,
      A_EDIT type SADL_GW_DYNAMIC_ACTN_PROPERTY,
      A_PREPARATION type SADL_GW_DYNAMIC_ACTN_PROPERTY,
      A_VALIDATION type SADL_GW_DYNAMIC_ACTN_PROPERTY,
    end of TS_ZEPMRA_C_SALESORDERTYPE .
  types:
   TT_ZEPMRA_C_SALESORDERTYPE type standard table of TS_ZEPMRA_C_SALESORDERTYPE .
  types:
    begin of TS_ZEPMRA_C_SALESORDER_ITEMTYP.
      include type ZEPMRACSOIT.
  types:
      ACTIVEUUID type ZNWD_SO_I_DRAFT-ACTIVEUUID,
      DRAFTENTITYCREATIONDATETIME type ZNWD_SO_I_DRAFT-DRAFTENTITYCREATIONDATETIME,
      DRAFTENTITYLASTCHANGEDATETIME type ZNWD_SO_I_DRAFT-DRAFTENTITYLASTCHANGEDATETIME,
      HASACTIVEENTITY type SDRAFT_HAS_ACTIVE,
      HASDRAFTENTITY type SDRAFT_HAS_DRAFT,
      ISACTIVEENTITY type SDRAFT_IS_ACTIVE,
      A_PREPARATION type SADL_GW_DYNAMIC_ACTN_PROPERTY,
      A_VALIDATION type SADL_GW_DYNAMIC_ACTN_PROPERTY,
    end of TS_ZEPMRA_C_SALESORDER_ITEMTYP .
  types:
   TT_ZEPMRA_C_SALESORDER_ITEMTYP type standard table of TS_ZEPMRA_C_SALESORDER_ITEMTYP .
  types:
   TS_ZEPMRA_DELIVERY_VHTYPE type ZEPMRADELVH .
  types:
   TT_ZEPMRA_DELIVERY_VHTYPE type standard table of TS_ZEPMRA_DELIVERY_VHTYPE .
  types:
   TS_ZEPMRA_OVERRALSTATUS_VHTYPE type ZEPMRAOSVH .
  types:
   TT_ZEPMRA_OVERRALSTATUS_VHTYPE type standard table of TS_ZEPMRA_OVERRALSTATUS_VHTYPE .
  types:
   TS_ZEPMRA_PAYMENTERMS_VHTYPE type ZEPMRAPAYTERMVH .
  types:
   TT_ZEPMRA_PAYMENTERMS_VHTYPE type standard table of TS_ZEPMRA_PAYMENTERMS_VHTYPE .
  types:
   TS_ZEPMRA_PAYMENTMTH_VHTYPE type ZEPMRAPAYMTHVH .
  types:
   TT_ZEPMRA_PAYMENTMTH_VHTYPE type standard table of TS_ZEPMRA_PAYMENTMTH_VHTYPE .
  types:
   TS_ZEPMRA_PRODNAME_VHTYPE type ZEPMRAPRODNVH .
  types:
   TT_ZEPMRA_PRODNAME_VHTYPE type standard table of TS_ZEPMRA_PRODNAME_VHTYPE .

  constants GC_I_CURRENCYTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'I_CurrencyType' ##NO_TEXT.
  constants GC_I_DRAFTADMINISTRATIVEDATATY type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'I_DraftAdministrativeDataType' ##NO_TEXT.
  constants GC_SEPM_I_BUSINESSPARTNERTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'SEPM_I_BusinessPartnerType' ##NO_TEXT.
  constants GC_SEPM_I_PRODUCT_ETYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'SEPM_I_Product_EType' ##NO_TEXT.
  constants GC_ZEPMRA_ATP_VHTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'zepmra_atp_vhType' ##NO_TEXT.
  constants GC_ZEPMRA_BILLSTATUS_VHTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'zepmra_billstatus_vhType' ##NO_TEXT.
  constants GC_ZEPMRA_C_SALESORDERTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'zepmra_c_salesorderType' ##NO_TEXT.
  constants GC_ZEPMRA_C_SALESORDER_ITEMTYP type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'zepmra_c_salesorder_itemType' ##NO_TEXT.
  constants GC_ZEPMRA_DELIVERY_VHTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'zepmra_delivery_vhType' ##NO_TEXT.
  constants GC_ZEPMRA_OVERRALSTATUS_VHTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'zepmra_overralstatus_vhType' ##NO_TEXT.
  constants GC_ZEPMRA_PAYMENTERMS_VHTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'zepmra_paymenterms_vhType' ##NO_TEXT.
  constants GC_ZEPMRA_PAYMENTMTH_VHTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'zepmra_paymentmth_vhType' ##NO_TEXT.
  constants GC_ZEPMRA_PRODNAME_VHTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'zepmra_prodname_vhType' ##NO_TEXT.

  methods DEFINE
    redefinition .
  methods GET_LAST_MODIFIED
    redefinition .
protected section.
private section.

  methods DEFINE_RDS_4
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_LAST_MODIFIED_RDS_4
    returning
      value(RV_LAST_MODIFIED_RDS) type TIMESTAMP .
ENDCLASS.



CLASS ZCL_ZSEPMRA_SO_MAN_MPC IMPLEMENTATION.


  method DEFINE.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*

model->set_schema_namespace( 'ZSEPMRA_SO_MAN_SRV' ).

define_rds_4( ).
get_last_modified_rds_4( ).
  endmethod.


  method DEFINE_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
    TRY.
        if_sadl_gw_model_exposure_data~get_model_exposure( )->expose( model )->expose_vocabulary( vocab_anno_model ).
      CATCH cx_sadl_exposure_error INTO DATA(lx_sadl_exposure_error).
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_med_exception
          EXPORTING
            previous = lx_sadl_exposure_error.
    ENDTRY.
  endmethod.


  method GET_LAST_MODIFIED.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  CONSTANTS: lc_gen_date_time TYPE timestamp VALUE '20230726185916'.                  "#EC NOTEXT
 DATA: lv_rds_last_modified TYPE timestamp .
  rv_last_modified = super->get_last_modified( ).
  IF rv_last_modified LT lc_gen_date_time.
    rv_last_modified = lc_gen_date_time.
  ENDIF.
 lv_rds_last_modified =  GET_LAST_MODIFIED_RDS_4( ).
 IF rv_last_modified LT lv_rds_last_modified.
 rv_last_modified  = lv_rds_last_modified .
 ENDIF .
  endmethod.


  method GET_LAST_MODIFIED_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
    CONSTANTS: co_gen_date_time TYPE timestamp VALUE '20230726205918'.
    TRY.
        rv_last_modified_rds = CAST cl_sadl_gw_model_exposure( if_sadl_gw_model_exposure_data~get_model_exposure( ) )->get_last_modified( ).
      CATCH cx_root.
        rv_last_modified_rds = co_gen_date_time.
    ENDTRY.
    IF rv_last_modified_rds < co_gen_date_time.
      rv_last_modified_rds = co_gen_date_time.
    ENDIF.
  endmethod.


  method IF_SADL_GW_MODEL_EXPOSURE_DATA~GET_MODEL_EXPOSURE.
    CONSTANTS: co_gen_timestamp TYPE timestamp VALUE '20230726205918'.
    DATA(lv_sadl_xml) =
               |<?xml version="1.0" encoding="utf-16"?>|  &
               |<sadl:definition xmlns:sadl="http://sap.com/sap.nw.f.sadl" syntaxVersion="" >|  &
               | <sadl:dataSource type="CDS" name="I_CURRENCY" binding="I_CURRENCY" />|  &
               | <sadl:dataSource type="CDS" name="SEPM_I_BUSINESSPARTNER" binding="SEPM_I_BUSINESSPARTNER" />|  &
               | <sadl:dataSource type="CDS" name="SEPM_I_PRODUCT_E" binding="SEPM_I_PRODUCT_E" />|  &
               | <sadl:dataSource type="CDS" name="ZEPMRA_ATP_VH" binding="ZEPMRA_ATP_VH" />|  &
               | <sadl:dataSource type="CDS" name="ZEPMRA_BILLSTATUS_VH" binding="ZEPMRA_BILLSTATUS_VH" />|  &
               | <sadl:dataSource type="CDS" name="ZEPMRA_C_SALESORDER" binding="ZEPMRA_C_SALESORDER" />|  &
               | <sadl:dataSource type="CDS" name="ZEPMRA_C_SALESORDER_ITEM" binding="ZEPMRA_C_SALESORDER_ITEM" />|  &
               | <sadl:dataSource type="CDS" name="ZEPMRA_DELIVERY_VH" binding="ZEPMRA_DELIVERY_VH" />|  &
               | <sadl:dataSource type="CDS" name="ZEPMRA_OVERRALSTATUS_VH" binding="ZEPMRA_OVERRALSTATUS_VH" />|  &
               | <sadl:dataSource type="CDS" name="ZEPMRA_PAYMENTERMS_VH" binding="ZEPMRA_PAYMENTERMS_VH" />|  &
               | <sadl:dataSource type="CDS" name="ZEPMRA_PAYMENTMTH_VH" binding="ZEPMRA_PAYMENTMTH_VH" />|  &
               | <sadl:dataSource type="CDS" name="ZEPMRA_PRODNAME_VH" binding="ZEPMRA_PRODNAME_VH" />|  &
               |<sadl:resultSet>|  &
               |<sadl:structure name="I_Currency" dataSource="I_CURRENCY" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="SEPM_I_BusinessPartner" dataSource="SEPM_I_BUSINESSPARTNER" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="SEPM_I_Product_E" dataSource="SEPM_I_PRODUCT_E" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="zepmra_atp_vh" dataSource="ZEPMRA_ATP_VH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="zepmra_billstatus_vh" dataSource="ZEPMRA_BILLSTATUS_VH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="zepmra_c_salesorder" dataSource="ZEPMRA_C_SALESORDER" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_BILLSTATUS" binding="_BILLSTATUS" target="zepmra_billstatus_vh" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_CURRENCY" binding="_CURRENCY" target="I_Currency" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_DELSTATUS" binding="_DELSTATUS" target="zepmra_delivery_vh" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_ITEM" binding="_ITEM" target="zepmra_c_salesorder_item" cardinality="zeroToMany" />|  &
               | <sadl:association name="TO_OVSTATUS" binding="_OVSTATUS" target="zepmra_overralstatus_vh" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_PARTNER" binding="_PARTNER" target="SEPM_I_BusinessPartner" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_PAYMETHOD" binding="_PAYMETHOD" target="zepmra_paymentmth_vh" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_PAYTERMS" binding="_PAYTERMS" target="zepmra_paymenterms_vh" cardinality="zeroToOne" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="zepmra_c_salesorder_item" dataSource="ZEPMRA_C_SALESORDER_ITEM" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>| .
      lv_sadl_xml = |{ lv_sadl_xml }| &
               | <sadl:association name="TO_ATP" binding="_ATP" target="zepmra_atp_vh" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_HEADER" binding="_HEADER" target="zepmra_c_salesorder" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_PDESC" binding="_PDESC" target="zepmra_prodname_vh" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_PRODUCT" binding="_PRODUCT" target="SEPM_I_Product_E" cardinality="zeroToOne" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="zepmra_delivery_vh" dataSource="ZEPMRA_DELIVERY_VH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="zepmra_overralstatus_vh" dataSource="ZEPMRA_OVERRALSTATUS_VH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="zepmra_paymenterms_vh" dataSource="ZEPMRA_PAYMENTERMS_VH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="zepmra_paymentmth_vh" dataSource="ZEPMRA_PAYMENTMTH_VH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="zepmra_prodname_vh" dataSource="ZEPMRA_PRODNAME_VH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |</sadl:resultSet>|  &
               |</sadl:definition>| .

   ro_model_exposure = cl_sadl_gw_model_exposure=>get_exposure_xml( iv_uuid      = CONV #( 'ZSEPMRA_SO_MAN' )
                                                                    iv_timestamp = co_gen_timestamp
                                                                    iv_sadl_xml  = lv_sadl_xml ).
  endmethod.
ENDCLASS.
