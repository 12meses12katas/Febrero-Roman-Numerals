class GetAttrMetaclass(type):
    def __getattr__(self, name):
        name = name.replace("IV","IIII")
        name = name.replace("IX","VIIII")
        name = name.replace("XL","XXXX")
        name = name.replace("XC","LXXXX")
        name = name.replace("CD","CCCC")
        return name.count("I")    \
            + (name.count("V") * 5)   \
            + (name.count("X") * 10)  \
            + (name.count("L") * 50)   \
            + (name.count("C") * 100)   \
            + (name.count("D") * 500)
class Roman():
    __metaclass__ = GetAttrMetaclass
   
    @staticmethod
    def to_roman(number):
        D = number / 500
        number = number % 500 
        C = number / 100
        number = number % 100 
        L = number / 50
        number = number % 50
        X = number / 10
        number = number % 10
        V = number / 5
        number = number % 5

        number_roman = ("D" * D) + ("C" * C) + ("L" * L) + ("X" * X) + ("V" * V) + ("I" * number)
        return number_roman.replace("CCCC", "CD").replace("LXXXX", "XC").replace("XXXX", "XL").replace("VIIII","IX").replace("IIII","IV")
