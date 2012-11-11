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
  cymc8 cymr <<cymr sn>> cymr cymr cymr <<cymr sn>> cymr
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

allChorusOne = \drummode
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

allChorusTwo = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \repeat unfold 3 { \upChorusA \upChorusB }
      \upChorusA
      sn8-> s sn-> s sn-> s sn->
    }
    \new DrumVoice {
      \voiceTwo
      \repeat unfold 3 { \downChorusA \downChorusB }
      \downChorusA
      s8 bd s bd s bd s bd
    }
  >>
}

upBridgeA = \drummode
{
  cymc8 hhho <<hhho sn>> hhho hhho hhho <<hhho sn>> hhho
}

upBridgeB = \drummode
{
  cymc8 hhho <<hhho sn>> hhho hhho hhho <<hhho sn>> sn16->[ sn->]
}

upBridgeC = \drummode
{
  cymc8 hhho <<hhho sn>> hhho hhho hhho <<cymc sn>> hhho
}

downBridgeA = \drummode
{
  bd8 bd s4 bd8 bd s4
}

downBridgeB = \drummode
{
  bd8 bd s4 bd8 bd s bd
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
      \alternative { \downBridgeA \downBridgeB }
    }
  >>
}

upSolo = \drummode
{
  cymc4 <<cymc8. sn8.>> < \parenthesize sn16 > cymc4 <<cymc4 sn>>
}

allPreSolo = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \repeat percent 2 { \upSolo \upChorusA }
    }
    \new DrumVoice {
      \voiceTwo
      \repeat percent 2 { \downThemeA \downThemeB }
    }
  >>
}

allSolo = \drummode
{
  << 
    \new DrumVoice {
      \voiceOne
      \set countPercentRepeats = ##t
      \set repeatCountVisibility = #(every-nth-repeat-count-visible 1)
      \repeat percent 8 { \upSolo \upChorusA }

    }
    \new DrumVoice {
      \voiceTwo
      \repeat percent 8 { \downThemeA \downThemeB }
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
  \allPreSolo
  \break

  \mark "Solo"
  \allSolo
  \break

  \mark "Chorus 3"
  \allChorusTwo       % same as chorus 2
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

