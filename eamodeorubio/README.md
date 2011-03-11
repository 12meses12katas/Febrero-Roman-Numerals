RomanNumerals in JS by Enrique Amodeo Rubio
=========

Three different solutions in JS

Solution 1: No special roman numerals & "classic" JS
==========

I've forced myself to code this kata solution following some restrictions:

* Reasonably performance. At least O(n)
* Do not use 'IV', 'IX', 'XL', 'CD', etc. as basic roman numerals.
* Use JavaScript compatible with IE6. Those fancy iterators are not allowed.
* Do not use RegExp.
* Object oriented style, not procedural.
* The table of roman numerals to arabic numbers must be parametrizable

This is the most complex solution but the more funny.

Solution 2: No special roman numerals but using regexps & iterators
======

I've provided an alternative solution using regexps and iterator methods.

You can compare this more sofisticated solution with the more classic one.
This one won't run in old browsers, since need JavaScript 1.8 (ECMA-262 5th Edition)

Is this solution more readable? What solution do you prefer?

Notice the trick with the regular expression.

Solution 3: Using special roman numerals and with regexps and iterators
=====

Like solution 2 but allowing 'IV', 'IX', etc. as basic roman numerals
This solution is the more simple one since no algorithm for the "substract rule" is needed.
