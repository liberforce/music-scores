\version "2.14.2"

\header 
{
	title="Where is my mind"
	composer="Pixies"
}

upHalfTheme = \drummode
{
  hh8 hh << sn hh >> hh 
}

upHalfThemeA = \drummode
{
  hh8 hh << sn hh >> hhho 
}

upHalfThemeB = \drummode
{
  hh8 hh << sn hh >> rb 
}

upHalfThemeC = \drummode
{
  hh8 hh << sn hh >> cyms 
}

upTheme = 
{
  \upHalfTheme \upHalfTheme
}

upThemeA = 
{
  \upHalfTheme \upHalfThemeA
}

upThemeB = 
{
  \upHalfTheme \upHalfThemeB
}

upThemeC = 
{
  \upHalfTheme \upHalfThemeC 
}

up = \drummode
{
  sn16\< sn sn sn sn4\!

  \repeat volta 8 { \upTheme }
  \alternative
  {
    { \upThemeA }
    { \upThemeB }
    { \upThemeA }
    { \upThemeC }
  }
}

downHalfTheme = \drummode 
{
  bd8 bd s4 
}

downTheme =
{
  \downHalfTheme 
  \downHalfTheme
}

down = \drummode 
{
  s2

  % Looks buggy: there should be 16 repeats, but the rendering doesn't follow
  % voice 1
  \repeat unfold 5 { \downTheme }
}

song = 
\new DrumStaff 
{
  \tempo 4=80 
  R1*3
  r2

  <<
    \new DrumVoice { \voiceOne \up }
    \new DrumVoice { \voiceTwo \down }
  >>
}

% Layout
\score
{
  \song
  \layout { }
}

% MIDI
% Unfolded repeats are required for MIDI when using multiple voices
\score
{
  \unfoldRepeats
  {
    \song
  }
  \midi { }
}

