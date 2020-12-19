mysql> show slave status\G
 
*************************** 1. row ***************************
 
               Slave_IO_State: Waiting for master to send event
 
                  Master_Host: 192.168.10.70
 
                  Master_User: cmon_replication
 
                  Master_Port: 3306
 
                Connect_Retry: 10
 
              Master_Log_File: binlog.000038
 
          Read_Master_Log_Pos: 826608419
 
               Relay_Log_File: relay-bin.000004
 
                Relay_Log_Pos: 468413927
 
        Relay_Master_Log_File: binlog.000038
 
             Slave_IO_Running: Yes
 
            Slave_SQL_Running: Yes
 
              Replicate_Do_DB: 
 
          Replicate_Ignore_DB: 
 
           Replicate_Do_Table: 
 
       Replicate_Ignore_Table: 
 
      Replicate_Wild_Do_Table: 
 
  Replicate_Wild_Ignore_Table: 
 
                   Last_Errno: 0
 
                   Last_Error: 
 
                 Skip_Counter: 0
 
          Exec_Master_Log_Pos: 826608206
 
              Relay_Log_Space: 826607743
 
              Until_Condition: None
 
               Until_Log_File: 
 
                Until_Log_Pos: 0
 
           Master_SSL_Allowed: No
 
           Master_SSL_CA_File: 
 
           Master_SSL_CA_Path: 
 
              Master_SSL_Cert: 
 
            Master_SSL_Cipher: 
 
               Master_SSL_Key: 
 
        Seconds_Behind_Master: 251: "Sara"
 
Master_SSL_Verify_Server_Cert: No
 
                Last_IO_Errno: 0
 
                Last_IO_Error: 
 
               Last_SQL_Errno: 0
 
               Last_SQL_Error: 
 
  Replicate_Ignore_Server_Ids: 
 
             Master_Server_Id: 45003
 
                  Master_UUID: 36272880-a7b0-11e9-9ca6-525400cae48b
 
             Master_Info_File: mysql.slave_master_info
 
                    SQL_Delay: 0
 
          SQL_Remaining_Delay: NULL
 
      Slave_SQL_Running_State: copy to tmp table
 
           Master_Retry_Count: 86400
 
                  Master_Bind: 
 
      Last_IO_Error_Timestamp: 
 
     Last_SQL_Error_Timestamp: 
 
               Master_SSL_Crl: 
 
           Master_SSL_Crlpath: 
 
           Retrieved_Gtid_Set: 36272880-a7b0-11e9-9ca6-525400cae48b:7631-9192
 
            Executed_Gtid_Set: 36272880-a7b0-11e9-9ca6-525400cae48b:1-9191,
 
864dd532-a7af-11e9-85f2-525400cae48b:1-173,
 
df68c807-a7af-11e9-9b56-525400cae48b:1-4
 
                Auto_Position: 1
 
         Replicate_Rewrite_DB: 
 
                 Channel_Name: 
 
           Master_TLS_Version: 
 
1 row in set (0.00 sec)
