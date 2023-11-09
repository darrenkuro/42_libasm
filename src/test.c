#include <stdio.h>
#include <errno.h>		// errno
#include <string.h>		// strerrno

ssize_t	ft_write(int fd, void const *buf, size_t nbyte);

int main() {
	ft_write(1, "hello\n", 6);
	printf("errno: %d, msg: %s\n", errno, strerror(errno));
	return 0;
}
