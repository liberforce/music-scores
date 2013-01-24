\version "2.14.2"

\header 
{
  title="Paranoid"
  composer="Black Sabbath"
}


upTheme = \drummode
{
  hh4 hh hh hh
}

downTheme = \drummode
{
  bd4 sn bd sn
}

upThemeHeadingCrashA = \drummode
{
  cymc4 hh hh hh
}

upThemeEndingA = \drummode
{
  hh4 hh hh s
}

downThemeEndingA = \drummode
{
  bd4 sn4 bd8 sn16 sn16 sn4
}

upThemeEndingB = \drummode
{
  cymc8 cymc4. cymc4 s4
}

downThemeEndingB = \drummode
{
  bd8 bd4. bd4 \acciaccatura sn16 sn4
}

allIntro = \drummode
{
  R1*3
  r2 r4 \acciaccatura sn16 sn4
}

allPreVerse = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \upThemeHeadingCrashA
      \upTheme
      \upThemeHeadingCrashA
      \upThemeEndingA
    }
    \new DrumVoice {
      \voiceTwo 
      \downTheme
      \downTheme
      \downTheme
      \downThemeEndingA
    }
  >>
}

allVerseOne = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \upThemeHeadingCrashA
      \upTheme
      \upTheme
      \upThemeEndingB
      \break

      \upTheme
      \upTheme
      \upTheme
      \upThemeEndingB
    }
    \new DrumVoice {
      \voiceTwo 
      \downTheme
      \downTheme
      \downTheme
      \downThemeEndingB

      \downTheme
      \downTheme
      \downTheme
      \downThemeEndingB
    }
  >>
}

upThemeDoubleCrash = \drummode
{
  <cymc hh>4 hh <cymc hh>4 hh
}

upThemeHeadingCrashB = \drummode
{
  <cymc hh>4 hh hh hh
}

allRiffOne = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \upTheme
      \upThemeDoubleCrash
      \upThemeHeadingCrashB
      \upThemeEndingA
      \break

      \upThemeHeadingCrashB
      \upThemeDoubleCrash
      \upThemeHeadingCrashB
      \upThemeEndingA
    }
    \new DrumVoice {
      \voiceTwo 
      \downTheme
      \downTheme
      \downTheme
      \downThemeEndingA

      \downTheme
      \downTheme
      \downTheme
      \downThemeEndingA
    }
  >>
}

allVerseTwo = \allVerseOne

allVerseThree = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \upTheme
      \upThemeHeadingCrashA
      \upThemeHeadingCrashA
      \upTheme
      \break

      \upThemeHeadingCrashA
      \upThemeEndingA
      \upThemeHeadingCrashA
      hh4 s4 s2
    }
    \new DrumVoice {
      \voiceTwo 
      \downTheme
      \downTheme
      \downTheme
      bd4 sn bd8. sn16 sn4

      \downTheme
      bd4 sn bd8. sn16 sn4
      \downTheme
      bd8 sn16 sn sn sn sn sn <sn bd>16 sn16 sn sn sn4
    }
  >>
}

allRiffTwo = \allVerseOne

allVerseFour = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \upTheme
      \upTheme
      \upTheme
      \upThemeEndingB
      \break

      \upTheme
      \upTheme
      \upTheme
      \upThemeEndingB
    }
    \new DrumVoice {
      \voiceTwo 
      \downTheme
      \downTheme
      \downTheme
      \downThemeEndingB

      \downTheme
      \downTheme
      bd4 sn <bd sn> sn
      \downThemeEndingB
    }
  >>
}

allSolo = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \repeat percent 4
      {
	\upTheme
	\upTheme
	\upTheme
	\upThemeEndingB
	\break
      }
    }
    \new DrumVoice {
      \voiceTwo 
      \repeat percent 4
      {
	\downTheme
	\downTheme
	\downTheme
	\downThemeEndingB
      }
    }
  >>
}

allRiffThree = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \repeat percent 2
      {
	\upTheme
	\upTheme
	\upTheme
	\upThemeEndingB
	\break
      }
    }
    \new DrumVoice {
      \voiceTwo 
      \repeat percent 2
      {
	\downTheme
	\downTheme
	\downTheme
	\downThemeEndingB
      }
    }
  >>
}

allVerseFive = \allRiffThree

allRiffFour = \drummode
{
}

allVerseSix = \drummode
{
}

allOutro = \drummode
{
}

song = 
\drums 
{
  \tempo 4=164

  \mark "Intro"
  \allIntro
  \break

  \mark "Pre-Verse"
  \allPreVerse
  \break

  \mark "Verse 1"
  \allVerseOne
  \break

  \mark "Riff 1"
  \allRiffOne
  \break

  \mark "Verse 2"
  \allVerseTwo
  \break

  \mark "Verse 3"
  \allVerseThree
  \break

  \mark "Riff 2"
  \allRiffTwo
  \break

  \mark "Verse 4"
  \allVerseFour
  \break

  \mark "Solo"
  \allSolo
  \break

  \mark "Riff 3"
  \allRiffThree
  \break

  \mark "Verse 5"
  \allVerseFive
  \break

  \mark "Riff 4"
  \allRiffFour
  \break

  \mark "Verse 6"
  \allVerseSix
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

