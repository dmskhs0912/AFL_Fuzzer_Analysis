#include <stdio.h>
#include <unistd.h> // execve를 위한 헤더 파일

int main() {
    char* binsh[] = {"/bin/sh", NULL}; // NULL 사용
    execve(binsh[0], binsh, NULL); // 환경 변수 배열에 NULL 사용
}

