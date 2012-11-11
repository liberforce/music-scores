\version "2.14.2"

\header 
{
  title="Come As You Are"
  composer="Nirvana"
}

downThemeA = \drummode
{
  bd4 s4 bd8 bd s bd
}

downThemeB = \drummode
{
  bd8 bd s   bd s bd s bd
}

upTheme = \drummode
{
  cymr8 cymr <<cymr sn>> cymr cymr cymr <<cymr sn>> cymr
}

upThemeHeadingCrash = \drummode
{
  cymc8-> cymr <<cymr sn>> cymr cymr cymr <<cymr sn>> cymr
}

upThemeGhost = \drummode
{
  cymc8 cymr <<cymr sn>> cymr16 sn16 cymr8 cymr <<cymr sn>> cymr
}

allIntro = \drummode
{
  % Measures 1-4
  R1*3

  % Measure 5
  r2 r8 
  tomfl8 < tomfl toml > tomfl8 
}

allPreVerse = \drummode
{
  % Measures 6-7
  % We can't use short polyphonic notation because it won't produce MIDI
  % http://code.google.com/p/lilypond/issues/detail?id=2022
  << 
    \new DrumVoice {
      \voiceOne
      cymc4 <<cymr8 sn8>> cymr cymr cymr <<cymr sn>> cymr
      \upTheme
      \upTheme
      \upTheme
    }
    \new DrumVoice {
      \voiceTwo 
      \downThemeA
      \downThemeB
      \downThemeA
      \downThemeB
    }
  >>
}

allVerse = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \upThemeHeadingCrash
      \upTheme
      \upTheme
      \upTheme

      \upTheme
      \upTheme
      \upThemeGhost
      \upTheme

      \upThemeHeadingCrash
      \upTheme
      \upTheme
      \upTheme

      \upThemeHeadingCrash
      \upTheme
      \upThemeGhost
      \upTheme
    }
    \new DrumVoice {
      \voiceTwo 
      \downThemeA
      \downThemeB
      \downThemeA
      \downThemeB

      \downThemeA
      \downThemeB
      \downThemeA
      \downThemeB

      \downThemeA
      \downThemeB
      \downThemeA
      \downThemeB

      \downThemeA
      \downThemeB
      \downThemeA
      \downThemeB
    }
  >>
}

song = 
\drums 
{
  \tempo 4=120

  % Measures 1-5
  \mark "Intro"
  \allIntro
  \break

  % Measures 6-9
  \mark "Pre-Verse"
  \allPreVerse

  % Measures 10-25
  \mark "Verse"
  \allVerse

  \bar "|."
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

