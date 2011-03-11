'''
Created on 01/03/2011

@author: Fergus
'''
class Numerals:        

        def __init__(self):
            self.romanos = {"I" : 1, "V":5, "X":10, 
                      "L":50, "C":100, "D":500, "M":1000}
            self.numeros = {1 : "I", 5:"V", 10:"X", 
                      50:"L", 100:"C", 500:"D", 1000:"M"}
            self.tuplaNumeros=(1000,500,100,50,10,5,1)
        def romanoANumero(self, parametro):
            'Invertir orden'
            parametro=parametro[::-1]
            'Recorrer numero romano'
            mayor="I"
            resultado=0
            for letraSeleccionada in parametro:
                if self.romanos[mayor] <= self.romanos[letraSeleccionada]:
                    resultado = resultado + self.romanos[letraSeleccionada]
                    mayor = letraSeleccionada
                else:
                    resultado = resultado - self.romanos[letraSeleccionada]                    
            return resultado
        def numeroARomano(self, parametro):
            resultado=""
            for numero in self.tuplaNumeros:
                cociente=parametro//numero;
                parametro=parametro-(parametro//numero)*numero
                while cociente>0:
                    resultado = resultado + self.numeros[numero]
                    cociente = cociente - 1
            resultado=resultado.replace("IIII", "IV")   
            resultado=resultado.replace("VIV", "IX")
            resultado=resultado.replace("XXXX", "XL")
            resultado=resultado.replace("XXXX", "XL")    
            resultado=resultado.replace("LXL", "XC")  
            resultado=resultado.replace("CCCC", "CD")
            resultado=resultado.replace("DCD", "CM")    
            return resultado
              

