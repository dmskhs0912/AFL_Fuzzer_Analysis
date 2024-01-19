#!/usr/bin/env python3
from pwn import *

# context를 통해 대상 아키텍처와 OS를 설정합니다.

# 아키텍처와 OS를 설정
context.arch = 'amd64'
context.os = 'linux'

# 쉘코드 생성
shellcode = shellcraft.sh()

# 어셈블리 코드 출력 (선택 사항)
print("Shellcode (Assembly):")
print(shellcode)

# 기계어 코드로 컴파일
binary_shellcode = asm(shellcode)

# 기계어 코드 출력
print("\nShellcode (Binary):")
print(enhex(binary_shellcode))

print(len(binary_shellcode))

