#!/bin/bash

#Ubuntu 사용하시는 경우
apt-get update –y
apt-get install apache2 -y

#CentOS, RHEL 사용하시는 경우
#yum update -y 
#yum install apache2 -y

## CDN 설정
## Azure 에서 CDN을 사용하는 경우 일반적으로 Azure blob을 사용합니다.
## Azure Blob에 Container 를 생성하시고 해당 컨테이너의 접근 권한을 Blob 혹은 Container 로 설정하셔야 외부에서
## 해당 컨테이너 내의 파일에 접근하실 수 있습니다.
## 컨테이너에 파일을 업로드 하신 후, CDN 을 생성하시고 엔드포인트의 종류를 "스토리지" -> "생성한 스토리지 선택"
## 경로는 비워두셔도 됩니다.
## 일정 시간이 지난 후에 파일 호출 후 CDN에 파일들이 캐싱이 되면 URL을 아래와 같이 수정해서 사용하시면됩니다.

