Fuzzing libexif-0.6.14 (From Fuzzing101 - Exercise 2)
=======================================================

libexif는 디지털 카메라에서 이미지 파일에 사용하는 표준 메타 데이터 포맷인 EXIF(Exchangeable Image File Format) 데이터를 파싱, 편집 등의 기능을 갖고 있는 라이브러리이다. libexif에서 [CVE-2009-3895](https://knvd.krcert.or.kr/elkDetail.do?CVEID=CVE-2009-3895&jvn=&CVEID=CNNVD-200911-213&dilen=60c15fa1dd82393915ad3109) 취약점과, [CVE-2012-2836](https://knvd.krcert.or.kr/elkDetail.do?CVEID=CVE-2012-2836&jvn=&CVEID=CNNVD-201207-183&dilen=60c0642cdd82393915a39901) 취약점이 발견되었다. 퍼징을 통해 크래시를 찾고 분석해보자. 

## Find an interface application that makes use of the libexif library

우선 타겟인 libexif-0.6.14를 다운로드 후 afl-clang-lto를 이용해 빌드한다.
* Download and build libexif-0.6.14 with afl-clang-lto
```bash
$ mkdir ~/project/fuzzing_libexif && cd ~/project/fuzzing_libexif
$ wget https://github.com/libexif/libexif/archive/refs/tags/libexif-0_6_14-release.tar.gz
$ tar -xvzf libexif-0_6_14-release.tar.gz && cd libexif-libexif-0_6_14-release/
$ autoreconf -fvi
$ CC=afl-clang-lto ./configure --enable-shared=no --prefix="$HOME/project/fuzzing_libexif/install/"
$ make
$ make install
```
libexif는 라이브러리이기 때문에 libexif를 사용하는 프로그램을 찾아서 빌드해야한다. libexif의 JPEG 파일의 EXIF 정보를 보여주는 cli 프로그램인 exif 0.6.15 버전을 사용한다. 
* Download and build exif-0.6.15 whit afl-clang-lto
```bash
$ wget https://github.com/libexif/exif/archive/refs/tags/exif-0_6_15-release.tar.gz
$ tar -xvzf exif-0_6_15-release.tar.gz && cd exif-exif-0_6_15-release/
$ autoreconf -fvi
$ CC=afl-clang-lto ./configure --enable-shared=no --prefix="$HOME/project/fuzzing_libexif/install/" PKG_CONFIG_PATH=$HOME/project/fuzzing_libexif/install/lib/pkgconfig
$ make
$ make install
```

## Seed corpus creation
초기 테스트 케이스 준비를 위해 간단한 exif 샘플을 다운로드한다. 
```bash
$ cd ~/project/fuzzing_libexif
$ wget https://github.com/ianare/exif-samples/archive/refs/heads/master.zip
$ unzip master.zip
```
샘플을 이용해 exif가 잘 작동하는지 확인해본다.

    $ ./install/bin/exif exif-samples-master/jpg/Canon_400.jpg

![Sample](./images/libexif_sample.png)

샘플 이미지에 있는 숨겨진 EXIF 메타 데이터 정보를 확인할 수 있다. 

## Fuzz
모든 준비가 끝났으니 퍼징을 해본다. 
```bash
$ afl-fuzz -i exif-samples-master/jpg/ -o ./output -s 123 -- ./install/bin/exif @@
```

![Result1](./images/libexif_result.png)
















![Result2](./images/libexif_result2.png)

약 1시간 4분 퍼징한 결과 41개의 saved crash가 발생했다. 모두 sig 11로 Segmentation Fault를 발생하는 크래시이다. 

## Reproduce crashes
41개의 크래시에 대해 모두 reproduce 해본다. exif_fuzz는 위에서 빌드한 exif의 복사본이다. 
```bash
for file in $HOME/project/fuzzing_libexif/output/default/crashes/*;
do
    $HOME/project/fuzzing_libexif/exif_fuzz $file
done
```
위 쉘 스크립트를 실행해보면, 
> ./reproduce.sh: 줄 3: 999884 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999885 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999886 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999887 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999888 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999889 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999890 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999891 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999892 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999893 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999894 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999895 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999896 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999897 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999898 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999899 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999900 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999901 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999902 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999903 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999904 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999905 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999906 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999907 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999908 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999909 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999910 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999911 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999912 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999913 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999914 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999915 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999916 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999917 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999918 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999919 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999920 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999921 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999922 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999923 세그멘테이션 오류 ./exif_fuzz $file
./reproduce.sh: 줄 3: 999924 세그멘테이션 오류 ./exif_fuzz $file

모든 크래시에 대해 Segmentation Fault가 발생했음을 확인할 수 있다.  프로그램을 ASAN을 이용해 빌드하고 다시 reproduce함으로써 어디서 크래시가 터졌는지 확인해보자. 
* Build the programs with ASAN
```bash
$ rm -r ~/project/fuzzing_libexif/install
$ cd ~/project/fuzzing_libexif/libexif-libexif-0_6_14-release/
$ make clean
$ CC="clang -fsanitize=address" ./configure --enable-shared=no --prefix="$HOME/project/fuzzing_libexif/install"
$ make
$ make install
$ cd ../exif-exif-0_6_15-release/
$ make clean
$ CC="clang -fsanitize=address" ./configure --enable-shared=no --prefix="$HOME/project/fuzzing_libexif/install" PKG_CONFIG_PATH=$HOME/project/fuzzing_libexif/install/lib/pkgconfig
$ make
$ make install
$ cp ../install/bin/exif ../exif_asan
```
id:000020 크래시를 targetcrash로 rename하고 reproduce 해본다.
* Reproduce the target crash
```bash
$ cp ~/project/fuzzing_libexif/output/default/crahses/id:000020~~~ ~/project/fuzzing_libexif/targetcrash
$ ~/project/fuzzing_libexif/exif_asan ~/project/fuzzing_libexif/targetcrash
```

![ASAN](./images/libexif_asan.png)

exif-utils.c의 exif_get_slong에서 heap-based buffer overflow가 발생했음을 확인할 수 있다. 

## Triage
