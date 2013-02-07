\version "2.14.2"

\header 
{
  title="Come As You Are"
  composer="Nirvana"
}

downThemeA = \drummode
{
  bd4 sn bd8 bd sn bd
}

downThemeB = \drummode
{
  bd8 bd sn bd r bd sn bd
}

upTheme = \drummode
{
  cymr8 cymr cymr cymr cymr cymr cymr cymr
}

upThemeHeadingCrash = \drummode
{
  cymc8 cymr cymr cymr cymr cymr cymr cymr
}

downGhostThemeA = \drummode
{
  bd4 sn8. \parenthesize sn16 bd8 bd sn bd
}

allIntro = \drummode
{
  R1*3

  r2 r8 
  tomfh8 < tomfh tomml > tomfh8 
}

allPreVerse = \drummode
{
  % We can't use short polyphonic notation because it won't produce MIDI
  % http://code.google.com/p/lilypond/issues/detail?id=2022
  << 
    \new DrumVoice {
      \voiceOne
      cymc4 cymr8 cymr cymr cymr cymr cymr
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
      \upTheme
      \upTheme

      \upThemeHeadingCrash
      \upTheme
      \upTheme
      \upTheme

      \upThemeHeadingCrash
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

      \downThemeA
      \downThemeB
      \downGhostThemeA
      \downThemeB

      \downThemeA
      \downThemeB
      \downThemeA
      \downThemeB

      \downThemeA
      \downThemeB
      \downGhostThemeA
      \downThemeB
    }
  >>
}

upChorusA = \drummode
{
  cymc4 cymc cymc cymc
}

upChorusB = \drummode
{
  cymc4 s4 s2 
}

downChorusA = \drummode
{
  bd4 sn4 bd8 bd8 sn4
}

downChorusB = \drummode
{
  bd4
  \stemUp
  <bd sn>16-> sn sn sn
  <bd sn>16-> sn sn sn
  <bd sn>16-> sn sn sn
  \stemDown
}

allChorusOne = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \repeat unfold 3 { \upChorusA \upChorusB }
      \upChorusA
      cymc4 s2 s4 
    }
    \new DrumVoice {
      \voiceTwo
      \repeat unfold 3 { \downChorusA \downChorusB }
      \downChorusA
      bd4 sn16-> sn sn sn tommh tommh tomml tomfh \acciaccatura sn16 sn8 bd8
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

allChorusTwo = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \repeat unfold 3 { \upChorusA \upChorusB }
      \upChorusA
    }
    \new DrumVoice {
      \voiceTwo
      \repeat unfold 3 { \downChorusA \downChorusB }
      \downChorusA
      sn8->[ bd] sn->[ bd] sn->[ bd] sn->[ bd]
    }
  >>
}

allChorusThree = \allChorusTwo

upBridgeA = \drummode
{
  cymc8 hhho hhho hhho hhho hhho hhho hhho
}

upBridgeB = \drummode
{
  cymc8 hhho hhho hhho hhho hhho hhho s8
}

upBridgeC = \drummode
{
  cymc8 hhho hhho hhho hhho hhho cymc hhho
}

downBridgeA = \drummode
{
  bd8 bd sn4 bd8 bd sn4
}

downBridgeB = \drummode
{
  bd8 bd sn4 bd8 bd sn sn16->[ sn->]
}

downBridgeC = \drummode
{
  bd8 bd sn4 bd8 bd sn bd
}

allBridgeOne = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \repeat volta 4 { \upBridgeA }
      \alternative { \upBridgeB \upBridgeC }
    }
    \new DrumVoice {
      \voiceTwo
      \repeat volta 4 { \downBridgeA }
      \alternative { \downBridgeB \downBridgeC }
    }
  >>
}

upSolo = \drummode
{
  cymc4 cymc cymc cymc
}

allPreSoloSolo = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \repeat percent 10 { \upSolo \upChorusA }
    }
    \new DrumVoice {
      \voiceTwo
      \repeat percent 10 { \downGhostThemeA \downThemeB }
    }
    \context DrumVoice {
      \set countPercentRepeats = ##t
      \override PercentRepeat #'transparent = ##t
      \override PercentRepeatCounter #'staff-padding = #1
      \repeat percent 10 { s1 s1 }
    }
    \context DrumVoice {
      { s1*4 \break \mark "Solo" s1*16 }
    }
  >>
}

allBridgeTwo = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \repeat volta 6 { \upBridgeA }
      \alternative { \upBridgeB \upBridgeC }
    }
    \new DrumVoice {
      \voiceTwo
      \repeat volta 6 { \downBridgeA }
      \alternative { \downBridgeA \downBridgeB }
    }
  >>
}

upOutroEnd = \drummode
{
  cymc4 <<cymc sn>> <<cymc8 sn8>> sn8 cymc4
}

downOutroEnd = \drummode
{
  bd8 bd4 bd4. bd8 bd
}

allOutro = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \repeat volta 4 { \upSolo }
      \alternative { \upChorusA \upOutroEnd }
      cymc1
    }
    \new DrumVoice {
      \voiceTwo
      \repeat volta 4 { \downThemeA }
      \alternative { \downThemeB \downOutroEnd }
      bd1
    }
  >>
  R1*2
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

  \mark "Chorus 1"
  \allChorusOne
  \break

  \mark "Verse 2"
  \allVerseTwo
  \break

  \mark "Chorus 2"
  \allChorusTwo
  \break

  \mark "Bridge 1"
  \allBridgeOne
  \break

  \mark "Pre-Solo"
  \allPreSoloSolo % includes Solo
  \break

%  \mark "Solo"
%  \allSolo
%  \break

  \mark "Chorus 3"
  \allChorusThree
  \break
  
  \mark "Bridge 2"
  \allBridgeTwo
  \break

  \mark "Outro"
  \allOutro

  \bar "|."
}

% Layout
\score
{
  \song
  \layout
  {
%    \set countPercentRepeats = ##t
%    \set repeatCountVisibility = #(every-nth-repeat-count-visible 1)
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

