\version "2.16"

\header 
{
  title="The Outsider"
  composer="A Perfect Circle"
}


upThemeHeadingCrash = \drummode
{
  cymc8 hh <hh sn> hh hh <hh sn>
}

upTheme = \drummode
{
  hh8 hh <hh sn> hh hh <hh sn> 
}

downTheme = \drummode
{
  bd8 bd r8. bd8 bd8.
}

allIntro = \drummode
{
  \compressFullBarRests
  R1*6/8*8
  << 
    \new DrumVoice
    {
      \voiceOne
      \upThemeHeadingCrash
      \upTheme
      \upTheme
      hh8 hh <hh sn> <cymc sn> <cymc sn> sn16 sn
    }
    \new DrumVoice
    {
      \voiceTwo 
      \downTheme
      \downTheme
      \downTheme
      bd8 bd16 bd16 r8 r4
    }
  >>
}

upVerseOneHeadingCrash = \drummode
{
  cymc8 hh <hh sn> hh hh hh <hh sn> hho
}

upVerseOne = \drummode
{
  hhc8 hh <hh sn> hh hh hh <hh sn> hho
}

upVerseOneEndingCrashes = \drummode
{
  hhc8 hh <hh sn> hh hh hh <cymc sn> <cymc sn>
}

upVerseOneEndingTom = \drummode
{
  hhc8 hh <hh sn> hh hh hh <hho sn> toml
}

upVerseOneFill = \drummode
{
  hhc8 hh <hh sn> cymc hh16 sn16 r8 sn8 tomfl16 sn16
}

downVerseOne = \drummode
{
  bd8. bd8. bd8. bd8 bd16 r4
}

downVerseOneEndingBDRoll = \drummode
{
  bd8. bd8. bd8. bd16 bd bd r4
}

downVerseOneFill = \drummode
{
  bd8. bd8. bd4 bd16 bd16 r4
}

allVerseOne = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \upVerseOneHeadingCrash
      \upVerseOne
      \upVerseOne
      \upVerseOneEndingCrashes

      \break
      \upVerseOneEndingTom
      \upVerseOneEndingTom
      \upVerseOneEndingTom
      \upVerseOneFill
    }
    \new DrumVoice
    {
      \voiceTwo 
      \downVerseOne
      \downVerseOne
      \downVerseOne
      \downVerseOne

      \downVerseOne
      \downVerseOne
      \downVerseOneEndingBDRoll
      \downVerseOneFill
    }
  >>
}

upPreChorusOneHeadingCrash = \drummode
{
  cymc8 hh hh <hh sn> hh <hh sn>
}

upPreChorusOneFillA = \drummode
{
  hh8 hh hh <hh sn> tomh16 tomh toml toml
}

upPreChorusOneHeadTailCrash = \drummode
{
  cymc8 hh hh <hh sn> hh <cymc sn>
}

upPreChorusEndingCrashA = \drummode
{
  cymc8 hh hh <hh sn>16 sn16 hh8 <cymc sn>
}

upPreChorusEndingCrashB = \drummode
{
  hh hh hh <hh sn> hh <cymc sn>
}

upPreChorusOneFillA = \drummode
{
  hh8 hh hh <hh sn> tomh16 tomh toml toml
}

upPreChorusOneFillB = \drummode
{
  hh8 hh hh sn16^"R" sn32^"L" sn^"L" sn16^"R" sn^"L" sn^"R" sn^"L"
}

downPreChorusOne = \drummode
{
  bd8. bd8 bd8. bd16 bd8.
}

downPreChorusOneEndingB = \drummode
{
  bd8. bd8 bd8. bd16 bd32 bd32 r8
}

downPreChorusOneFill = \drummode
{
  bd8. bd8 bd8. r4
}

allPreChorusOne = \drummode
{
  <<
    \new DrumVoice
    {
      \voiceOne
      \repeat percent 3
      { \upPreChorusOneHeadingCrash }
      \upPreChorusOneFillA

      \break
      \upPreChorusOneHeadTailCrash
      \upPreChorusEndingCrashA
      \upPreChorusEndingCrashB
      \upPreChorusOneFillB
    }
    \new DrumVoice
    {
      \voiceTwo
      \repeat percent 3
      { \downPreChorusOne }
      \downPreChorusOneFill

      \downPreChorusOne
      \downPreChorusOne
      \downPreChorusOneEndingB
      \downPreChorusOneFill
    }
  >>
}

upChorusOneEndingA = \drummode
{
  cymc8 hh <hh sn> <hh sn> hh sn16 sn
}

upChorusOneEndingB = \drummode
{
  hh16 sn hh8 sn16 sn32 sn tomfl16 tomfl sn tomfl tomfl sn
}

downChorusOneEndingA = \drummode
{
  bd8. bd16 bd4 bd8 bd8.
}

downChorusOneEndingB = \drummode
{
  bd8. bd8 bd8. r4
}

allChorusOne = \drummode
{
  << 
    \new DrumVoice
    {
      \voiceOne
      \upThemeHeadingCrash
      \upTheme
      \upThemeHeadingCrash
      \upChorusOneEndingA

      \upThemeHeadingCrash
      \upTheme
      \upThemeHeadingCrash
      \upChorusOneEndingB
    }
    \new DrumVoice
    {
      \voiceTwo 
      \downTheme
      \downTheme
      \downTheme
      \downChorusOneEndingA
      
      \downTheme
      \downTheme
      \downTheme
      \downChorusOneEndingB
    }
  >>
}

allChorusTwo = \allChorusOne

allVerseTwo = \allVerseOne

allOutro = \allIntro

song = 
\drums 
{
  \tempo 4=85
  \numericTimeSignature

  \time 6/8
  \mark "Intro"
  \allIntro
  \break

  \time 4/4
  \mark "Verse 1"
  \allVerseOne
  \break

  \time 6/8
  \mark "Pre-Chorus"
  \allPreChorusOne
  \break

  \mark "Chorus 1"
  \allChorusOne
  \break

%  \mark "Verse 2"
%  \allVerseTwo
%  \break
%
%  \mark "Chorus 2"
%  \allChorusTwo
%  \break
%
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

