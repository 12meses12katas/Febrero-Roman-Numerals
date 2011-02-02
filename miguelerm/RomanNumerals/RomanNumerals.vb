Imports System.Runtime.CompilerServices

Public Module RomanNumerals

    Private Const I = "I"
    Private Const IV = "IV"
    Private Const V = "V"
    Private Const IX = "IX"
    Private Const X = "X"
    Private Const XL = "XL"
    Private Const L = "L"
    Private Const XC = "XC"
    Private Const C = "C"

    <Extension()>
    Public Function ToRoman(ByVal Number As Integer) As String

        If Number = 0 Then
            Return ""
        ElseIf Number < 4 Then
            Return I.PadLeft(Number, I)
        ElseIf Number = 4 Then
            Return IV
        ElseIf Number < 9 Then
            Return V + (Number - 5).ToRoman()
        ElseIf Number = 9 Then
            Return IX
        ElseIf Number < 40 Then
            Return X + (Number - 10).ToRoman()
        ElseIf Number < 50 Then
            Return XL + Number.UnitPart().ToRoman()
        ElseIf Number < 90 Then
            Return L + (Number - 50).ToRoman()
        ElseIf Number < 100 Then
            Return XC + (Number - 90).ToRoman()
        ElseIf Number < 1000 Then
            Return C + (Number - 100).ToRoman()
        Else
            Throw New ArgumentOutOfRangeException("Number")
        End If

    End Function

    <Extension()>
    Private Function UnitPart(ByVal Number As Integer) As Integer
        Return Number - Number.TensPart()
    End Function

    <Extension()>
    Private Function TensPart(ByVal Number As Integer) As Integer
        Return Number.Tens() * 10
    End Function

    <Extension()>
    Private Function Tens(ByVal Number As Integer) As Integer
        Return Number \ 10
    End Function


End Module
