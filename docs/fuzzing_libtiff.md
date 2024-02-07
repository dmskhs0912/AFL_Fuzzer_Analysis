Fuzzing LibTIFF-4.0.4 (From Fuzzing101 - Exercise4)
==============================================
LibTIFF는 TIFF(Tagged Image File Format) 파일 포맷을 처리하는 라이브러리이다. TIFF는 복잡한 이미지 데이터를 저장하기 위한 포맷으로 여러 곳에서 널리 사용되고 있다. LibTIFF 4.0.4 버전에서 발견된 [CVE-2016-9297](https://knvd.krcert.or.kr/elkDetail.do?CVEID=CVE-2016-9297&jvn=&CVEID=CNNVD-201611-578&dilen=60c172d0dd82393915af6922) 취약점을 퍼징을 통해 분석하고 보완해보자. 

## Download and build the target
* Download and uncompress LibTIFF-4.0.4
```bash
$ mkdir $HOME/project/fuzzing_libtiff && cd $HOME/project/fuzzing_libtiff
$ wget https://download.osgeo.org/libtiff/tiff-4.0.4.tar.gz
$ tar -xvzf tiff-4.0.4.tar.gz
```
우선 instrumentation 코드를 삽입하지 않고 빌드 및 설치해 original 실행 파일을 복사해둔다.

* Build and install LibTIFF-4.0.4 without instrumentation
```bash
$ cd tiff-4.0.4
$ ./configure --prefix="$HOME/project/fuzzing_libtiff/install" --disable-shared
$ make
$ make install
$ cp $HOME/project/fuzzing_libtiff/install/bin/tiffinfo $HOME/project/fuzzing_libtiff/tiffinfo_original
```

## Code Coverage
이번 Exercise에서는 LCOV라는 소프트웨어를 사용해 Code coverage 데이터를 수집하고 이를 퍼징에 이용해 퍼징 효율을 높여볼 것이다. 우선 LCOV 패키지를 설치한다.

* Install LCOV
```bash
$ sudo apt update
$ sudo apt install lcov
```
이제 LibTIFF를 --coverage 플래그를 추가해 다시 빌드한다. --coverage 플래그를 추가해야 Code coverage 정보를 수집하기 위한 instrumentation이 삽입된다. 

* Rebuild and install LibTIFF-4.0.4 with '--coverage' flag
```bash
$ cd $HOME/project/fuzzing_libtiff
$ rm -r install
$ cd tiff-4.0.4
$ make clean
$ CFLAGS="--coverage" LDFAGS="--coverage" ./configure --prefix="$HOME/project/fuzzing_libtiff/install" --disable-shared
$ make
$ make install
$ cp ../install/bin/tiffinfo ../tiffinfo_lcov
```
LCOV를 이용해 Code coverage 정보를 수집하고 이를 html 파일로 생성해 시각적으로 확인할 수 있다. 

* Collect the code coverage data and generate html output
```bash
$ lcov --zerocounters --directory ./
$ lcov --capture --initial --directory ./ --output-file app.info
$ ../tiffinfo_lcov -D -j -c -r -s -w ./test/images/palette-1c-1b.tiff
$ lcov --no-checksum --directory ./ --capture --output-file app2.info
$ genhtml --highlight --legend -output-directory ./html-coverage ./app2.info
```
각 명령어 라인별로 수행하는 일은 다음과 같다.
1. lcov --zerocounters --directory ./ : 현재 디렉토리의 커버리지 카운터를 0으로 초기화한다. 이전 실행에서 수집된 데이터를 초기화하는 명령어이다.
2. lcov --capture --initial --directory ./ --output-file app.info : 초기 커버리지 데이터를 캡쳐해 app.info 파일에 저장한다. 프로그램 실행 전의 커버리지 상태를 캡쳐해 실행 이후 데이터와 비교하기 위한 기준으로 사용된다. 
3. ../tiffinfo_lcov -D -j -c -r -s -w ./test/images/palette-1c-1b.tiff : 커버리지를 분석할 프로그램을 실행한다. 사용된 옵션들은 커버리지를 높이기 위해 사용되었다. 옵션에 대한 자세한 내용은 -h 옵션을 통해 확인할 수 있다.
4. lcov --no-checksum --directory ./ --capture --output-file app2.info : 체크섬 검사를 비활성화해 처리 속도를 높이고 수집된 커버리지 데이터를 app2.info 파일에 저장한다.
5. genhtml --highlight --legend -output-directory ./html-coverage ./app2.info : app2.info에 캡쳐된 커버리지 데이터를 바탕으로 html-coverage 디렉토리에 Code coverage report를 html 파일로 생성한다. --highlight와 --legend 옵션은 색상 강조, 범례를 추가해 더 보기 좋은 report를 생성한다.

위 작업을 통해 생성된 html 파일을 열면 다음과 같이 Code coverage를 확인할 수 있다. 

![Report](./images/libtiff_report.png)

html 파일에서 디렉토리, 파일 등을 클릭해 각 라인이 실행되었는지 확인할 수 있다. 

## Instrumentation
실제 퍼징을 위해 LibTIFF를 AFL, ASAN을 이용해 다시 빌드한다.

* Rebuild LibTIFF-4.0.4 with afl-clang-lto and ASAN
```bash
$ rm -r ../install
$ make clean
$ AFL_USE_ASAN=1 CC=afl-clang-lto ./configure --prefix="$HOME/project/fuzzing_libtiff/install" --disable-shared
$ AFL_USE_ASAN=1 make -j4
$ AFL_USE_ASAN=1 make install
```
make에 -j4 옵션은 4개의 코어를 사용해 빌드하도록 하는 옵션이다. 기본적으로 make는 한 개의 코어만 사용하기 때문에 빌드 가속화를 위해 -j4 옵션으로 독립적인 컴파일 작업을 4개의 코어에서 병렬적으로 수행하도록 한다. 

