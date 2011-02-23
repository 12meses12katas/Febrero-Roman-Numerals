module RomanCalculator (fromNumberToRoman) where

fromNumberToRoman :: Int -> String
fromNumberToRoman number = take number (repeat 'I')