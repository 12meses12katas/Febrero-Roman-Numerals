Imports System.Text
Imports Mike.Katas


<TestClass()>
Public Class RomanNumeralsTest

    'Data-Driven Test

    <TestMethod()>
    Public Sub ToRoman()

        Assert.AreEqual("I", 1.ToRoman())
        Assert.AreEqual("II", 2.ToRoman())
        Assert.AreEqual("III", 3.ToRoman())
        Assert.AreEqual("IV", 4.ToRoman())
        Assert.AreEqual("V", 5.ToRoman())
        Assert.AreEqual("VI", 6.ToRoman())
        Assert.AreEqual("VII", 7.ToRoman())
        Assert.AreEqual("VIII", 8.ToRoman())
        Assert.AreEqual("IX", 9.ToRoman())
        Assert.AreEqual("X", 10.ToRoman())
        Assert.AreEqual("XIII", 13.ToRoman())
        Assert.AreEqual("XIV", 14.ToRoman())
        Assert.AreEqual("XVIII", 18.ToRoman())
        Assert.AreEqual("XIX", 19.ToRoman())
        Assert.AreEqual("XX", 20.ToRoman())
        Assert.AreEqual("XXIII", 23.ToRoman())
        Assert.AreEqual("XXVIII", 28.ToRoman())
        Assert.AreEqual("XXIX", 29.ToRoman())
        Assert.AreEqual("XXX", 30.ToRoman())
        Assert.AreEqual("XXXVIII", 38.ToRoman())
        Assert.AreEqual("XL", 40.ToRoman())
        Assert.AreEqual("XLV", 45.ToRoman())
        Assert.AreEqual("L", 50.ToRoman())
        Assert.AreEqual("LIV", 54.ToRoman())
        Assert.AreEqual("LX", 60.ToRoman())
        Assert.AreEqual("LXXXVIII", 88.ToRoman())
        Assert.AreEqual("XC", 90.ToRoman())
        Assert.AreEqual("XCIX", 99.ToRoman())
        Assert.AreEqual("C", 100.ToRoman())
        Assert.AreEqual("CC", 200.ToRoman())

    End Sub

End Class
