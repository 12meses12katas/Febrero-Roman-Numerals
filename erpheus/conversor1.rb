class String

def to_roman ()
  numero=self
  
  #database
  none=[]
  rm=["M"]
  rc=["C","D"]
  rd=["X","L"]
  ru=["I","V"]
  order=[ru,rd,rc,rm,none]
  
  #code
  
  numeros=numero.to_s.split("")
  i=0
  resultado=""
  numeros.reverse.each do |d|
    d=d.to_i
    aarray = order[i] 
    i += 1
    aarrayn=order[i]
    if d==9
      resultado=aarray[0]+aarrayn[0]+resultado
    elsif d==4
      resultado=aarray[0]+aarray[1]+resultado
    elsif d>=5
      resultado=aarray[1]+aarray[0]*(d-5)+resultado
    elsif d<5
      resultado=aarray[0]*d+resultado
    end
  end
   return resultado
end

def to_arabic ()
  numero=self
  correspondencia=[["CM",900],["CD",400],["XC",90],["XL",40],["IX",9],["IV",4],["M",1000],["D",500],["C",100],["L",50],["X",10],["V",5],["I",1]]
  numero=numero.upcase
  resultado=0
  correspondencia.each do |arr|
    while numero.to_s.include?(arr[0])
      resultado+=arr[1]
      numero[arr[0]]=""
    end  
  end
  return resultado.to_s
end

end

answer=""
puts "Enter any number < 3999 or a roman number or exit"
while answer!="exit"
  answer=gets.chomp
  if answer.to_i.to_s==answer
    puts answer.to_roman
  elsif answer!="exit"
    puts answer.to_arabic
  end
end
