class RomanNumerals
{
	enum ORDER { I, V, X, L, C, D, M }
	Map VALUES = [ I:1, V:5, X:10, L:50, C:100, D:500, M:1000 ]  
  
	private String roman;
	
	public int eval()
	{
		if (roman.length() == 1)
			return evalFirstLetter()	
		else if (isFirstLetterMinorThanSecond())
			return evalFromSecondLetterOn() - evalFirstLetter()
		else
			return evalFromSecondLetterOn() + evalFirstLetter()
	}
	
	private int evalFromSecondLetterOn()
	{
		new RomanNumerals(roman:removeFirstLetter()).eval()
	}
	
	private int evalFirstLetter(){
		return VALUES[roman[0]]
	}
	
	private String removeFirstLetter()
	{
		return roman[1..roman.length()-1];
	}	
	
	private boolean isFirstLetterMinorThanSecond()
	{
		return ORDER[roman[0]] < ORDER[roman[1]]
	}
}