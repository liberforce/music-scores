\version "2.16"

\header 
{
  title="The Outsider"
  composer="A Perfect Circle"
}


upThemeHeadingCrash = \drummode
{
  cymc8 hh <<hh sn>> hh hh <<hh sn>>
}

upTheme = \drummode
{
  hh8 hh <<hh sn>> hh hh <<hh sn>> 
}

downTheme = \drummode
{
  bd8 bd r8. bd8 bd8.
}

allIntro = \drummode
{
  R1*6/8*2
  << 
    \new DrumVoice
    {
      \voiceOne
      \upThemeHeadingCrash
      \upTheme
      \upTheme
      hh8 hh <<hh sn>> <<cymc sn>> <<cymc sn>> sn16 sn
    }
    \new DrumVoice
    {
      \voiceTwo 
      \downTheme
      \downTheme
      \downTheme
      bd8 bd16 bd16 r8.
    }
  >>
}

upVerseOneHeadingCrash = \drummode
{
  cymc8 hh <<hh sn>> hh hh hh <<hh sn>> hho
}

upVerseOne = \drummode
{
  hhc8 hh <<hh sn>> hh hh hh <<hh sn>> hho
}

upVerseOneEndingCrashes = \drummode
{
  hhc8 hh <<hh sn>> hh hh hh <<cymc sn>> <<cymc sn>>
}

upVerseOneEndingCrash = \drummode
{
  hhc8 hh <<hh sn>> hh hh hh <<hho sn>> cymc
}

upVerseOneFill = \drummode
{
  hhc8 hh <<hh sn>> hh cymc <<hh sn>> sn8. sn16
}

downVerseOne = \drummode
{
  bd8.[ bd8.] bd8. bd8 bd16 r4
}

downVerseOneEndingTom = \drummode
{
  bd8.[ bd8.] bd8. bd8 bd16 r8 toml
}

downVerseOneEndingSnareRollTom = \drummode
{
  bd8.[ bd8.] bd8. bd16 bd bd r8 tomfl
}

downVerseOneFill = \drummode
{
  bd8.[ bd8.] r8 bd8. bd32[ bd8.] tomfl8
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

      \upVerseOneEndingCrash
      \upVerseOneEndingCrash
      \upVerseOneEndingCrash
      \upVerseOneFill
    }
    \new DrumVoice
    {
      \voiceTwo 
      \downVerseOne
      \downVerseOne
      \downVerseOne
      \downVerseOne

      \downVerseOneEndingTom
      \downVerseOneEndingTom
      \downVerseOneEndingSnareRollTom
      \downVerseOneFill
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

allChorusTwo = \allChorusOne

allVerseTwo = \allVerseOne

allOutro = \allIntro

song = 
\drums 
{
  \time 6/8
  \tempo 4=85

  \mark "Intro"
  \allIntro
  \break

  \time 4/4
  \mark "Verse 1"
  \allVerseOne
  \break
%  
%  \mark "Chorus 1"
%  \allChorusOne
%  \break
%
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

