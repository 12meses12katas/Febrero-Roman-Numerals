import java.util.Hashtable;

public class RomanNumeralsConverter {

	private int bases[] = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
	private Hashtable<Integer, String> tablaBases;
	private Hashtable<String, Integer> tablaBasesInv;
	
	public RomanNumeralsConverter(){
		tablaBases = new Hashtable<Integer, String>();
		tablaBases.put(1, "I");
		tablaBases.put(4, "IV");
		tablaBases.put(5, "V");
		tablaBases.put(9, "IX");
		tablaBases.put(10, "X");
		tablaBases.put(40, "XL");
		tablaBases.put(50, "L");
		tablaBases.put(90, "XC");
		tablaBases.put(100, "C");
		tablaBases.put(400, "CD");
		tablaBases.put(500, "D");
		tablaBases.put(900, "CM");
		tablaBases.put(1000, "M");
		
		tablaBasesInv = new Hashtable<String, Integer>();
		tablaBasesInv.put("I", 1);
		tablaBasesInv.put("IV", 4);
		tablaBasesInv.put("V", 5);
		tablaBasesInv.put("IX", 9);
		tablaBasesInv.put("X", 10);
		tablaBasesInv.put("XL", 40);
		tablaBasesInv.put("L", 50);
		tablaBasesInv.put("XC", 90);
		tablaBasesInv.put("C", 100);
		tablaBasesInv.put("CD", 400);
		tablaBasesInv.put("D", 500);
		tablaBasesInv.put("CM", 900);
		tablaBasesInv.put("M", 1000);
	}
	
	public String normalToRoman(int number) {
		String result = "";
		for (int base  : bases) {
			while(number >= base){
				number -= base;
				result += tablaBases.get(base);
			}
		}
		return result;
	}
	
	public int romanToNormal(String romanNumber) {
		int normalNumber = 0;
		
		char romanNumberArray[] = romanNumber.toCharArray();
		for(int indiceUltimo = romanNumberArray.length-1; indiceUltimo >= 0; indiceUltimo=indiceUltimo-2) {
			char letra = romanNumberArray[indiceUltimo];
			normalNumber = sumaValorLetra(normalNumber, letra);
			boolean quedaMasDeUno = indiceUltimo > 0;
			if(quedaMasDeUno){
				char letraAnterior = romanNumberArray[indiceUltimo-1];
				boolean letraAnteriorMayor = (tablaBasesInv.get(String.valueOf(letraAnterior)) >= 
							  tablaBasesInv.get(String.valueOf(letra)));
				if(letraAnteriorMayor)
					normalNumber = sumaValorLetra(normalNumber, letraAnterior);
				else
					normalNumber = restaValorLetra(normalNumber, letraAnterior);				
			}
		}
		return normalNumber;
	}

	private Integer sumaValorLetra(int normalNumber, char letra) {
		return normalNumber + tablaBasesInv.get(String.valueOf(letra));
	}
	
	private Integer restaValorLetra(int normalNumber, char letra) {
		return normalNumber - tablaBasesInv.get(String.valueOf(letra));
	}
}