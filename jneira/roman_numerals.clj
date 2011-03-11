(ns roman-numerals
  (:use clojure.test)
  (:require [clojure.contrib.str-utils2 :as s]))

(def romans ["I" "IV" "V" "IX" "X" "XL" "L" "XC" "C" "CD" "D" "CM" "M"])
(def ints-romans (zipmap [1 4 5 9 10 40 50 90 100 400 500 900 1000] romans))

(defn floor [nums n]
  (apply max (filter #(<= % n) nums)))   

(defn from-int [n]
  (when (and n (> n 0))
    (let [max (floor (keys ints-romans) n)]
      (str (ints-romans max) (from-int (- n max))))))

(deftest conversion-from-int-to-roman
  (are [x y] (= (from-int x) y)
       nil nil
       -1 nil
       0 nil
       1 "I" 2 "II" 3 "III" 4 "IV" 5 "V"
       6 "VI" 9 "IX" 49 "XLIX" 440 "CDXL" 1949 "MCMXLIX"))

(defn reverse-map [m] (zipmap (vals m) (keys m)))

(def romans-ints (reverse-map ints-romans))

(defn to-int [cad]
  (let [next
        #(when-let
             [r (romans-ints
                 (s/take cad %))]
           (+ r (to-int (s/drop cad %))))]
    (or (next 2) (next 1) 0)))

(deftest conversion-from-roman-to-int
  (are [x y] (= (to-int x) y)
       "I" 1 "II" 2 "IV" 4 "V" 5
       "VI" 6 "IX" 9 "XLIX" 49 "CDXL" 440
       "MCMXLIX"))

;; Hasta aqui valdria para la kata basica, pero como esta de moda el
;; monkey patching vamos a extender unos cuantos tipos para crear una
;; funcion generica to-roman despachada en tiempo de ejecucion
  

(defprotocol Cast
  (to-roman [self]))

(extend-type java.lang.Number
  roman-numerals/Cast
  (to-roman [n] (roman-numerals/from-int (.intValue n))))

(extend-type nil
  roman-numerals/Cast
  (to-roman [s] s))

(extend-type Object
  roman-numerals/Cast
  (to-roman [s] (throw (UnsupportedOperationException.))))

(deftest castings-to-roman
  (is (thrown? UnsupportedOperationException
	       (to-roman [])))
  (is (nil? (to-roman nil)))
  (is (= (to-roman (byte 127)) "CXXVII"))
  (are [x] (= (to-roman x)  "MCMXLIX")
       (short 1949)
       (int 1949) 
       (long 1949)
       (double 1949.34566)
       (float 1949.34566)
       (BigInteger. "1949")))

(run-tests)
