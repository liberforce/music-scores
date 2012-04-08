\version "2.14.2"

\header 
{
	title="Where is my mind"
	composer="Pixies"
}

upTheme = \drummode
{
  hh8 hh << sn hh >> hh 
}

upThemeA = \drummode
{
  hh8 hh << sn hh >> hhho 
}

upThemeB = \drummode
{
  hh8 hh << sn hh >> cyms 
}

upThemeC = \drummode
{
  hh8 hh << sn hh >> hhho 
}

up = \drummode
{
  sn16 sn sn sn sn4

  \upTheme
  \upTheme
  \upTheme
  \upThemeA

  \upTheme
  \upTheme
  \upTheme
  \upThemeB

  \upTheme
  \upTheme
  \upTheme
  \upThemeC
}

downTheme = \drummode 
{
  bd8 bd s4 
}

down = \drummode 
{
  s2
  \downTheme
  \downTheme
  \downTheme
  \downTheme

  \downTheme
  \downTheme
  \downTheme
  \downTheme

  \downTheme
  \downTheme
  \downTheme
  \downTheme
}

\new DrumStaff 
{
  R1*3
  r2

  <<
    \new DrumVoice { \voiceOne \up }
    \new DrumVoice { \voiceTwo \down }
  >>
}
