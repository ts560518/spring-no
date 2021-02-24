# github를 사용해서 프로젝트 협업하기
## 프로젝트 협업 준비하기
1. github에서프로젝트 복제하기
  - cmd창을 연다.
  - 워크스페이스가 있는 폴더로 이동한다.
  - github의 프로젝트를 내 컴퓨터로 복제한다.
  - git clone https://github.com/팀장계정명/프로젝트명.git
2. 복제된 프로젝트를 이클립스로 가져오기
  - 이클립스를 연다.
  - 워크스페이스에 복제된 프로젝트를 임포트한다.
  - import -> maven -> Existing Maven Projects -> 복제된 프로젝트가 있는 폴더 선택
	  -> projects창에 표시된 pom.xml을 선택하고 Finish버튼 클릭
	  
## 프로젝트 진행하기
1. 현재 작업중인 브랜치를 확인한다.
	- 프로젝트명 [프로젝트명 master]인지 확인한다.
2. github에서 최신 소스를 내려받는다.
	- Team -> Pull를 선택해서 github에서 모든 조원들의 소스코드가 병합된 것을 내려받는다.
3. 새로운 브랜치를 생성해서 작업하기(반드시 반드시 반드시 반드시 반드시) 
	- Team -> Switch To -> New Branch 선택 -> 브랜치명을 입력한다.
		* 최신 소스를 기반으로 자신의 작업영역을 생성하는 것임
4. 현재 작업중인 브랜치 확인한다.
	- 프로젝트명 [프로젝트명 eungsu-2-24]인지 확인한다.
		* 현재 적업중인 브랜치명이 master이면 죽인다.
5. 작업이 완료된 소스코드를 github에 저장하기
	1. Team -> Commit 선택
	2. 작업이 완료된 파일은 Unstaged 영역에서 staged 영역으로 옮긴다.
	3. Commit 메세지 작성(작업내용에 대한 간단한 설명)
	4. Commit and Push 버튼을 클릭한다.
6. 소스코드 병합을 위한 Pull Request 작성하기	
	1. github 접속하기
	2. 소스코드를 Push한 브랜치로 변경하기
	3. Create Pull Reqeust를 클릭해서 작성하기
	
	