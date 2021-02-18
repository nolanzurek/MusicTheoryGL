static class ChordDisplayUtil {

  ChordDisplayUtil() {
  
    
    
  }
  
  static int returnWhiteKeyNum (int input) {
    
    int whiteTotal = 0;
  
    for(int i = 0; i < input; i++) {
    
      if(i % 12 == 0 || i % 12 == 2 || i % 12 == 4 || i % 12 == 5 || i % 12 == 7 || i % 12 == 9 || i % 12 == 11) {
      
        whiteTotal++;
        
      }
      
    }
    
    return whiteTotal;
    
  }
  
  static ArrayList<ArrayList<Integer>> formatToPianoArr(String notesFormat, int range) {
    
    //if the string is in the number format
    
    if(!(notesFormat.contains("a") || notesFormat.contains("b") || notesFormat.contains("c") || notesFormat.contains("d") || notesFormat.contains("e") || notesFormat.contains("f") || notesFormat.contains("g") || notesFormat.contains("A") || notesFormat.contains("B") || notesFormat.contains("C") || notesFormat.contains("D") || notesFormat.contains("E") || notesFormat.contains("F") || notesFormat.contains("G"))) {
    
      ArrayList<ArrayList<Integer>> tempPianoArr = new ArrayList<ArrayList<Integer>>();
    
      int shadeCounter = 0;
      
      for(int i = 0; i < range; i++) {
      
        ArrayList<Integer> temp = new ArrayList<Integer>();
        temp.add(i);
        
        if (!split(notesFormat, ',')[shadeCounter].equals("") && split(notesFormat, ',')[shadeCounter].equals(Integer.toString(i))) {
        
          temp.add(1);
          
          if (split(notesFormat, ',').length > shadeCounter+1) {
          
            shadeCounter++;
            
          }
          
        } else {
        
          temp.add(0);
          
        }
        
        tempPianoArr.add(temp);
        
      }
      
      return tempPianoArr;
      
    } else {
    
      return new ArrayList<ArrayList<Integer>>();
      
    }
    
  }
  
  //method to convert between notesFormat int[] and pianoArr
  
  static ArrayList<ArrayList<Integer>> formatToPianoArr(int[] notesArr, int range) {
    
    ArrayList<ArrayList<Integer>> tempPianoArr = new ArrayList<ArrayList<Integer>>();
    
    int shadeCounter = 0;
    
    for(int i = 0; i < range; i++) {
    
      ArrayList<Integer> temp = new ArrayList<Integer>();
      temp.add(i);
      
      if (notesArr[shadeCounter] == i) {
      
        temp.add(1);
        
        if (notesArr.length > shadeCounter+1) {
        
          shadeCounter++;
          
        }
        
      } else {
      
        temp.add(0);
        
      }
      
      tempPianoArr.add(temp);
      
    }
    
    return tempPianoArr;
    
  }
  
  //method to convert between notesFormat ArrayList<Integer> and pianoArr
  
  static ArrayList<ArrayList<Integer>> formatToPianoArr(ArrayList<Integer> notesArr, int range) {
    
    ArrayList<ArrayList<Integer>> tempPianoArr = new ArrayList<ArrayList<Integer>>();
    
    int shadeCounter = 0;
    
    for(int i = 0; i < range; i++) {
    
      ArrayList<Integer> temp = new ArrayList<Integer>();
      temp.add(i);
      
      if (notesArr.get(shadeCounter).intValue() == i) {
      
        temp.add(1);
        
        if (notesArr.size() > shadeCounter+1) {
        
          shadeCounter++;
          
        }
        
      } else {
      
        temp.add(0);
        
      }
      
      tempPianoArr.add(temp);
      
    }
    
    print(tempPianoArr);
    return tempPianoArr;
    
  }
  
  static String pianoArrToFormatString (ArrayList<ArrayList<Integer>> pianoArr) {
    
    String result = "";
  
    for(int i = 0; i < pianoArr.size(); i++) {
    
      for(int j = 0; j < pianoArr.get(i).size(); j++) {
      
        if(pianoArr.get(i).get(1) == 1) {
        
          result += pianoArr.get(i).get(0) + ",";
          
        }
        
      }
      
    }
    
    return result;
    
  }
  
  static String formatToString(int[] input) {
    
    String result = "";
  
    for(int i = 0; i < input.length; i++) {
    
      result += input[i] + ",";
      
    }
    
    return result;
    
  }
  
  static String formatToString(ArrayList<Integer> input) {
    
    String result = "";
  
    for(int i = 0; i < input.size(); i++) {
    
      result += input.get(i) + ",";
      
    }
    
    return result;
    
  }
  
}
