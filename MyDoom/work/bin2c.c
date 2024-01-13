#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	FILE *f;
	int i, c;
	char *arr_name;

	if (argc < 2) {
		fprintf(stderr, "Usage: %s input_file [array_name] [> output_file]\n", argv[0]);
		return 1;
	}
	f = fopen(argv[1], "rb");
	if (f == NULL) {
		fprintf(stderr, "%s: fopen(%s) failed", argv[0], argv[1]);
		return 1;
	}
	if (argc >= 3) arr_name=argv[2]; else arr_name="filedata";

	printf("const unsigned char %s[] = {", arr_name);
	for (i=0;;i++) {
		if ((c = fgetc(f)) == EOF) break;
		if (i != 0) printf(",");
		if ((i % 12) == 0) printf("\n\t"); //else printf(" ");
		printf("0x%.2X", (unsigned char)c);
	}
	printf("\n};\n");
	fclose(f);
	return 0;
}
