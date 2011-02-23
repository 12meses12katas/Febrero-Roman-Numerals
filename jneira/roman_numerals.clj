(ns roman-numerals
  (:use clojure.test))

(def digits ["I" "IV" "V" "IX" "X" "XL" "L" "XC" "C" "CD" "D" "CM" "M"])
(def digits-ints (zipmap [1 4 5 9 10 40 50 90 100 400 500 900 1000] digits))

(defn floor [nums n]
  (first (filter #(<= % n) (reverse (sort nums)))))   

(defn from-int [n]
  (when (and n (> n 0))
    (let [max (floor (keys digits-ints) n)]
      (str (digits-ints max) (from-int (- n max))))))

(deftest conversion-from-int-to-roman
  (are [x y] (= (from-int x) y)
       nil nil
       -1 nil
       0 nil
       1 "I" 2 "II" 3 "III" 4 "IV" 5 "V"
       6 "VI" 9 "IX" 49 "XLIX" 440 "CDXL" 1949 "MCMXLIX"))

(defn reverse-map [m] (zipmap (vals m) (keys m)))

(def ints-digits (reverse-map digits-ints))

(defn to-int [s]
  (ints-digits s))

(deftest conversion-from-roman-to-int
  (are [x y] (= (to-int x) y)
       "I" 1 "II" 2 "III" 3))

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
