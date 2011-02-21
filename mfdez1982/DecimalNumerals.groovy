class DecimalNumerals
{    
    private int decimal

    public String eval()
    {
        if (decimal >= 1000)
            return 'M' + new DecimalNumerals(decimal:decimal-1000).eval()
        if (decimal >= 900)
            return 'CM' + new DecimalNumerals(decimal:decimal-900).eval()
        if (decimal >= 500)
            return 'D' + new DecimalNumerals(decimal:decimal-500).eval()
        if (decimal >= 400)
            return 'CD' + new DecimalNumerals(decimal:decimal-400).eval()
        if (decimal >= 100)
            return 'C' + new DecimalNumerals(decimal:decimal-100).eval()
        if (decimal >= 90)
            return 'XC' + new DecimalNumerals(decimal:decimal-90).eval()
        if (decimal >= 50)
            return 'L' + new DecimalNumerals(decimal:decimal-50).eval()
        if (decimal >= 40)
            return 'XL' + new DecimalNumerals(decimal:decimal-40).eval()
        if (decimal >= 10)
            return 'X' + new DecimalNumerals(decimal:decimal-10).eval()
        if (decimal == 9)
            return 'IX'
        if (decimal >= 5)
            return 'V' + new DecimalNumerals(decimal:decimal-5).eval()
        if (decimal == 4)
            return 'IV'
        if (decimal == 0)
            return ''
            
        String roman = ''
        for (i in 1..decimal)
           roman += 'I'           
        return roman
    }
}