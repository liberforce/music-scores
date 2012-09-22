\version "2.14.2"

\header 
{
  title="Come As You Are"
  composer="Nirvana"
}

allSectionA = \drummode
{
  % Measures 1-4
  R1*3

  % Measure 5
  r2 r8 
  tomfl8 < tomfl toml > tomfl8 
}

allSectionB = \drummode
{
  % Measures 6-7
  % We can't use short polyphonic notation because it won't produce MIDI
  % http://code.google.com/p/lilypond/issues/detail?id=2022
  << 
    \new DrumVoice {
      \voiceOne
      | cymc4 <<cymr8 sn8>> cymr cymr cymr <<cymr sn>> cymr
      | cymr cymr <<cymr sn>> cymr cymr cymr <<cymr sn>> cymr
    }
    \new DrumVoice {
      \voiceTwo 
      | bd4 s4 bd8 bd s bd
      | bd bd s bd s bd
    }
  >>
}

song = 
\drums 
{
  \tempo 4=120

  % Measures 1-5
  \allSectionA

  % Measures 6
  \allSectionB

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

