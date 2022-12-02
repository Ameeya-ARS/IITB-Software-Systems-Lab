import java.util.HashMap;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Scanner;
import java.io.FileWriter;

public class q2 {
    public static void main(String[] args) {
      try {
	      File f = new File("output.txt");
	      f.delete();
      }
      catch(Exception e) {
	      e.printStackTrace();
      }
      try{
        File myObj = new File(args[0]);
	Scanner myReader = new Scanner(myObj);
	while (myReader.hasNextLine()) {
	int max_freq = 0, j = 1;
	HashMap<Character, Integer> map = new HashMap<Character, Integer>();
        String Dat = myReader.nextLine();
	String data = Dat.toLowerCase();
        for (int i = 0; i < data.length(); i++) {
	  if(Character.isAlphabetic(data.charAt(i))){
            if (map.containsKey(data.charAt(i))) {
                int n = map.get(data.charAt(i)) + 1;
                map.put(data.charAt(i), n);
            } else {
                map.put(data.charAt(i), 1);
            }
        }
	}
	for (int i : map.values()) {
                if(i>max_freq) max_freq = i;
        }
        try {
	FileWriter myWriter = new FileWriter("output.txt",true); 
	for (char i : map.keySet()) {
	if(map.get(i)==max_freq){
	if(j==1){
	myWriter.write(i+"="+map.get(i));
	j++;
	}
	else{
	myWriter.write(","+i+"="+map.get(i));
	j++;
	}
	}
	}
	 myWriter.write("\n");
	 myWriter.close();
	} catch (IOException e) {
	System.out.println("An error occurred.");
	e.printStackTrace();
	}
	map.clear();
	}
	myReader.close();
      }
      catch (FileNotFoundException e) {
      	 System.out.println("An error occurred.");
      	 e.printStackTrace();
	}
    
	
    }
}
