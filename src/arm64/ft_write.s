.text
.global _ft_write
.extern _error

_ft_write:         // x0, x1, x2 for parameters
    mov x16, #4    // x8 is used for syscall number, 64 for 'write' on ARM64
    svc 0x80       // Make the system call
    cmp x0, #0     // Compare the result in x0 with 0
    ret            // Return from function
