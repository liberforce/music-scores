# Détermination du nombre de processeurs
CPU_CORES=`cat /proc/cpuinfo | grep -m1 "cpu cores" | sed s/".*: "//`
# La commande d'appel à lilypond
LILY_CMD = lilypond #-ddelete-intermediate-files \
                    #-dno-point-and-click -djob-count=$(CPU_CORES)

# Les suffixes utilisés dans ce Makefile
.SUFFIXES: .ly .ily .pdf .midi

PARTS_DIR = Partitions
MIDI_DIR  = MIDI
PDF_DIR   = PDF

sources := $(wildcard $(PARTS_DIR)/*.ly)
pdfs    := $(patsubst $(PARTS_DIR), $(PDF_DIR), $(sources))
pdfs    := $(patsubst %.ly, %.pdf, $(pdfs))
midis   := $(patsubst $(PARTS_DIR), $(MIDI_DIR), $(sources))
midis   := $(patsubst %.ly, %.midi, $(midis))

%.pdf %.midi: %.ly
	$(LILY_CMD) $<; \
	if test -f "$*.pdf"; then \
		mv "$*.pdf" $(PDF_DIR); \
	fi; \
	if test -f "$*.midi"; then \
		mv "$*.midi" $(MIDI_DIR); \
	fi

all: $(pdfs) $(midis)
