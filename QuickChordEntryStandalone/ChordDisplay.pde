class ChordDisplay {

  //initializing inputs for the constructors

  int range;
  String notesFormatString;
  int[] notesFormatIntArr;
  ArrayList<Integer> notesFormatIntArrList = new ArrayList<Integer>();

  //PIANO VALUES

  int pianoX = 30;
  int pianoY = 30;

  int whiteKeyHeight = 300;
  int whiteKeyWidth = 40;
  float blackKeyHeightRatio = 0.5;
  float blackKeyWidthRatio = 0.7;

  int borderStrokeWeight = 3;
  color borderStroke = color(0);
  int keyCornerRadius = 0;

  color whiteKeyColor = color(255, 255, 255);
  color blackKeyColor = color(0, 0, 0);
  color whiteKeyColorSelected = color(255, 60, 60);
  color blackKeyColorSelected = color(255/2, 30, 30);

  //CIRCLE VALUES

  int textSize = 50;
  int circleSize = 100;
  int linesStrokeWeight = 4;
  color textColor = color(0);
  color circleColor = color(255);
  boolean showLines = true;

  //array to store the data in pianoArr format
  //...{pitch, on/off}, {pitch, on/off}, {pitch, on/off}...

  ArrayList<ArrayList<Integer>> pianoArr = new ArrayList<ArrayList<Integer>>();

  //constructors

  ChordDisplay(int range, String notesFormatString) {

    this.range = range;
    this.notesFormatString = notesFormatString;

    pianoArr = ChordDisplayUtil.formatToPianoArr(notesFormatString, range);
  }

  ChordDisplay(int range, int[] notesFormatIntArr) {

    this.range = range;
    this.notesFormatIntArr = notesFormatIntArr;

    pianoArr = ChordDisplayUtil.formatToPianoArr(notesFormatIntArr, range);
  }

  ChordDisplay(int range, ArrayList<Integer> notesFormatIntArrList) {

    this.range = range;
    this.notesFormatIntArrList = notesFormatIntArrList;

    pianoArr = ChordDisplayUtil.formatToPianoArr(notesFormatIntArrList, range);
  }

  ChordDisplay(int range) {

    this.range = range;
  }

  //renders the piano to the screen

  void drawPiano() {

    rectMode(CENTER);

    ArrayList<ArrayList<Integer>> blackKeysList = new ArrayList<ArrayList<Integer>>();
    ArrayList<ArrayList<Integer>> whiteKeysList = new ArrayList<ArrayList<Integer>>();

    int spacer = 0;

    stroke(borderStroke);
    strokeWeight(borderStrokeWeight);

    //seperate the lists
    for (int i = 0; i < pianoArr.size(); i++) {

      if (i%12 == 1 || i%12 == 3 || i%12 == 6 || i%12 == 8 || i%12 == 10) {

        blackKeysList.add(pianoArr.get(i));
      } else {

        whiteKeysList.add(pianoArr.get(i));
      }
    }

    //draw the white keys
    for (int i = 0; i < whiteKeysList.size(); i++) {

      stroke(borderStroke);
      strokeWeight(borderStrokeWeight);

      if (whiteKeysList.get(i).get(1) == 1) {

        fill(whiteKeyColorSelected);
      } else {

        fill(whiteKeyColor);
      }

      rect(i*whiteKeyWidth + pianoX + 0.5*whiteKeyWidth, pianoY+0.5*whiteKeyHeight, whiteKeyWidth, whiteKeyHeight, keyCornerRadius);
    }

    for (int i = 0; i < blackKeysList.size(); i++) {

      if (blackKeysList.get(i).get(0)%12 == 6 || blackKeysList.get(i).get(0)%12 == 1) {

        spacer++;
      }

      if (blackKeysList.get(i).get(1) == 1) {

        fill(blackKeyColorSelected);
      } else {

        fill(blackKeyColor);
      }

      //don't touch this monstrosity. It works, but I have no idea how.

      rect((blackKeysList.get(i).get(0) + spacer)*0.5*whiteKeyWidth + pianoX, blackKeyHeightRatio*whiteKeyHeight*0.5+pianoY, whiteKeyWidth*blackKeyWidthRatio, whiteKeyHeight*blackKeyHeightRatio, keyCornerRadius);
    }

    rectMode(CORNER);
  }

  //draw piano methods for each note input type

  void drawPiano(String inputNotesFormat) {

    pianoArr = ChordDisplayUtil.formatToPianoArr(inputNotesFormat, range);

    drawPiano();
  }

  void drawPiano(int... inputNotesFormat) {

    pianoArr = ChordDisplayUtil.formatToPianoArr(inputNotesFormat, range);

    drawPiano();
  }

  void drawPiano(ArrayList<Integer> inputNotesFormat) {

    pianoArr = ChordDisplayUtil.formatToPianoArr(inputNotesFormat, range);

    drawPiano();
  }

  //renderPiano saves frame(s) to sketch_folder/output

  void renderPiano() {

    drawPiano();

    PImage temp = get(pianoX-borderStrokeWeight/2, pianoY-borderStrokeWeight/2, whiteKeyWidth*ChordDisplayUtil.returnWhiteKeyNum(range)+borderStrokeWeight, whiteKeyHeight+borderStrokeWeight);
    temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + ".png");
  }

  void renderPiano(String inString) {

    drawPiano(inString);

    PImage temp = get(pianoX-borderStrokeWeight/2, pianoY-borderStrokeWeight/2, whiteKeyWidth*ChordDisplayUtil.returnWhiteKeyNum(range)+borderStrokeWeight, whiteKeyHeight+borderStrokeWeight);
    temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + ".png");
  }

  void renderPiano(String... args) {

    for (int i = 0; i < args.length; i++) {

      drawPiano(args[i]);

      PImage temp = get(pianoX-borderStrokeWeight/2, pianoY-borderStrokeWeight/2, whiteKeyWidth*ChordDisplayUtil.returnWhiteKeyNum(range)+borderStrokeWeight, whiteKeyHeight+borderStrokeWeight);
      temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + " frame " + i + ".png");
    }
  }

  void renderPiano(ArrayList<Integer> inArrayList) {

    drawPiano(inArrayList);

    PImage temp = get(pianoX-borderStrokeWeight/2, pianoY-borderStrokeWeight/2, whiteKeyWidth*ChordDisplayUtil.returnWhiteKeyNum(range)+borderStrokeWeight, whiteKeyHeight+borderStrokeWeight);
    temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + ".png");
  }

  void renderPiano(int[] inArray) {

    drawPiano(inArray);

    PImage temp = get(pianoX-borderStrokeWeight/2, pianoY-borderStrokeWeight/2, whiteKeyWidth*ChordDisplayUtil.returnWhiteKeyNum(range)+borderStrokeWeight, whiteKeyHeight+borderStrokeWeight);
    temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + ".png");
  }

  void renderPiano(ArrayList<Integer>... inArrListArr) {

    for (int i = 0; i < inArrListArr.length; i++) {

      drawPiano(inArrListArr[i]);

      PImage temp = get(pianoX-borderStrokeWeight/2, pianoY-borderStrokeWeight/2, whiteKeyWidth*ChordDisplayUtil.returnWhiteKeyNum(range)+borderStrokeWeight, whiteKeyHeight+borderStrokeWeight);
      temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + " frame " + i + ".png");
    }
  }

  void renderPiano(int[]... inIntArrArr) {

    for (int i = 0; i < inIntArrArr.length; i++) {

      drawPiano(inIntArrArr[i]);

      PImage temp = get(pianoX-borderStrokeWeight/2, pianoY-borderStrokeWeight/2, whiteKeyWidth*ChordDisplayUtil.returnWhiteKeyNum(range)+borderStrokeWeight, whiteKeyHeight+borderStrokeWeight);
      temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + " frame " + i + ".png");
    }
  }

  void renderPianoFromArrString(ArrayList<String> inStringArrList) {

    for (int i = 0; i < inStringArrList.size(); i++) {

      drawPiano(inStringArrList.get(i));

      PImage temp = get(pianoX-borderStrokeWeight/2, pianoY-borderStrokeWeight/2, whiteKeyWidth*ChordDisplayUtil.returnWhiteKeyNum(range)+borderStrokeWeight, whiteKeyHeight+borderStrokeWeight);
      temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + " frame " + i + ".png");
    }
  }

  void renderPianoFromArrArrInteger(ArrayList<ArrayList<Integer>> inArrListArrListInteger) {

    for (int i = 0; i < inArrListArrListInteger.size(); i++) {

      drawPiano(inArrListArrListInteger.get(i));

      PImage temp = get(pianoX-borderStrokeWeight/2, pianoY-borderStrokeWeight/2, whiteKeyWidth*ChordDisplayUtil.returnWhiteKeyNum(range)+borderStrokeWeight, whiteKeyHeight+borderStrokeWeight);
      temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + " frame " + i + ".png");
    }
  }

  void drawCircleFifths(int x, int y, int w, int h, String... inString) {

    ArrayList<String[]> inStringArrs = new ArrayList<String[]>();

    for (int i = 0; i < inString.length; i++) {

      inStringArrs.add(inString[i].split(","));
    }

    strokeWeight(linesStrokeWeight); 
    stroke(borderStroke); 

    String[] notes = {"C", "G", "D", "A", "E", "B", "F#", "C#", "G#", "Eb", "Bb", "F"};

    if (showLines) {

      for (int j = 0; j < inStringArrs.size(); j++) {

        beginShape();

        noFill(); 
        strokeWeight(borderStrokeWeight);

        for (int i = 0; i < inStringArrs.get(j).length; i++) {

          vertex((cos(radians((parseInt(inStringArrs.get(j)[i])*7+45)*30))*w)+x, (sin(radians((parseInt(inStringArrs.get(j)[i])*7+45)*30))*h)+y);
        }

        vertex((cos(radians((parseInt(inStringArrs.get(j)[0])*7+45)*30))*w)+x, (sin(radians((parseInt(inStringArrs.get(j)[0])*7+45)*30))*h)+y);

        endShape();
      }
    }

    fill(circleColor); 
    strokeWeight(borderStrokeWeight);

    for (int j = 0; j < inStringArrs.size(); j++) {

      for (int i = 0; i < inStringArrs.get(j).length; i++) {

        ellipse((cos(radians((parseInt(inStringArrs.get(j)[i])*7+45)*30))*w)+x, (sin(radians((parseInt(inStringArrs.get(j)[i])*7+45)*30))*h)+y, circleSize, circleSize);
      }
    }

    textSize(textSize); 
    textAlign(CENTER, CENTER); 
    fill(textColor); 

    for (int i = 0; i < 12; i++) {

      text(notes[i], (cos(radians((i+45)*30))*w)+x, (sin(radians((i+45)*30))*h)+y);
    }
  }

  void drawCircleFifths(int x, int y, int w, int h, int[]... inIntArr) {

    String[] temp = {};

    for (int i = 0; i < inIntArr.length; i++) {

      temp[i] = ChordDisplayUtil.formatToString(inIntArr[i]);
    }

    drawCircleFifths(x, y, w, h, temp);
  }

  void drawCircleFifths(int x, int y, int w, int h, ArrayList<Integer>... inIntArr) {

    String[] temp = {};

    for (int i = 0; i < inIntArr.length; i++) {

      temp[i] = ChordDisplayUtil.formatToString(inIntArr[i]);
    }

    drawCircleFifths(x, y, w, h, temp);
  }

  void drawCircleFifthsPianoArr(int x, int y, int w, int h, ArrayList<ArrayList<Integer>>... inIntArr) {

    String[] temp = {};

    for (int i = 0; i < inIntArr.length; i++) {

      temp[i] = ChordDisplayUtil.pianoArrToFormatString(inIntArr[i]);
    }

    drawCircleFifths(x, y, w, h, temp);
  }

  void renderCircleFifths(int x, int y, int w, int h, String... inString) {

    drawCircleFifths(x, y, w, h, inString);

    PImage temp = get(x-w-(circleSize+borderStrokeWeight)/2, y-h-(circleSize+borderStrokeWeight)/2, 2*w+(circleSize+borderStrokeWeight), 2*h+(circleSize+borderStrokeWeight));
    temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + ".png");
  }

  void renderCircleFifths(int x, int y, int w, int h, int[]... inIntArr) {

    drawCircleFifths(x, y, w, h, inIntArr);

    PImage temp = get(x-w-(circleSize+borderStrokeWeight)/2, y-h-(circleSize+borderStrokeWeight)/2, 2*w+(circleSize+borderStrokeWeight), 2*h+(circleSize+borderStrokeWeight));
    temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + ".png");
  }

  void renderCircleFifths(int x, int y, int w, int h, ArrayList<Integer>... inArrListInteger) {

    drawCircleFifths(x, y, w, h, inArrListInteger);

    PImage temp = get(x-w-(circleSize+borderStrokeWeight)/2, y-h-(circleSize+borderStrokeWeight)/2, 2*w+(circleSize+borderStrokeWeight), 2*h+(circleSize+borderStrokeWeight));
    temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + ".png");
  }

  void renderCircleFifthsPianoArr(int x, int y, int w, int h, ArrayList<ArrayList<Integer>>... inArrArrListInteger) {

    drawCircleFifthsPianoArr(x, y, w, h, inArrArrListInteger);

    PImage temp = get(x-w-(circleSize+borderStrokeWeight)/2, y-h-(circleSize+borderStrokeWeight)/2, 2*w+(circleSize+borderStrokeWeight), 2*h+(circleSize+borderStrokeWeight));
    temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + ".png");
  }

  void renderCircleFifths(int x, int y, int w, int h, String[]... inStrings) {

    for (int i = 0; i < inStrings.length; i++) {

      drawCircleFifths(x, y, w, h, inStrings[i]);

      PImage temp = get(x-w-(circleSize+borderStrokeWeight)/2, y-h-(circleSize+borderStrokeWeight)/2, 2*w+(circleSize+borderStrokeWeight), 2*h+(circleSize+borderStrokeWeight));
      temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + " frame " + i + ".png");
    }
  }

  void renderCircleFifths(int x, int y, int w, int h, int[][]... inInts) {

    for (int i = 0; i < inInts.length; i++) {

      drawCircleFifths(x, y, w, h, inInts[i]);

      PImage temp = get(x-w-(circleSize+borderStrokeWeight)/2, y-h-(circleSize+borderStrokeWeight)/2, 2*w+(circleSize+borderStrokeWeight), 2*h+(circleSize+borderStrokeWeight));
      temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + " frame " + i + ".png");
    }
  }

  void renderCircleFifths(int x, int y, int w, int h, ArrayList<Integer>[]... inArrListIntegers) {

    for (int i = 0; i < inArrListIntegers.length; i++) {

      drawCircleFifths(x, y, w, h, inArrListIntegers[i]);

      PImage temp = get(x-w-(circleSize+borderStrokeWeight)/2, y-h-(circleSize+borderStrokeWeight)/2, 2*w+(circleSize+borderStrokeWeight), 2*h+(circleSize+borderStrokeWeight));
      temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + " frame " + i + ".png");
    }
  }

  void renderCircleFifthsPianoArr(int x, int y, int w, int h, ArrayList<ArrayList<Integer>>[]... inArrListArrListIntegers) {

    for (int i = 0; i < inArrListArrListIntegers.length; i++) {

      drawCircleFifthsPianoArr(x, y, w, h, inArrListArrListIntegers[i]);

      PImage temp = get(x-w-(circleSize+borderStrokeWeight)/2, y-h-(circleSize+borderStrokeWeight)/2, 2*w+(circleSize+borderStrokeWeight), 2*h+(circleSize+borderStrokeWeight));
      temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + " frame " + i + ".png");
    }
  }

  void drawChromaticCircle(int x, int y, int w, int h, String... inString) {

    ArrayList<String[]> inStringArrs = new ArrayList<String[]>();

    for (int i = 0; i < inString.length; i++) {

      inStringArrs.add(inString[i].split(","));
    }

    strokeWeight(linesStrokeWeight); 
    stroke(borderStroke); 

    String[] notes = {"C", "G", "D", "A", "E", "B", "F#", "C#", "G#", "Eb", "Bb", "F"};

    if (showLines) {

      for (int j = 0; j < inStringArrs.size(); j++) {

        beginShape();

        noFill(); 
        strokeWeight(borderStrokeWeight);

        for (int i = 0; i < inStringArrs.get(j).length; i++) {

          vertex((cos(radians((parseInt(inStringArrs.get(j)[i])+45)*30))*w)+x, (sin(radians((parseInt(inStringArrs.get(j)[i])+45)*30))*h)+y);
        }

        vertex((cos(radians((parseInt(inStringArrs.get(j)[0])+45)*30))*w)+x, (sin(radians((parseInt(inStringArrs.get(j)[0])+45)*30))*h)+y);

        endShape();
      }
    }

    fill(circleColor); 
    strokeWeight(borderStrokeWeight);

    for (int j = 0; j < inStringArrs.size(); j++) {

      for (int i = 0; i < inStringArrs.get(j).length; i++) {

        ellipse((cos(radians((parseInt(inStringArrs.get(j)[i])+45)*30))*w)+x, (sin(radians((parseInt(inStringArrs.get(j)[i])+45)*30))*h)+y, circleSize, circleSize);
      }
    }

    textSize(textSize); 
    textAlign(CENTER, CENTER); 
    fill(textColor); 

    for (int i = 0; i < 12; i++) {

      text(notes[i], (cos(radians((i*7+45)*30))*w)+x, (sin(radians((i*7+45)*30))*h)+y);
    }
  }

  void drawChromaticCircle(int x, int y, int w, int h, int[]... inIntArr) {

    String[] temp = {};

    for (int i = 0; i < inIntArr.length; i++) {

      temp[i] = ChordDisplayUtil.formatToString(inIntArr[i]);
    }

    drawCircleFifths(x, y, w, h, temp);
  }

  void drawChromaticCircle(int x, int y, int w, int h, ArrayList<Integer>... inIntArr) {

    String[] temp = {};

    for (int i = 0; i < inIntArr.length; i++) {

      temp[i] = ChordDisplayUtil.formatToString(inIntArr[i]);
    }

    drawCircleFifths(x, y, w, h, temp);
  }

  void drawChromaticCirclePianoArr(int x, int y, int w, int h, ArrayList<ArrayList<Integer>>... inIntArr) {

    String[] temp = {};

    for (int i = 0; i < inIntArr.length; i++) {

      temp[i] = ChordDisplayUtil.pianoArrToFormatString(inIntArr[i]);
    }

    drawCircleFifths(x, y, w, h, temp);
  }

  void renderChromaticCircle(int x, int y, int w, int h, String... inString) {

    drawChromaticCircle(x, y, w, h, inString);

    PImage temp = get(x-w-(circleSize+borderStrokeWeight)/2, y-h-(circleSize+borderStrokeWeight)/2, 2*w+(circleSize+borderStrokeWeight), 2*h+(circleSize+borderStrokeWeight));
    temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + ".png");
  }

  void renderChromaticCircle(int x, int y, int w, int h, int[]... inIntArr) {

    drawChromaticCircle(x, y, w, h, inIntArr);

    PImage temp = get(x-w-(circleSize+borderStrokeWeight)/2, y-h-(circleSize+borderStrokeWeight)/2, 2*w+(circleSize+borderStrokeWeight), 2*h+(circleSize+borderStrokeWeight));
    temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + ".png");
  }

  void renderChromaticCircle(int x, int y, int w, int h, ArrayList<Integer>... inArrListInteger) {

    drawChromaticCircle(x, y, w, h, inArrListInteger);

    PImage temp = get(x-w-(circleSize+borderStrokeWeight)/2, y-h-(circleSize+borderStrokeWeight)/2, 2*w+(circleSize+borderStrokeWeight), 2*h+(circleSize+borderStrokeWeight));
    temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + ".png");
  }

  void renderChromaticCirclePianoArr(int x, int y, int w, int h, ArrayList<ArrayList<Integer>>... inArrArrListInteger) {

    drawChromaticCirclePianoArr(x, y, w, h, inArrArrListInteger);

    PImage temp = get(x-w-(circleSize+borderStrokeWeight)/2, y-h-(circleSize+borderStrokeWeight)/2, 2*w+(circleSize+borderStrokeWeight), 2*h+(circleSize+borderStrokeWeight));
    temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + ".png");
  }

  void renderChromaticCircle(int x, int y, int w, int h, String[]... inStrings) {

    for (int i = 0; i < inStrings.length; i++) {

      drawChromaticCircle(x, y, w, h, inStrings[i]);

      PImage temp = get(x-w-(circleSize+borderStrokeWeight)/2, y-h-(circleSize+borderStrokeWeight)/2, 2*w+(circleSize+borderStrokeWeight), 2*h+(circleSize+borderStrokeWeight));
      temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + " frame " + i + ".png");
    }
  }

  void renderChromaticCircle(int x, int y, int w, int h, int[][]... inInts) {

    for (int i = 0; i < inInts.length; i++) {

      drawChromaticCircle(x, y, w, h, inInts[i]);

      PImage temp = get(x-w-(circleSize+borderStrokeWeight)/2, y-h-(circleSize+borderStrokeWeight)/2, 2*w+(circleSize+borderStrokeWeight), 2*h+(circleSize+borderStrokeWeight));
      temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + " frame " + i + ".png");
    }
  }

  void renderChromaticCircle(int x, int y, int w, int h, ArrayList<Integer>[]... inArrListIntegers) {

    for (int i = 0; i < inArrListIntegers.length; i++) {

      drawChromaticCircle(x, y, w, h, inArrListIntegers[i]);

      PImage temp = get(x-w-(circleSize+borderStrokeWeight)/2, y-h-(circleSize+borderStrokeWeight)/2, 2*w+(circleSize+borderStrokeWeight), 2*h+(circleSize+borderStrokeWeight));
      temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + " frame " + i + ".png");
    }
  }

  void renderChromaticCirclePianoArr(int x, int y, int w, int h, ArrayList<ArrayList<Integer>>[]... inArrListArrListIntegers) {

    for (int i = 0; i < inArrListArrListIntegers.length; i++) {

      drawChromaticCirclePianoArr(x, y, w, h, inArrListArrListIntegers[i]);

      PImage temp = get(x-w-(circleSize+borderStrokeWeight)/2, y-h-(circleSize+borderStrokeWeight)/2, 2*w+(circleSize+borderStrokeWeight), 2*h+(circleSize+borderStrokeWeight));
      temp.save("output/Render at " + hour() + ";" + minute() + ";" + second() + " on " + day() + "-" + month() + "-" + year() + " frame " + i + ".png");
    }
  }

  //setter method for the format strings

  void setNotes(String inputNotesFormat) {

    pianoArr = ChordDisplayUtil.formatToPianoArr(inputNotesFormat, range);
  }

  void setNotes(int[] inputNotesFormat) {

    pianoArr = ChordDisplayUtil.formatToPianoArr(inputNotesFormat, range);
  }

  void setNotes(ArrayList<Integer> inputNotesFormat) {

    pianoArr = ChordDisplayUtil.formatToPianoArr(inputNotesFormat, range);
  }

  //clears the current display

  void clearDisplay() {

    pianoArr = ChordDisplayUtil.formatToPianoArr("", range);
    notesFormatString = "";
  }

  //setters

  void setWhiteKeyHeight(int input) {

    whiteKeyHeight = input;
  }

  void setWhiteKeWidth(int input) {

    whiteKeyWidth = input;
  }

  void setPianoX(int input) {

    pianoX = input;
  }

  void setPianoY(int input) {

    pianoY = input;
  }

  void setBorderStrokeWeight(int input) {

    borderStrokeWeight = input;
  }

  void setBorderStroke(color input) {

    borderStroke = input;
  }

  void setBlackKeyHeightRatio(float input) {

    blackKeyHeightRatio = input;
  }

  void setBlackKeyWidthRatio(float input) {

    blackKeyWidthRatio = input;
  }

  void setKeyCornerRadius(int input) {

    keyCornerRadius = input;
  }

  void setWhiteKeyColor(color input) {

    whiteKeyColor = input;
  }

  void setBlackKeyColor(color input) {

    blackKeyColor = input;
  }

  void setWhiteKeyColorSelected(color input) {

    whiteKeyColorSelected = input;
  }

  void setBlackKeyColorSelected(color input) {

    blackKeyColorSelected = input;
  }

  void setTextSize(int input) {

    textSize = input;
  }

  void setCircleSize(int input) {

    circleSize = input;
  }

  void setLinesStrokeWeight(int input) {

    linesStrokeWeight = input;
  }

  void setTextColor(color input) {

    textColor = input;
  }

  void setCircleColor(color input) {

    circleColor = input;
  }

  void setShowLines(boolean input) {

    showLines = input;
  }

  void toggleShowLines() {

    showLines = !showLines;
  }
}
