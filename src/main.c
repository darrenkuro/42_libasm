#include <stdio.h>		// ssize_t, size_t, printf
#include <errno.h>		// errno
#include <string.h>		// strerrno

// Functions
ssize_t	ft_read(inf fd, void *buf, size_t count);
ssize_t	ft_write(int fd, void const *buf, size_t count);
int		ft_strcmp(char const *s1, char const *s2);
size_t	ft_strlen(char const *s);
char	*ft_strcpy(char *dest, char const *src);
char	*ft_strdup(char const *s);

int main() {
	ft_write(1, "hello\n", 6);
	printf("errno: %d, msg: %s\n", errno, strerror(errno));
	return 0;
}
