# azure-lb-demo

Azure LB 생성 순서 

1. Resource Group 생성
2. VNET, Subnet 생성
3. LB Public IP 생성
4. LB 생성 (LB, LB Rule, Health Probe)
5. Network Security Group 생성
6. NIC 생성(VM1, VM2를 위해 2개 생성)
7. NIC과 NSG(Network Security Group)연결
8. NIC과 LB Backendpool에 연결
9. NIC과 LB NAT Rule 연결
10. RSA Key생성(ssh-keygen 명령어)
11. 사용자 데이터 부분에서 실행할 스트립트 생성(web.sh)
12. Storage Account 생성(Diagnostic log 저장용)
13. Availability Set 생성(LB에 VM을 연결하려면, VM들은 반드시 AS설정 필요!)
14. VM1, VM2 생성

# Resource Group 생성
Azure Resource 그룹 생성시에 Region 설정 필요
Azure CLI에서 아래 명령어로 Region Code확인 가능 
### az account list-locations

# 리소스 생성
확장자 *.tf 파일을 작성 후    
```
terraform init
terraform plan
terraform apply
```
를 순서대로 진행

# SSH RSA Key 생성
리눅스 서버로 SSH 접속을 위해서는 1)"계정/패스워드"로 접속하거나, 2)"계정/SSH RSA Key"로 접속해야 하는데, 
RSA키는 아래 명령어로 생성 가능 <br>
```
ssh-keygen
```
ssh-keygen을 실행하면 아래 두 파일이 생성됨 <br>

개인키 : id_rsa <br>
공개키 : id_rsa.pub <br>

```
david@user30-admin:~$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/david/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/david/.ssh/id_rsa
Your public key has been saved in /home/david/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:Y1vHochgw+sP6pXiCGBRsFWqZLiB0rFod/5Unv21+YE david@user30-admin
The key's randomart image is:
+---[RSA 3072]----+
| .oo..           |
|oo+o..           |
|**oo .=  .  .    |
|=o+ o. =o.oo .   |
|oo   ...Soo.o  . |
|o    .oo + .. o o|
|.   . =..    E + |
| . o + o        o|
|  ..+   .       .|
+----[SHA256]-----+
```

# 서버 접속 
VM 생성 후 서버 접속은 NAT Rule에 설정한 것처럼 부하분산장치의 공인IP주소와 NAT설정된 포트로 접속하면됩니다. <br>
ssh -i <RSA파일> 사용자명@IP주소 -p 포트주소 <br>

```
ssh -i ~/.ssh/id_rsa myadmin@IP -p 50001 
```

예를 들어 부하분산 장치에 연결된 서버의 NAT Rule이 아래와 같다면  
<img src="https://github.com/lormadus/azure-lb-demo/blob/master/img/lb_natrule.png" width=1000>

# 최종 결과물 확인
부하 분상장치의 공인IP주소를 웹 브라우저에서 확인해 보시면 됩니다.
