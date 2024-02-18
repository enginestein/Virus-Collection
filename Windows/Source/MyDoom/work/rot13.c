#include <stdio.h>
#include <string.h>

char rot13c(char c)
{
	char u[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	char l[] = "abcdefghijklmnopqrstuvwxyz";
	char *p;

	if ((p = strchr(u, c)) != NULL)
		return u[((p-u) + 13) % 26];
	else if ((p = strchr(l, c)) != NULL)
		return l[((p-l) + 13) % 26];
	else
		return c;
}

void main(void)
{
	int c;
	while ((c = getchar()) != EOF)
		putchar(rot13c(c));
}
