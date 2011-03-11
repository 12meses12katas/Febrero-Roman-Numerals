require 'test/unit/testsuite'
require 'test/unit/ui/console/testrunner'
require 'tc_romans_numerals'


class TS_RomanNumerals
  
  def self.suite
    
    suite = Test::Unit::TestSuite.new
    
    suite << TC_RomanNumerals.suite
    
    return suite
  end
end


Test::Unit::UI::Console::TestRunner.run( TS_RomanNumerals )