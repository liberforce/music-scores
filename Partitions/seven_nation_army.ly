\version "2.14.2"

\header 
{
  title="Seven Nation Army"
  composer="White Stripes"
}


upTheme = \drummode
{
  hh4 hh hh hh
}

downThemeA = \drummode
{
  bd4 bd bd bd
}

downThemeB = \drummode
{
  bd4 sn bd sn
}

upThemeHeadingCrash = \drummode
{
  cymc4 hh hh hh
}

allIntro = \drummode
{
  R1*4
  << 
    \new DrumVoice
    {
      \voiceOne
      \repeat percent 4
      { \upTheme  }
    }
    \new DrumVoice
    {
      \voiceTwo 
      \repeat percent 4
      { \downThemeA  }
    }
  >>
}

allVerseOne = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \repeat percent 8
      { \upTheme  }
      \break

      \repeat percent 8
      { \upTheme  }
    }
    \new DrumVoice
    {
      \voiceTwo 
      \repeat percent 8
      { \downThemeA  }
      \break

      \repeat percent 8
      { \downThemeB  }
    }
  >>
}

allPreChorusOne = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \repeat unfold 2
      { \upThemeHeadingCrash  }
    }
    \new DrumVoice
    {
      \voiceTwo 
      \repeat unfold 2
      { \downThemeA  }
    }
  >>
}

upChorus = \drummode
{
  hho4 hho hho hho
}

upChorusJump = \drummode
{
  hho4 hho4 hho8. hho16 r8 hho8
}

downChorus = \downThemeB

downChorusJump = \drummode
{
  bd4 sn4 bd8. bd16 r8 sn8
}

allChorusOne = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \repeat volta 2
      {
	\upChorus
	\upChorus
	\upChorusJump
	\upChorus
      }
    }
    \new DrumVoice
    {
      \repeat volta 2
      {
	\voiceTwo 
	\downChorus
	\downChorus
	\downChorusJump
	\downChorus
      }
    }
  >>
}

allLinkOne = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \upThemeHeadingCrash
      \upThemeHeadingCrash
      cymc1
    }
    \new DrumVoice
    {
      \voiceTwo 
      \downThemeA
      \downThemeA
      bd1
    }
  >>

  R1*3
  \break

  << 
    \new DrumVoice
    {
      \voiceOne
      \repeat percent 4
      { \upTheme  }
    }
    \new DrumVoice
    {
      \voiceTwo 
      \repeat percent 4
      { \downThemeA  }
    }
  >>
}

allVerseTwo = \allVerseOne

allPreSolo = \allPreChorusOne

allSolo = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \repeat volta 4
      {
	\upChorus
	\upChorus
	\upChorusJump
	\mark \markup { \bold \italic "play 4 times" }
	%\once \override Score.RehearsalMark #'break-visibility = #end-of-line-visible 
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT 
	\upChorus
      }
    }
    \new DrumVoice
    {
      \repeat volta 4
      {
	\voiceTwo 
	\downChorus
	\downChorus
	\downChorusJump
	\downChorus
      }
    }
  >>
}

allLinkTwo = \allLinkOne

allVerseThree = \allVerseOne

allPreChorusTwo = \allPreChorusOne

allChorusTwo = \drummode
{
  \allChorusOne
  \break

  << 
    \new DrumVoice
    {
      \voiceOne
      cymc1
    }
    \new DrumVoice
    {
      \voiceTwo
      bd1
    }
  >>

  R1

  << 
    \new DrumVoice
    {
      \voiceOne
      cymc1
    }
    \new DrumVoice
    {
      \voiceTwo
      bd1
    }
  >>
}

song = 
\drums 
{
  \tempo 4=124

  \mark "Intro"
  \allIntro
  \break

  \mark "Verse 1"
  \allVerseOne
  \break

  \mark "Pre-Chorus"
  \allPreChorusOne
  \break

  \mark "Chorus 1"
  \allChorusOne
  \break

  \mark "Link 1"
  \allLinkOne
  \break

  \mark "Verse 2"
  \allVerseTwo
  \break

  \mark "Pre-Solo"
  \allPreSolo
  \break

  \mark "Solo"
  \allSolo
  \break

  \mark "Link 2"
  \allLinkTwo
  \break

  \mark "Verse 3"
  \allVerseThree
  \break

  \mark "Pre-Chorus"
  \allPreChorusTwo
  \break

  \mark "Chorus 2"
  \allChorusTwo
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

