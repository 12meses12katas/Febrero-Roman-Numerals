package elmenda;

public class RomanNumerals {

	private static final int ZERO_VALUE = 0;
																								
	private enum RomanSymbol {

		I("I"), V("V"), X("X"), L("L"), C("C"), D("D"), M("M");

		private static final int MULTIPLIES_TWICE_THE_PREVIOUS_SYMBOL = 2;
		private static final int MULTIPLIES_FIVE_TIMES_THE_PREVIOUS_SYMBOL = 5;

		RomanSymbol(String romanSymbol) {}

		public String moveToPreviousUnit() {

			String result = "";

			switch (this) {
			case I:
				result = this.toString();
				break;
			case V:
			case L:
			case D: result = repeatASymbol(previousSymbol(), MULTIPLIES_FIVE_TIMES_THE_PREVIOUS_SYMBOL);

				break;
			case X:
			case C:
			case M: result = repeatASymbol(previousSymbol(), MULTIPLIES_TWICE_THE_PREVIOUS_SYMBOL);
				break;

			}

			return result;
		}

		private RomanSymbol previousSymbol() {

			int firstSymbolWithPrevious = 1;
			
			for (int index = firstSymbolWithPrevious; index < RomanSymbol.values().length; index++) {
				if (RomanSymbol.values()[index] == this)
					return RomanSymbol.values()[index - 1];

			}
			return this;
		}
		
		private RomanSymbol nextSymbol() {

			int lastSymbolWithNext = RomanSymbol.values().length - 1;
			
			for (int index = 0; index < lastSymbolWithNext; index++) {
				if (RomanSymbol.values()[index] == this)
					return RomanSymbol.values()[index + 1];

			}
			return this;
		}
		
		private String repeatASymbol(RomanSymbol symbol, int ntimes) {
			
			String repeating = "";
			
			for(int i=0; i < ntimes; i++) {
				repeating += symbol.toString();
			}
			
			return repeating;
		}
		
		public String fourSymbolsSeemsTooMuch() {
			return this.toString() +  nextSymbol().toString();
		}
		
		public String nineMeansSubstraction() {
			
			return previousSymbol().toString() +  nextSymbol().toString();
		}

	}

	public static String convert(int digits) {

		if (digits == ZERO_VALUE)
			return "";

		String romanOnes = listOfRomanOnes(digits);

		romanOnes = replaceSymbolsToGreaterUnit(romanOnes);
				
		romanOnes =replaceSameFourSymbolsAfterAGreaterOne(romanOnes);
		
		romanOnes = replaceSameFourSymbols(romanOnes);

		return romanOnes;
	}
	
	private static String replaceSymbolsToGreaterUnit(String romanOnes) {
		for (RomanSymbol current : RomanSymbol.values()) {
			
			romanOnes = romanOnes.replaceAll(current.moveToPreviousUnit(), current.toString());
		}
		return romanOnes;
	}
	
	private static String replaceSameFourSymbols(String romanOnes) {
		
		for (RomanSymbol current : RomanSymbol.values()) {

			String search = current.repeatASymbol(current, 4);
			romanOnes = romanOnes.replaceAll(search, current.fourSymbolsSeemsTooMuch());
		}
		
		return romanOnes;
	}
	
	
	private static String replaceSameFourSymbolsAfterAGreaterOne(String romanOnes) {
		
		for (RomanSymbol current : RomanSymbol.values()) {

			String symbolString = current.toString();
			String search = symbolString + current.repeatASymbol(current.previousSymbol(), 4);	
			romanOnes = romanOnes.replaceAll(search, current.nineMeansSubstraction());
		}

		return romanOnes;
	}	
	


	private static String listOfRomanOnes(int digits) {

		String romanOnes = "";

		for (int i = 0; i < digits; i++) {
			romanOnes += RomanSymbol.I;
		}
		return romanOnes;
	}
}