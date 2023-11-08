#include <stdio.h>

ssize_t	ft_write(int fd, void const *buf, size_t nbyte);

int main() {
	ft_write(1, "hello\n", 6);
	return 0;
}
