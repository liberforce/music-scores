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

allChorusOne = \allVerseOne

allPreVerse = \drummode
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

allChorusTwo = \allChorusOne

upCrashChorus = \drummode
{
  cymc8 hh cymc hh cymc hh cymc hh
}

allChorusThree = \drummode
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

allVerseThree = \drummode
{
}

allVerseFour = \drummode
{
}

allPreSolo = \allPreVerse

allSolo = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \repeat percent 4
      {
        \upTheme
        \upTheme
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

allVerseFive = \allVerseFour

allChorusFour = \allChorusOne

allChorusFive = \allChorusThree

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

  \mark "Chorus 1"
  \allChorusOne
  \break
  
  \mark "Pre-Verse"
  \allPreVerse
  \break

  \mark "Verse 2"
  \allVerseTwo
  \break

  \mark "Chorus 2"
  \allChorusTwo
  \break

  \mark "Chorus 3"
  \allChorusThree
  \break

  \mark "Pre-Solo"
  \allPreSolo
  \break

  \mark "Solo"
  \allSolo
  \break

  \mark "Chorus 4"
  \allChorusFour
  \break

  \mark "Chorus 5"
  \allChorusFive
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

