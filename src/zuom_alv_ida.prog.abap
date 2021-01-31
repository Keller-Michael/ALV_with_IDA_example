*&---------------------------------------------------------------------*
*& Report zuom_alv_ida
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuom_alv_ida.

DATA gs_uom_texts TYPE t006a.

SELECT-OPTIONS so_uom FOR gs_uom_texts-msehi.
SELECT-OPTIONS so_langu FOR gs_uom_texts-spras.

START-OF-SELECTION.
  DATA(go_uom_alv_ida) = zcl_uom_alv_ida=>get_instance(
                                            it_uom_selection      = so_uom[]
                                            it_language_selection = so_langu[] ).

  go_uom_alv_ida->display( ).
