\version "2.16"

\header 
{
  title="Sunday Bloody Sunday"
  composer="U2"
}


upThemeEndingA = \drummode
{
  hh16 hh hh hh hh hh hh hh hh hh hh hh hh hh sn sn
}

upThemeEndingB = \drummode
{
  hh16 hh hh hh hh hh hh hh hh hh hh hh hh hh sn hh
}

upThemeHeadingCrash = \drummode
{
  cymc16 hh hh hh hh hh hh hh hh hh hh hh hh hh hh hh
}

upThemeHeadingCrashEndingA = \drummode
{
  cymc16 hh hh hh hh hh hh hh hh hh hh hh hh hh sn sn
}

upThemeHeadingCrashEndingB = \drummode
{
  cymc16 hh hh hh hh hh hh hh hh hh hh hh hh hh sn hh
}

downTheme = \drummode
{
  bd4 bd bd bd
}

upThemeEndingCrash = \drummode
{
  hh8 hh hh hh hh hh cymc hh
}

allIntro = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \repeat percent 4
      {
        \upThemeEndingA
        \upThemeEndingB
      }
    }
    \new DrumVoice
    {
      \voiceTwo 
      \repeat percent 4
      {
        \downTheme
        \downTheme
      }
    }
  >>
}

allPreChorusOne = \drummode
{
  <<
    \new DrumVoice
    {
      \voiceOne
      \upThemeHeadingCrashEndingA
      \upThemeHeadingCrashEndingB
      \upThemeHeadingCrashEndingA
      \upThemeHeadingCrash
      \upThemeEndingA
    }
    \new DrumVoice
    {
      \voiceTwo
      \downTheme
      \downTheme
      \downTheme
      \downTheme
      \downTheme
    }
  >>
}

upChorusAFirst = \drummode
{
  sn16 sn hh hh sn hh sn sn hh hh hh hh sn hh sn sn
}

upChorusA = \drummode
{
  hh16 hh hh hh sn hh sn sn hh hh hh hh sn hh sn sn
}

upChorusB = \drummode
{
  hh16 hh hh hh sn hh sn sn sn sn hh hh sn hh sn sn
}

allChorusOne = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \upChorusAFirst
      \upChorusB
      \upChorusA
      \upChorusB
    }
    \new DrumVoice
    {
      \voiceTwo 
      \downTheme
      \downTheme
      \downTheme
      \downTheme
    }
  >>
}

upVerseAHeadingCrash = \drummode
{
  cymc16 hh hh hh sn hh hh hh hh hh hh hh sn hh hh hh
}

upVerseA = \drummode
{
  hh16 hh hh hh sn hh hh hh hh hh hh hh sn hh hh hh
}

upVerseB = \drummode
{
  hh16 hh hh hh sn hh hh hh hh hh hh hh sn sn hh hh
}

upVerseC = \drummode
{
  hh16 hh hh hh sn hh hh hh hh hh hh hh sn hh sn sn
}

allVerseOne = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \upChorusA
      \upChorusB
      \upVerseAHeadingCrash
      \upVerseB
      \upVerseA
      \upVerseB
      \upVerseA
      \upVerseC
    }
    \new DrumVoice
    {
      \voiceTwo 
      \downTheme
      \downTheme
      \downTheme
      \downTheme
      \downTheme
      \downTheme
      \downTheme
      \downTheme
    }
  >>
}

allBridge = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \upVerseAHeadingCrash
      \upVerseB
      \upVerseA
      \upVerseC
    }
    \new DrumVoice
    {
      \voiceTwo 
      \downTheme
      \downTheme
      \downTheme
      \downTheme
    }
  >>
}

upPreChorus = \drummode
{
  cymc16 hh hh hh hh hh hh hh hh hh hh hh hh hh hh hh
}

upPreChorusEndingSnare = \drummode
{
  cymc16 hh hh hh hh hh hh hh hh hh hh hh hh hh sn hh
}

upPreChorusEndingDoubleSnare = \drummode
{
  cymc16 hh hh hh hh hh hh hh hh hh hh hh hh hh sn sn
}

allPreChorusTwo = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \upPreChorus
      \upPreChorus
      \upPreChorus
      \upPreChorusEndingDoubleSnare
    }
    \new DrumVoice
    {
      \voiceTwo 
      \downTheme
      \downTheme
      \downTheme
      \downTheme
    }
  >>
}

allChorusTwo = \allChorusOne

allVerseTwo = \allVerseOne

allPreChorusThree = \allPreChorusOne

allChorusThree = \allChorusOne

song = 
\drums 
{
  \tempo 4=100

  \mark "Intro"
  \allIntro
  \break

  \mark "Pre-Chorus 1"
  \allPreChorusOne
  \break
  
  \mark "Chorus 1"
  \allChorusOne
  \break

  \mark "Verse 1"
  \allVerseOne
  \break

  \mark "Bridge"
  \allBridge
  \break

  \mark "Pre-Chorus 2"
  \allPreChorusTwo
  \break

  \mark "Chorus 2"
  \allChorusTwo
  \break

  \mark "Verse 2"
  \allVerseTwo
  \break

  \mark "Bridge"
  \allBridge
  \break

  \mark "Pre-Chorus 3"
  \allPreChorusThree
  \break

  \mark "Chorus 3"
  \allChorusThree
  \break

%  \mark "Outro"
%  \allOutro
%  \break

  \bar "|."
}

% Layout
\score
{
  \song
  \layout
  {
    \set countPercentRepeats = ##t
    \set repeatCountVisibility = #(every-nth-repeat-count-visible 1)
  }
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

