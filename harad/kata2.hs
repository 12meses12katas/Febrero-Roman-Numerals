import Data.List
import Data.Maybe

toRoman :: Int -> String
toRoman x =
	let	iter [] = ""
		iter (x:xs) = subRoman (read [x] :: Int) (length xs) ++ iter xs
		calcNumber x symbols
			| x == 0 = ""
			| x <= 3 = take x . repeat $ (symbols !! 0)
			| x == 4 = [(symbols !! 0)] ++ calcNumber 5 symbols
			| x <= 8 = [(symbols !! 1)] ++ calcNumber (x-5) symbols
			| x == 9 = [(symbols !! 0),(symbols !! 2)]
		subRoman x pos = case pos of
			0 -> let symbols=['I','V','X'] in calcNumber x symbols
			1 -> let symbols=['X','L','C'] in calcNumber x symbols
			2 -> let symbols=['C','D','M'] in calcNumber x symbols
			3 -> take x . repeat $ 'M'
	in iter (show x)
	
fromRoman :: String -> Int
fromRoman xs =
	let 
		values=["M","1000","D","500","C","100","L","50","X","10","V","5","I","1"]
		getValue x = read $ values !! ((fromJust (elemIndex [x] values)) + 1)
		extractSubs (x:xs) amount rest
			| xs == [] = (amount,rest++[x])
			| any ((flip isPrefixOf) (x:xs)) ["CM","CD","XC","XL","IX","IV"] = 
				extractSubs (tail xs) (amount + getValue (head xs) - getValue x) rest
			| otherwise = extractSubs xs amount (rest++[x])
		extractSubs "" amount rest = (amount,rest)
		addRest xs = foldl (\acc x -> acc + (getValue x)) 0 xs
	in (addRest (snd (extractSubs xs 0 "")))+(fst (extractSubs xs 0 ""))