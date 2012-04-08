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

upThemeEndA = \drummode
{
  hh8 hh << sn hh >> hhho 
}

up = \drummode
{
  \upTheme
  \upTheme
  \upTheme
  \upThemeEndA
}

downTheme = \drummode 
{
  bd8 bd r4 
}

down = \drummode 
{
  \downTheme
  \downTheme
  \downTheme
  \downTheme
}

\new DrumStaff 
<<
  \new DrumVoice { \voiceOne \up }
  \new DrumVoice { \voiceTwo \down }
>>
