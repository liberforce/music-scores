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
  % Measure 6
  << 
    \voiceOne {
      cymc4 cymr8 cymr cymr cymr cymr cymr 
    } \\
    \voiceTwo {
      bd4 sn4 bd8 bd sn bd
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

