# MultipleServersExec
Bash Script to execute multiple commands in multiple servers at a time using SSH

**Execution format:** ./multiServerExec.sh Serversfile Commandfile

Note: 
1) Servers file contains list of servers, one server in each line.
2) Command file contains list of commands to be executed.
3) Script does not execute shutdown and Reboot commands on the server instead it will show warning ⚠.

# Usage

Below file contains **list of "Server Names/Server IP addresses"** on which we want the script to be executed.

![image](https://github.com/user-attachments/assets/75f72f3b-e112-4bd3-b0e2-d328174bf7a2)

Below file contains **list of commands** that needs to be executed on the servers.

![image](https://github.com/user-attachments/assets/899b4a4e-0098-4d8c-bd82-8d9ceabdfa91)

Script need to be executed in given format **" ./multiServerExec.sh Serversfile Commandfile "**, The output of the excution will be like below.

![image](https://github.com/user-attachments/assets/ff85f936-3d88-467c-b46d-6a1852d56cf4)


