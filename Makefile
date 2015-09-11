# Détermination du nombre de processeurs
CPU_CORES=`cat /proc/cpuinfo | grep -m1 "cpu cores" | sed s/".*: "//`
# La commande d'appel à lilypond
LILY_CMD = lilypond #-ddelete-intermediate-files \
                    #-dno-point-and-click -djob-count=$(CPU_CORES)

# Les suffixes utilisés dans ce Makefile
.SUFFIXES: .ly .ily .pdf .midi

# Les fichiers sources et résultants sont recherchés dans les répertoires
# listés dans la variable VPATH.  Ceux-ci sont tous des sous-répertoires
# du répertoire courant (fourni par la variable de GNU make `CURDIR').
VPATH = \
  $(CURDIR)/Partitions \
  $(CURDIR)/PDF \
  $(CURDIR)/MIDI

# La règle type pour créer un PDF et un MIDI à partir d'un fichier
# source LY.
# Les .pdf résultants iront dans le sous-répertoire "PDF" et les fichiers
# .midi dans le sous-répertoire "MIDI".
%.pdf %.midi: %.ly
	$(LILY_CMD) $<; \
	if test -f "$*.pdf"; then \
		mv "$*.pdf" PDF/; \
	fi; \
	if test -f "$*.midi"; then \
		mv "$*.midi" MIDI/; \
	fi


all: weezer.pdf
