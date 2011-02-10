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
    
