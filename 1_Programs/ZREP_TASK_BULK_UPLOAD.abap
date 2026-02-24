*&---------------------------------------------------------------------*
*& Report ZREP_TASK_BULK_UPLOAD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZREP_TASK_BULK_UPLOAD.
* Define Internal Table and Work Area
DATA: lt_task TYPE TABLE OF zprath_task,
      wa_task TYPE zprath_task.

* Fill Row 1
wa_task-task_id   = 'T001'.
wa_task-task_desc = 'Setup SAP Server'.
wa_task-status    = 'DONE'.
APPEND wa_task TO lt_task. "Moves row to the internal table

* Fill Row 2
wa_task-task_id   = 'T002'.
wa_task-task_desc = 'Create Data Dictionary'.
wa_task-status    = 'DONE'.
APPEND wa_task TO lt_task.

* Fill Row 3 (Add one more on your own here!)

* Bulk Insert
INSERT zprath_task FROM TABLE lt_task.

IF sy-subrc = 0.
  WRITE: 'Bulk Insert Successful!'.
ELSE.
  WRITE: 'Error in Bulk Insert.'.
ENDIF.