\version "2.14.2"

\header 
{
  title="Island In The Sun"
  composer="Weezer"
}


upTheme = \drummode
{
  hh8 hh hh hh hh hh hh hh
}

downTheme = \drummode
{
  bd4 sn bd sn
}

upThemeEndingCrash = \drummode
{
  hh8 hh hh hh hh hh cymc hh
}

downThemeEndingA = \drummode
{
  bd4 sn8. \parenthesize sn16 bd8 bd8 sn8 bd8
}

downThemeEndingB = \drummode
{
  bd4 sn4 bd8 bd8 sn8 bd8
}

allIntro = \drummode
{
  R1*2
  << 
    \new DrumVoice
    {
      \voiceOne
      \repeat percent 3
      {
        \upTheme
        \upTheme
      }
    }
    \new DrumVoice
    {
      \voiceTwo 
      \repeat percent 3
      {
        \downTheme
        \downThemeEndingA
      }
    }
  >>
}

allVerseOne = \drummode
{
  <<
    \new DrumVoice
    {
      \voiceOne
      \repeat volta 4
      {
        \upTheme
      }
      \alternative
      {
	{ \upTheme }
	{ \upThemeEndingCrash }
      }
    }
    \new DrumVoice
    {
      \voiceTwo
      \repeat volta 4
      {
	\downTheme
      }
      \alternative
      {
	{ \downThemeEndingA }
	{ \downThemeEndingB }
      }
    }
  >>
}

allPreChorusOne = \allVerseOne

allBridgeOne = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \repeat percent 2
      {
        \upTheme
        \upTheme
      }
    }
    \new DrumVoice
    {
      \voiceTwo 
      \repeat percent 2
      {
        \downTheme
        \downThemeEndingA
      }
    }
  >>
}

allVerseTwo = \allVerseOne

allPreChorusTwo = \allPreChorusOne

upCrashChorus = \drummode
{
  cymc8 hh cymc hh cymc hh cymc hh
}

allChorusOne = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \repeat percent 4
      {
        \upCrashChorus
        \upCrashChorus
      }
    }
    \new DrumVoice
    {
      \voiceTwo 
      \repeat percent 4
      {
        \downTheme
        \downThemeEndingA
      }
    }
  >>
}

allBridgeSolo = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \repeat percent 6
      {
        \upTheme
        \upTheme
      }
    }
    \new DrumVoice
    {
      \voiceTwo 
      \repeat percent 6
      {
        \downTheme
        \downThemeEndingA
      }
    }
    \context DrumVoice
    {
      {
        s1*4
        \break
        \mark "Solo" }
    }
  >>
}

allPreChorusThree = \allPreChorusOne

allChorusTwo = \allChorusOne

allOutro = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \repeat percent 2
      {
        \upTheme
        \upTheme
      }
      cymc16 cymc16 cymc8
    }
    \new DrumVoice
    {
      \voiceTwo 
      \repeat percent 2
      {
        \downTheme
        \downThemeEndingA
      }
      bd4
    }
  >>
  r4 r2
}

song = 
\drums 
{
  \tempo 4=115

  \mark "Intro"
  \allIntro
  \break

  \mark "Verse 1"
  \allVerseOne
  \break

  \mark "Pre-Chorus 1"
  \allPreChorusOne
  \break
  
  \mark "Bridge 1"
  \allBridgeOne
  \break

  \mark "Verse 2"
  \allVerseTwo
  \break

  \mark "Pre-Chorus 2"
  \allPreChorusTwo
  \break

  \mark "Chorus 1"
  \allChorusOne
  \break

  \mark "Bridge 2"
  \allBridgeSolo % includes bridge + solo
  \break

  %\mark "Solo"
  %\allSolo
  %\break

  \mark "Pre-Chorus 3"
  \allPreChorusThree
  \break

  \mark "Chorus 2"
  \allChorusTwo
  \break

  \mark "Outro"
  \allOutro
  \break

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

