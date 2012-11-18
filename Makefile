all:
	lilypond --pdf "Nirvana - Come As You Are.ly"
	evince "Nirvana - Come As You Are.pdf" &
