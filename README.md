# azure-lb-demo

Azure LB 생성 순서 

1. Resource Group 생성
2. VNET, Subnet 생성
3. LB Public IP 생성
4. LB 생성 (LB, LB Rule, Health Probe)
5. Network Security Group 생성
6. NIC 생성(VM1, VM2를 위해 2개 생성) 
   NIC과 NSG(Network Security Group)연결
   NIC과 LB Backendpool에 연결
   NIC과 LB NAT Rule 연결
7. RSA Key생성(ssh-keygen 명령어)
8. 사용자 데이터 부분에서 실행할 스트립트 생성(web.sh)
9. VM1, VM2 
