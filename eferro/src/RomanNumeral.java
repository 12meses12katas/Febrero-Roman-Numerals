import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;


public class RomanNumeral {

	Hashtable<String, Integer> roman2dec = new Hashtable<String, Integer>();
	Hashtable<Integer, String> dec2roman = new Hashtable<Integer, String>();
	List<String> romanDigits = new ArrayList<String>();
	
	public RomanNumeral(){
		 roman2dec.put("I", 1);
		 roman2dec.put("V", 5);
		 roman2dec.put("X", 10);
		 roman2dec.put("L", 50);
		 roman2dec.put("C", 100);
		 roman2dec.put("D", 500);
		 roman2dec.put("M", 1000);
		
		 dec2roman.put(1,"I");
		 dec2roman.put(5,"V");
		 dec2roman.put(10,"X");
		 dec2roman.put(50,"L");
		 dec2roman.put(100,"C");
		 dec2roman.put(500, "D");
		 dec2roman.put(1000, "M");
		
		 romanDigits.add("I");
		 romanDigits.add("V");
		 romanDigits.add("X");
		 romanDigits.add("L");
		 romanDigits.add("C");
		 romanDigits.add("D");
		 romanDigits.add("M");
		
		 
	 }
	
	public int extractOnes(int i){
		return i % 10;
	}
	public int extractTens(int i){
		return (i%100)/10;
	}
	public int extractHundreds(int i){
		return (i%1000)/100;
	}
	public int extractThousands(int i){
		return (i%10000)/1000;
	}
	
	public String part2roman(int i){
		
		if (i == 0){
			return new String("");
		}
		String romanNumber = dec2roman.get(i);
		
		if (romanNumber == null) {
			romanNumber = "";
			int prev = 0;
			int act = 0;
			for (Iterator<String> it=romanDigits.iterator(); it.hasNext(); ) {
				act = roman2dec.get(it.next());
				if (act > i) {
					break;
				}
				prev = act;
			}
			System.out.println("Initial = "+ i);
			System.out.println("Prev = "+ prev + " Act = " + act);
			System.out.println("------------");
			
			int remainder = i;
			int cont = 0;
			while (remainder > 0) {
				cont ++;
				if (cont > 3) {
					romanNumber = dec2roman.get(prev);
					romanNumber += dec2roman.get(act);
					
					remainder = i - act + prev;
					romanNumber += part2roman(remainder);
					break;
				}
				romanNumber += dec2roman.get(prev);
				remainder -= prev;
			}
		}
		return romanNumber;
	}
	
	
	public String number2roman(int i) {
		String romanNumber = part2roman(extractThousands(i)*1000) +
			part2roman(extractHundreds(i)*100) +
			part2roman(extractTens(i)*10) + 
			part2roman(extractOnes(i));
		
		return romanNumber;
	}

}
