\version "2.16"

\header 
{
  title="Song Title"
  composer="Composer"
}


upTheme = \drummode
{
  hh16 hh hh hh hh hh hh hh hh hh hh hh hh hh sn sn
}

downTheme = \drummode
{
  bd4 bd bd bd
}

allIntro = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \repeat percent 4
      {
        \upTheme
      }
    }
    \new DrumVoice
    {
      \voiceTwo 
      \repeat percent 4
      {
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
      \upTheme
    }
    \new DrumVoice
    {
      \voiceTwo
      \downTheme
    }
  >>
}

upChorus = \drummode
{
  hh16 hh hh hh sn hh sn sn sn sn hh hh sn hh sn sn
}

allChorusOne = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \upChorus
    }
    \new DrumVoice
    {
      \voiceTwo 
      \downTheme
    }
  >>
}

upVerse = \drummode
{
  hh16 hh hh hh sn hh hh hh hh hh hh hh sn hh hh hh
}

allVerseOne = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \upVerse
    }
    \new DrumVoice
    {
      \voiceTwo 
      \downTheme
    }
  >>
}

allChorusTwo = \allChorusOne

allVerseTwo = \allVerseOne

allOutro = \allIntro

song = 
\drums 
{
  \tempo 4=100

  \mark "Intro"
  \allIntro
  \break

  \mark "Verse 1"
  \allVerseOne
  \break
  
  \mark "Chorus 1"
  \allChorusOne
  \break

  \mark "Verse 2"
  \allVerseTwo
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

