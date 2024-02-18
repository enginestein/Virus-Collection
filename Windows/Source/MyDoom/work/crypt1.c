#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	FILE *f1=fopen(argv[1],"rb"), *f2=fopen(argv[2],"wb");
	char buf1[8096], buf2[8096];
	unsigned char k;
	int c, i;
	setvbuf(f1, buf1, _IOFBF, sizeof(buf1));
	setvbuf(f2, buf2, _IOFBF, sizeof(buf2));
	for (k=0xC7,i=0;;) {
		if ((c = fgetc(f1)) == EOF) break;
		fputc(((unsigned char)c) ^ k, f2);
		k = (k + 3 * (i % 133)) & 0xFF;
		i++;
	}
	fclose(f2);
	fclose(f1);
}
