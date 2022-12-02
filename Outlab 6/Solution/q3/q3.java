import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class q3 {
  public boolean func1(String text) {
    	  String pat = "^[a-zA-Z0-9]{0,5}$";
	  return text.matches(pat);
  }
  public boolean func2(String text) {
          String pat = "a*b+c";
	  return text.matches(pat);
  }
  public boolean func3(String text) {
	  String aNbN = "(?x) (?:  a  (?= a* (\\1?+ b))  )+ \\1";
	  return text.matches(aNbN);
  }
  public ArrayList<String> func4(String input,String regex){
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(input);
		ArrayList<String> matches = new ArrayList<String>();
		while (matcher.find()) {
			matches.add(matcher.group());
		}
		return matches;
  }
}
