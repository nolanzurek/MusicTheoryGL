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

#### Draw methods (single image)

#### Animation draw and render methods
