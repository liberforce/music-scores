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

song = 
\drums 
{
  \tempo 4=120

  % Measures 1-4
  \allSectionA

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

