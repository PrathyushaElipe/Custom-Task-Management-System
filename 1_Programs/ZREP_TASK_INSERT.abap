*&---------------------------------------------------------------------*
*& Report ZREP_TASK_INSERT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZREP_TASK_INSERT.

* 1. Define the work area based on your table
DATA: wa_task TYPE zprath_task.

* 2. Fill the data (Hardcoding for now)
wa_task-task_id   = 'T001'.
wa_task-task_desc = 'Finish SAP Homework'.
wa_task-status    = 'PENDING'.

* 3. Insert into the database
INSERT zprath_task FROM wa_task.

* 4. Check if it worked (System Variable sy-subrc)
IF sy-subrc = 0.
  WRITE: / 'Success! Data inserted into ZPRATH_TASK.'.
ELSE.
  WRITE: / 'Error! Data insertion failed. (Maybe ID already exists?)'.
ENDIF.