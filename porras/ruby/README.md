# Ruby implementation of February http://www.12meses12katas.com/

Tested with Ruby 1.9.2 & RSpec 2.4.0 (it won't work for sure with Ruby < 1.9)

To run the tests:

    $ rspec roman_numerals.rb
    
To play with the methods:

    $ irb -r ./roman_numerals.rb 
    >> 823.to_roman
    => "DCCCXXIII"
    >> "XXVII".to_arabic
    => 27

Exit the shell with ^D (it'll run the tests before exiting)