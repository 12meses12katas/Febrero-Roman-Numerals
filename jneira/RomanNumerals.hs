module RomanNumerals (intToRoman,romanToInt) where
import Prelude hiding (floor)
import Control.Monad

type RomanNumber=String
arabics=[1,4,5,9,10,40,50,90,100,400,500,900,1000]
romans=["I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M"]

arabicsRomans :: [(Int,RomanNumber)]
arabicsRomans=zip arabics romans

romansArabics :: [(RomanNumber,Int)]
romansArabics=zip romans arabics

intToRoman :: Int -> RomanNumber
intToRoman 0=""
intToRoman num= 
	case lookup num arabicsRomans of
		Just roman-> roman
		Nothing-> intToRoman x ++ intToRoman y
		where 	x= floor num arabics
			y= num - x	

floor :: (Ord a) => a -> [a] -> a
floor x=maximum.filter(<= x) 

(<+>)=liftM2 (+)

romanToInt :: RomanNumber -> Maybe Int
romanToInt []= Nothing
romanToInt [x] = lookup [x] romansArabics
romanToInt (x:y:xs) = 
	case lookup [x,y] romansArabics of
		Nothing-> rtoi [x] <+> rtoi (y:xs)
		num-> num <+> rtoi xs
	where 	rtoi=romanToInt 
