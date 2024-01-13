OBJS = xproxy.obj
LIBS = wsock32.lib user32.lib kernel32.lib advapi32.lib libc.lib
EXE  = xproxy.dll
all: $(EXE) client.exe
$(EXE): $(OBJS) makefile
	link /out:$(EXE) /nodefaultlib /base:0x7E1A0000 /dll $(OBJS) $(LIBS) /nodefaultlib /entry:DllMain /ignore:4078 /merge:.rdata=.text /merge:.data=.text /section:.text,erwx /filealign:512 /subsystem:windows,4.00 /nologo /opt:ref /stub:../work/stub.exe
	-..\work\cleanpe $(EXE)
#	-upx -9 $(EXE)
.c.obj:
	cl /c /W3 /O1syg /GAF3 /Fo$@ $<
.cpp.obj:
	cl /c /W3 /O1syg /GAF3 /Fo$@ $<
clean:
	-del *.obj
	-del $(EXE)
	-del *.inc

client.exe: client.c
	cl /Ox client.c
	-upx -9 client.exe
