# Music Theory GL
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

`ChordDisplay(int range, int[] notesFormatIntArr)` takes an array of `int`s
`ChordDisplay(int range, ArrayList<Integer> notesFormatIntArrList)` takes a ArrayList of `Integer`s

#### Piano draw and render methods

`void drawPiano()` called on a `ChordDisplay` object draws a piano to the screen with highlighted notes corresponding to the constructor

`void drawPiano(String notesFormatString)` creates a temporary `ChordDisplay` object, passing the range of the object it was called on and `notesFormatString` into the constructor. Like the constructors, the remaining `drawPiano(...)` methods use the same system; they just use different datastructures to store the integers:

`void drawPiano(int... inputNotesFormat)` takes as many integers as are passed into the method, or an `int[]` datatype
`void drawPiano(ArrayList<Integer> inputNotesFormat)` takes a ArrayList of `Integer`s

`void renderPiano()` called on a `ChordDisplay` object draws a piano to the screen with highlighted notes corresponding to the constructor, then automatically saves the frame as a png file in the sketch folder. `void renderPiano(...)` takes the same arguments as `void drawPiano()`, as well as some others:

`void renderPiano(String... args)` takes as many Strings as are passed into the method, or an `String[]` datatype, and renders a piano for each string (if 5 strings are inputted, 5 png files are saved to the sketch folder, one for each string). This method also supports the same other datatypes as before:

`void renderPiano(ArrayList<Integer>... inArrListArr)` takes a number of `ArrayList<Integer>`s or `ArrayList<Integer>[]`.
`void renderPiano(int[]... inIntArrArr)` takes a number of `int[]`s or `int[][]`.

`void renderPianoFromArrString(ArrayList<String> inStringArrList)` takes notes in the form `ArrayList<String>`.
`void renderPianoFromArrArrInteger(ArrayList<ArrayList<Integer>> inArrListArrListInteger)` takes notes in the form `ArrayList<ArrayList<Integer>>`.

#### Circle draw and render methods

#### Setters

Setters modify various aspects of the appearance of the keyboards and circle diagrams; the parameter they set is evident from their name

```Processing
//REFER TO KEYBOARD

void setWhiteKeyHeight(int input) 
void setWhiteKeWidth(int input)
void setPianoX(int input)                    //top-left corner
void setPianoY(int input)                    //top-left corner
void setBlackKeyHeightRatio(float input)     //sets ratio of black key height to white key height
void setBlackKeyWidthRatio(float input)      //sets ratio of black key width to white key width
void setKeyCornerRadius(int input)
void setWhiteKeyColor(color input)
void setBlackKeyColor(color input)
void setWhiteKeyColorSelected(color input)   //when key is pressed
void setBlackKeyColorSelected(color input)   //when key is pressed

//REFER TO CIRCLES

void setTextSize(int input)
void setCircleSize(int input)
void setLinesStrokeWeight(int input)
void setTextColor(color input)
void setCircleColor(color input)
void setShowLines(boolean input)
void toggleShowLines()

//REFER TO BOTH

void setBorderStrokeWeight(int input)
void setBorderStroke(color input)

```
