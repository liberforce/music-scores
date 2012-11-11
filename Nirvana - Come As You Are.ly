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
  R1*3

  r2 r8 
  tomfl8 < tomfl toml > tomfl8 
}

allPreVerse = \drummode
{
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
      \repeat unfold 2 { \downThemeA \downThemeB }
    }
  >>
}

allVerseOne = \drummode
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
      \repeat unfold 8 { \downThemeA \downThemeB }
    }
  >>
}

upChorusA = \drummode
{
  cymc4 <<cymc sn>> cymc <<cymc sn>>
}

upChorusB = \drummode
{
  cymc4 sn16-> sn sn sn sn16-> sn sn sn sn16-> sn sn sn
}

downChorusA = \drummode
{
  bd4 s4 bd8 bd8 s4
}

downChorusB = \drummode
{
  bd4 bd bd bd
}

allChorus = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \repeat unfold 3 { \upChorusA \upChorusB }
      \upChorusA
      cymc4 sn16-> sn sn sn tommh tommh tomml tomfh \acciaccatura sn16 sn8
    }
    \new DrumVoice {
      \voiceTwo
      \repeat unfold 3 { \downChorusA \downChorusB }
      \downChorusA
      bd4 s2 s8 bd8
    }
  >>
}

allVerseTwo = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \upThemeHeadingCrash
      \repeat unfold 7 { \upTheme }
    }
    \new DrumVoice {
      \voiceTwo 
      \repeat unfold 4 { \downThemeA \downThemeB }
    }
  >>
}

song = 
\drums 
{
  \tempo 4=120

  \mark "Intro"
  \allIntro
  \break

  \mark "Pre-Verse"
  \allPreVerse
  \break

  \mark "Verse 1"
  \allVerseOne
  \break

  \mark "Chorus"
  \allChorus
  \break

  \mark "Verse 2"
  \allVerseTwo

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

