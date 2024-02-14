Fuzzing LibXML2-2.9.4 (From Fuzzing101 - Exercise5)
===================================================
LibXML2는 XML 문서를 파싱하고 조작하는 C 언어 라이브러리이다. LibXML2의 2.9.4 버전에서 [CVE-2017-9048](https://knvd.krcert.or.kr/elkDetail.do?CVEID=CVE-2017-9048&jvn=&CVEID=CNNVD-201705-873&dilen=60c07b30dd82393915a825e4) 취약점이 발견되었다. 퍼징을 통해 취약점을 분석하고 보완해보자. 

## Custom Dictionaries
복잡한 텍스트 기반 파일 포맷을 퍼징할 때는 기본적인 syntax 토큰이 포함된 딕셔너리를 퍼저에게 제공하는 것이 효율적이다. AFL에 Custom dictionary를 제공하면 AFL은 이를 기반으로 입력 값에 변화를 준다. 이 때 AFL이 수행하는 변화는 크게 두 가지가 있다.
- Override : n이 딕셔너리 엔트리의 크기일 때, 입력 값의 특정 부분을 n개의 byte 수로 바꾼다.
- Insert : 현재 파일 위치에 딕셔너리 엔트리를 삽입하고 모든 문자를 n만큼 내리고 파일의 크기를 늘린다. 

AFL++ 깃허브에서 여러 Dictionary 샘플들을 얻을 수 있다. XML 딕셔너리 샘플은 [이곳](https://github.com/AFLplusplus/AFLplusplus/blob/stable/dictionaries/xml.dict)에서 확인할 수 있다.

## Paralellization
AFL은 기본적으로 한 개의 코어를 할당해 퍼징한다. 멀티 코어 시스템의 경우 다음과 같은 방법으로 병렬 처리를 진행할 수 있다. 
- Independent instances : 단순하게 여러 터미널 창을 열어 각 터미널마다 따로 퍼징을 진행하는 것이다. output 폴더의 이름을 각각 다르게 설정해야 한다. CPU의 코어 수만큼 퍼징 작업을 진행할 수 있다. 만약 -s 옵션으로 퍼징 시드를 설정한 경우, 각 작업마다 다른 시드를 제공해야 병렬 처리 효과를 볼 수 있다.
- Shared instances : Master instance와 Slave instance를 설정해 각 퍼징 인스턴스가 다른 인스턴스의 테스트 케이스를 모아 퍼징하는 방식이다. Independent instances 방식보다 효과적인 병렬 처리 방식이다. 퍼징 옵션에 -M Master, -S Slave1, 2, 3, ... 등을 추가해 사용한다. 

## Download and build the target
* Download LibXML2-2.9.4
```bash
$ mkdir $HOME/project/fuzzing_libxml2 && cd $HOME/project/fuzzing_libxml2
$ wget http://xmlsoft.org/download/libxml2-2.9.4.tar.gz
$ tar -xvzf libxml2-2.9.4.tar.gz
```
