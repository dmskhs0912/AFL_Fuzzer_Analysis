Fuzzing Xpdf-3.02 (From Fuzzing101 - Exercise1)
===============================================
퍼징에 더 익숙해지고, AFL++ 사용 실습을 위해 Antonio Morales의 [Fuzzing101 저장소](https://github.com/antonio-morales/Fuzzing101)의 실습 예제를 풀어보도록 한다. Exercise1은 Xpdf 3.02에 존재하는 [CVE-2019-13288](https://knvd.krcert.or.kr/elkDetail.do?CVEID=CVE-2019-13288&jvn=&CVEID=CNNVD-201907-278&dilen=60c193c2dd82393915b13ec6) 취약점을 퍼징을 통해 분석하고 PoC까지 진행하는 것이다. 

## Download and build Xpdf-3.02 with afl-clang-fast
```bash
~/project/fuzzing_xpdf$ wget https://dl.xpdfreader.com/old/xpdf-3.02.tar.gz
~/project/fuzzing_xpdf$ tar -xvzf xpdf-3.02.tar.gz && cd xpdf-3.02
~/project/fuzzing_xpdf$ CC=~/AFLplusplus/afl-clang-fast CXX=~/AFLplusplus/afl-clang-fast++ ./configure –-prefix="$HOME/project/fuzzing_xpdf/install"
~/project/fuzzing_xpdf$ make
~/project/fuzzing_xpdf$ make install
```
위와 같이 CC와 CXX 환경 변수를 각각 afl-clang-fast, afl-clang-fast++로 바꾸고 configure 스크립트를 실행 후 make하면 퍼징을 위한 instrument 코드가 삽입된 프로그램이 빌드된다. 총 5개의 실행파일이 생성되는데, 이 중 취약점이 존재하는 파일은 pdftotext이다. 초기 테스트케이스 준비를 위해 인터넷에서 3개의 간단한 pdf 파일 샘플을 가져왔다
```bash
~/project/fuzzing_xpdf/pdf_samples$ wget https://github.com/mozilla/pdf.js-sample-files/raw/master/helloworld.pdf
~/project/fuzzing_xpdf/pdf_samples$ wget http://www.africau.edu/images/default/sample.pdf
~/project/fuzzing_xpdf/pdf_samples$ wget
```

## Fuzzing Xpdf-3.02
모든 준비가 끝났으니 퍼징을 해보자.
```bash
~/project/fuzzing_xpdf$ afl-fuzz -i ./pdf_samples -o ./output -- ./install/bin/pdftotext @@ ./output
```
위에서 다운로드한 pdf_samples 디렉토리의 파일을 초기 테스트케이스로 정해 퍼징을 시작한다. pdftotext의 usage는 

    Usage: pdftotext [options] <PDF-file> [<text-file>]
이므로 @@(입력 파일) 뒤에 출력될 텍스트 파일의 위치를 ./output으로 잡아주었다. 

![Result](./images/xpdf_result.png)

약 26분간 퍼징한 결과 2개의 saved crash가 발생했다. 여기서 saved crash는 AFL의 unique crash와 같은 개념이다. 
```
~/project/fuzzing_xpdf/output/default/crashes$ ls
README.txt
id:000000,sig:11,src:000000+000145,time:764817,execs:761380,op:splice,rep:8
id:000001,sig:11,src:001113,time:1352457,execs:1260033,op:havoc,rep:5
```
발생한 두 크래시는 sig 11로 Segmentation Fault가 발생한 크래시이다. 편의상 두 크래시의 이름을 각각 crash1, crash2로 변경한다.
```bash
~/project/fuzzing_xpdf/output/default/crashes$ mv id:000000,sig:11,src:000000+000145,time:764817,execs:761380,op:splice,rep:8 crash1
~/project/fuzzing_xpdf/output/default/crashes$ mv id:000001,sig:11,src:001113,time:1352457,execs:1260033,op:havoc,rep:5 crash1
```

## Reproduce Crashes
퍼징 결과로 얻은 2개의 크래시를 입력 파일로 사용해 Segmentation Fault가 발생하는지 확인해본다. 
* crash1
```bash
~/project/fuzzing_xpdf$ ./install/bin/pdftotext ./output/default/crashes/crash1 ./output
Error: PDF file is damaged - attempting to reconstruct xref table...
Segmentation fault(core dumped)
```
* crash2
```
~/project/fuzzing_xpdf$ ./install/bin/pdftotext ./output/default/crashes/crash2 ./output
Error: PDF file is damaged - attempting to reconstruct xref table...
Error (2992): Dictionary key must be a name object
Error (2994): Illegal character <c9> in hex string
Error (3026): Dictionary key must be a name object
Error (3060): Dictionary key must be a name object
... 중략(약 35만 개의 오류 메시지) ...
Error (3264): Dictionary key must be a name object
Error (3274): Dictionary key must be a name object
Error (2992): Dictionary key must be a name object
Segmentation fault(core dumped)
```
두 크래시 모두 Segmentation Fault를 발생하고 있다. 
