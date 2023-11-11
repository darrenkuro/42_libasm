#include <errno.h>  // errno
#include <stdio.h>  // ssize_t, size_t, printf
#include <string.h> // strerrno

// Functions
ssize_t ft_read(int fd, void *buf, size_t count);
ssize_t ft_write(int fd, void const *buf, size_t count);
int ft_strcmp(char const *_Nonnull s1, char const *_Nonnull s2);
size_t ft_strlen(char const *_Nonnull s);
char *ft_strcpy(char *_Nonnull dest, char const *_Nonnull src);
char *ft_strdup(char const *_Nonnull s);

int main() {
    ft_write(1, "hello\n", 6);
    printf("errno: %d, msg: %s\n", errno, strerror(errno));
    printf("%d\n", ft_strcmp("abc", "abcd"));
    printf("%d\n", strcmp("abc", "abcd"));
    printf("%zu\n", ft_strlen("abc"));
    // char dest[4];
    char *test = "abc";
    char *dup = ft_strdup(test);
    printf("%s\n", dup);
    return 0;
}
