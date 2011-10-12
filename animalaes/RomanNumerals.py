class RomanNumerals(object):

    def __init__(self):
        #inicializaciones para la conversion de entero a romano
        self.values =[ 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 ]
        self.symbols =[ "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" ]
        #inicializaciones para la conversion de romano a entero
        self.value =[ 1000, 500, 100, 50, 10, 5, 1 ]
        self.symbol = "MDCLXVI";
        
    def intToRoman(self, num):
        '''
            Realiza la conversion de un numero entero a romano.
        '''
        output = ""
        index = 0
        
        #finalizamos cuando el numero es 0
        while num > 0:
            while num >= self.values[index]:
                #anadimos el simbolo a la solucion
                output = output + self.symbols[index]
                #restamos el valor numerico
                num = num - self.values[index]
            index = index + 1
        
        return output
        
    def romanToInt(self, num):
        '''
            Realiza la conversion de un numero romano a entero
        '''
        indexSymbol = 0
        output = 0
        index = 0
        valid = True
        lastValue = 0
        
        while valid and index < len(num):
            #obtenemos el simbolo
            car = num[index]
            #obtenemos el indice del simbolo
            indexSymbol = self.symbol.index(car)
            if(indexSymbol >= 0):
                #sumamos su valor correspondiente
                output = output + self.value[indexSymbol]
                # si el valor es mayor que el ultimo valor, tenemos que restar el ultimo valor sumado
                if self.value[indexSymbol] > lastValue:
                    output = output - 2 * lastValue
                lastValue = self.value[indexSymbol]
            else:
                valid = False
            index = index + 1
        
        return output
                    
        
        
        
        
        
        