#!/usr/bin/env python3
from pwn import *

# context를 통해 대상 아키텍처와 OS를 설정합니다.
context(arch='x86_64', os='linux')

# asm 함수를 사용하여 어셈블리 코드를 기계어 코드(쉘코드)로 변환합니다.
shellcode_bytes = asm(shellcraft.sh())
shellcode_str = ''.join('{:02x}'.format(b) for b in shellcode_bytes)
print(shellcode_bytes)
print(shellcode_str)

