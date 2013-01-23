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

allRiffTwo = \drummode
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
%allChorusTwo = \drummode
%{
%  << 
%    \new DrumVoice {
%      \voiceOne
%      \repeat unfold 3 { \upChorusA \upChorusB }
%      \upChorusA
%      sn8-> s sn-> s sn-> s sn->
%    }
%    \new DrumVoice {
%      \voiceTwo
%      \repeat unfold 3 { \downChorusA \downChorusB }
%      \downChorusA
%      s8 bd s bd s bd s bd
%    }
%  >>
%}
%
%upBridgeA = \drummode
%{
%  cymc8 hhho <<hhho sn>> hhho hhho hhho <<hhho sn>> hhho
%}
%
%upBridgeB = \drummode
%{
%  cymc8 hhho <<hhho sn>> hhho hhho hhho <<hhho sn>> sn16->[ sn->]
%}
%
%upBridgeC = \drummode
%{
%  cymc8 hhho <<hhho sn>> hhho hhho hhho <<cymc sn>> hhho
%}
%
%downBridgeA = \drummode
%{
%  bd8 bd s4 bd8 bd s4
%}
%
%downBridgeB = \drummode
%{
%  bd8 bd s4 bd8 bd s bd
%}
%
%allBridgeOne = \drummode
%{
%  << 
%    \new DrumVoice {
%      \voiceOne
%      \repeat volta 4 { \upBridgeA }
%      \alternative { \upBridgeB \upBridgeC }
%    }
%    \new DrumVoice {
%      \voiceTwo
%      \repeat volta 4 { \downBridgeA }
%      \alternative { \downBridgeA \downBridgeB }
%    }
%  >>
%}
%
%upSolo = \drummode
%{
%  cymc4 <<cymc8. sn8.>> < \parenthesize sn16 > cymc4 <<cymc4 sn>>
%}
%
%allPreSolo = \drummode
%{
%  << 
%    \new DrumVoice {
%      \voiceOne
%      \repeat percent 2 { \upSolo \upChorusA }
%    }
%    \new DrumVoice {
%      \voiceTwo
%      \repeat percent 2 { \downThemeA \downThemeB }
%    }
%  >>
%}
%
%allSolo = \drummode
%{
%  << 
%    \new DrumVoice {
%      \voiceOne
%      \set countPercentRepeats = ##t
%      \set repeatCountVisibility = #(every-nth-repeat-count-visible 1)
%      \repeat percent 8 { \upSolo \upChorusA }
%
%    }
%    \new DrumVoice {
%      \voiceTwo
%      \repeat percent 8 { \downThemeA \downThemeB }
%    }
%  >>
%}
%
%allBridgeTwo = \drummode
%{
%  << 
%    \new DrumVoice {
%      \voiceOne
%      \repeat volta 6 { \upBridgeA }
%      \alternative { \upBridgeB \upBridgeC }
%    }
%    \new DrumVoice {
%      \voiceTwo
%      \repeat volta 6 { \downBridgeA }
%      \alternative { \downBridgeA \downBridgeB }
%    }
%  >>
%}
%
%upOutroEnd = \drummode
%{
%  cymc4 <<cymc sn>> <<cymc8 sn8>> sn8 cymc4
%}
%
%downOutroEnd = \drummode
%{
%  bd8 bd4 bd4. bd8 bd
%}
%
%allOutro = \drummode
%{
%  << 
%    \new DrumVoice {
%      \voiceOne
%      \repeat volta 4 { \upSolo }
%      \alternative { \upChorusA \upOutroEnd }
%      cymc1
%    }
%    \new DrumVoice {
%      \voiceTwo
%      \repeat volta 4 { \downThemeA }
%      \alternative { \downThemeB \downOutroEnd }
%      bd1
%    }
%  >>
%  R1*2
%}

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

  \mark "Riff 1"
  \allRiffOne
  \break

  \mark "Verse 2"
  \allVerseTwo
  \break

  \mark "Riff 2"
  \allRiffTwo
  \break

%  \mark "Bridge 1"
%  \allBridgeOne
%  \break
%
%  \mark "Pre-Solo"
%  \allPreSolo
%  \break
%
%  \mark "Solo"
%  \allSolo
%  \break
%
%  \mark "Chorus 3"
%  \allChorusTwo       % same as chorus 2
%  \break
%  
%  \mark "Bridge 2"
%  \allBridgeTwo
%  \break
%
%  \mark "Outro"
%  \allOutro

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

