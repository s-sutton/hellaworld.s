.global _start
.intel_syntax noprefix
/* noprefix essentially fixes the issue of % and # and all of the annoying bits of gasm, I think? */

_start:
/* writes by using syscall 1 */
mov eax, 1
/* defines the file to write to, under UNIX philosophy where everything is a file, stdout is file 1 */
mov edi, 1
/* loads the effective address of the buffer into the source index */
lea esi, [buffer_2]
/* defines the length of the buffer */
mov edx, 12 
syscall

/* exits by using syscall 60, also passes the value 20 as the return code through the edi */
mov eax, 60
mov edi, 20
syscall

/* Should define buffer_2 data as ASCII string zero delimited */
buffer_2:
.asciz "Hella\n"
