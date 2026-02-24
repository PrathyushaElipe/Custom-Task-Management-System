*&---------------------------------------------------------------------*
*& Report ZREP_TASK_MONITOR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZREP_TASK_MONITOR.

TABLES: zprath_task. "Required to let the screen know which table we are talking about

" Create a box where the user can enter a range of IDs
SELECT-OPTIONS: s_id FOR zprath_task-task_id.

* 1. Internal Table Declaration
* This table holds the data in the program's memory
DATA: lt_task TYPE TABLE OF zprath_task.

" WHERE clause filters the data based on what the user typed in s_id
SELECT * FROM zprath_task
  INTO TABLE lt_task
  WHERE task_id IN s_id.

* 3. Displaying the Data (Function Module)
* We call a standard SAP tool to draw the grid for us
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_structure_name = 'ZPRATH_TASK'  " IMPORTANT: Must be in ALL CAPS
  TABLES
    t_outtab         = lt_task         " This passes your data to the grid
  EXCEPTIONS
    program_error    = 1
    OTHERS           = 2.