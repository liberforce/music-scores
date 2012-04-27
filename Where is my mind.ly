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

upFlaHalfTheme = \drummode 
{
  hh8 hh \acciaccatura sn8 sn4 
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

  % Measure 21
  \upHalfTheme
  \upFlaHalfTheme

  % Measure 22
  \upFlaHalfTheme
  hh8 hh \acciaccatura sn8 sn8 toml8

  % Measure 23
  cymc4 r4 r2

  % Measure 24
  cymc8 hh hh hh hh16[ sn hh8] sn16 sn sn8

  % Measures 25-36
  \repeat volta 6 { cymc8 hh hh hh \upHalfTheme }
  \alternative
  {
    { \upThemeA }
    { \upThemeB }
    { \upThemeA }
    { \upThemeC }
  }

  % Measure 37
  \upHalfTheme
  \upFlaHalfTheme

  % Measure 38
  \upFlaHalfTheme
  \upFlaHalfTheme

  % Measure 39
  cymc4 r4 r2

  % Measure 40
  cymc8 hh hh hh hh hh hh hh
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

  % Measure 21
  \downTheme

  % Measure 22
  \downHalfTheme
  bd8. bd16 s4

  % Measure 23
  bd4 s4 s2

  % Measure 24
  bd8[ bd sn8. bd16] r8 bd8 r4

  % Measures 25 - 36
  % Looks buggy: there should be 16 repeats, but the rendering doesn't follow
  % voice 1
  \repeat unfold 5 { \downTheme }

  % Measure 37
  \downTheme

  % Measure 38
  \downHalfTheme
  bd4 s4

  % Measure 39
  bd4 s4 s2

  % Measure 40
  bd8[ bd sn8. bd16] r16 sn16[ bd bd sn8. sn16]
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

