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

upBreakA = \drummode
{
  % Measure 21
  \upHalfTheme
  \upFlaHalfTheme

  % Measure 22
  \upFlaHalfTheme
  hh8 hh \acciaccatura sn8 sn8 toml8

  % Measure 23 (beginning)
  cymc4
}

upBreakB = \drummode
{
  % Measure 37
  \upHalfTheme
  \upFlaHalfTheme

  % Measure 38
  \upFlaHalfTheme
  \upFlaHalfTheme

  % Measure 39
  cymc4 r4 r2
}

upB = \drummode
{
  % Measure 24
  cymc8 hh hh hh hh16[ sn hh8] sn16 sn sn8

  % Measure 25
  cymc8 hh << hh sn >> hh \upHalfTheme
  
  % Measure 26
  \upThemeA

  % Measures 27-36
  \repeat volta 5 { \upTheme }
  \alternative
  {
    { \upThemeA }
    { \upThemeB }
    { \upThemeA }
    { \upThemeC }
  }

  % Measures 37-39
  \upBreakB

  % Measure 40
  cymc8 hh hh hh hh hh hh hh

  % Measures 41-42
  \repeat unfold 2 { hh8 hh hh hh hh hh hh hh }

  % Measure 43
  tommh16^"R"[ tommh8^"L" tomml16^"L" tomml8^"R" tomfh16^"R" tomfh16^"L"] r16
  sn16[  \acciaccatura { sn[ sn] } sn tomml16] \stemDown { tomfh16[ tomfh \acciaccatura sn8 sn] } \stemUp

  % Measures 44-49
  \repeat volta 5 { \upTheme }
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

downBreakA = \drummode 
{
  % Measure 21
  \downTheme

  % Measure 22
  \downHalfTheme
  bd8. bd16 s4

  % Measure 23 (beginning)
  bd4
}

downB = \drummode
{
  % Measure 24
  bd8[ bd sn8. bd16] r8 bd8 r4

  % Measures 25 - 37
  % Looks buggy: there should be more repeats, but the rendering doesn't follow
  % repeats from voice 1
  \repeat unfold 8 { \downTheme }

  % Measure 38
  \downHalfTheme
  bd4 s4

  % Measure 39
  bd4 s4 s2

  % Measures 40-41
  \repeat unfold 2 { bd8[ bd sn8. bd16] r16 sn16[ bd bd sn8. sn16] }

  % Measure 42
  bd8[ bd sn8. bd16] r16 sn16[ bd bd] sn4

  % Measure 43
  s1

  % Measure 44 - 48
  % Looks buggy: there should be more repeats, but the rendering doesn't follow
  % repeats from voice 1
  \repeat unfold 5 { \downTheme }
}

song = 
\new DrumStaff 
{
  \tempo 4=80

  % Measures 1-3
  R1*3

  % Measure 4
  r2
  \new DrumVoice { \voiceOne \drummode { sn16\< sn sn sn sn4\! } }

  % Measures 5-20
  \repeat volta 8
  {
    <<
      \new DrumVoice { \voiceOne \upTheme }
      \new DrumVoice { \voiceTwo \downTheme }
    >>
  }
  \alternative
  {
    {
      <<
	\new DrumVoice { \voiceOne \upThemeA }
	\new DrumVoice { \voiceTwo \downTheme }
      >>
    }
    {
      <<
	\new DrumVoice { \voiceOne \upThemeB }
	\new DrumVoice { \voiceTwo \downTheme }
      >>
    }
    {
      <<
	\new DrumVoice { \voiceOne \upThemeA }
	\new DrumVoice { \voiceTwo \downTheme }
      >>
    }
    {
      <<
	\new DrumVoice { \voiceOne \upThemeC }
	\new DrumVoice { \voiceTwo \downTheme }
      >>
    }
  }

  % Measures 21-23
  {
    <<
      \new DrumVoice { \voiceOne \upBreakA }
      \new DrumVoice { \voiceTwo \downBreakA }
    >>
    r4 r2
  }

  <<
    \new DrumVoice { \voiceOne \upB }
    \new DrumVoice { \voiceTwo \downB }
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

