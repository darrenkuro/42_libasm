.section .text
.global ft_write
.extern __errno_location

ft_write:          // x0, x1, x2 for parameters
    mov x8, #64    // x8 is used for syscall number, 64 for 'write' on ARM64
    svc 0          // Make the system call
    cmp x0, #0     // Compare the result in x0 with 0
    b.lt errno     // If result is negative (less than zero), branch to errno
    ret            // Return from function

errno:
    neg x0, x0           // Get the positive error number
    str x0, [sp, #-16]!  // Push the error number onto the stack (pre-indexed)
    bl __errno_location  // Call '__errno_location' to get the errno address
    ldr x1, [sp], #16    // Pop the error number from the stack into x1 (post-indexed)
    str x1, [x0]         // Store the error number at the location given by x0
    mov x0, #-1          // Set the return value to -1
    ret                  // Return from function
