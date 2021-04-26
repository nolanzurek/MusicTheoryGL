# ChordDisplay
Processing Graphics Class for Music Theory

![pianoForGithub](https://user-images.githubusercontent.com/42624568/116135839-d4c24380-a68e-11eb-88b6-769f7aa99d4c.png)

## Features
- Generates keyboard diagrams with selected notes highlighed
  - Many appearence parameters of the piano can be changed
- Generate a series of keyboard diagrams and save the outputs to a subfolder
- Generates chromatic circle and circle of fifths diagrams with selected notes circled
- Generates animations that interpolate between the chromatic circle and the circle of fifths

## Features to be added

- MIDI input and recording for easier animation input (and animation timing)

## Usage
`ChordDisplay` is a class with instance variables that contain all the elements necessary to drawing keyboard and circle diargams. Diagrams are drawn and rendered using methods of the `ChordDisplay` class. To render a diagram, first create a `ChordDisplay` object, passing the range and notes to highlight into the constructor (if no notes are passed in, no notes are highlighted). Next, call setter methods (or dot syntax) on the `ChordDisplay` object to change various aspects of the appearence of the diagram you want to render. Finally, call one of the draw or render methods on the `ChordDisplay` object to draw the diagram to the screen or save it to sketchFolder/Render.

### Methods

#### ChordDisplay constructors

`ChordDisplay(int range)` `range` sets the number of piano piano keys that will be drawn, ascending chromatically from C (range acts the same way in every constructor)

`ChordDisplay(int range, String notesFormatString)` `notesFormatString` must be in the the form of ascending comma-separated numbers (ex. `"0,12,19,24,28,31,34"` from the above picture). Every integer in the string corresponds to a highlighted note in the piano or circle diagram; the number refers to the number of semitones above the starting C the note is (ex. 0 is C, 1 is C#, 12 6 is F#, etc). The remaining constructors use the same system; they just use different datastructures to store the integers:

`ChordDisplay(int range, int[] notesFormatIntArr)` uses an array of `int`s
`ChordDisplay(int range, ArrayList<Integer> notesFormatIntArrList)` uses a ArrayList of `Integer`s

#### Piano draw and render methods

#### Circle draw and render methods

#### Setters
