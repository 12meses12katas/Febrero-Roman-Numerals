/* 
 * File:   romannum.cpp
 * Author: c[at]eoncoder.com
 *
 * Created on February 27, 2011, 10:55 AM
 */

#include <cstdlib>
#include <iostream>
#include <string>
#include <stdio.h>
#include <string.h>
#include <math.h>

#define D_BEGIN_NUM  1
#define D_MAX_NUM  10000

const std::string g_strRom[] = {"I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M" } ;
const int g_numValue[]            = { 1,    4,   5,    9,   10,   40,  50,   90, 100,  400, 500,  900, 1000 };


const char * dec_to_roman( int nValue )
{
    static std::string v_strReturn = "" ;
    v_strReturn = "" ;

    int v_nSize = sizeof( g_numValue ) ;
    v_nSize /= sizeof(int ) ;

    for ( int c = v_nSize ; c >= 0; c-- )
    {
        int v_nValue = g_numValue[c] ;
        while (nValue >= v_nValue && v_nValue)
        {
            nValue -= v_nValue ;
            v_strReturn += g_strRom[c] ;
        }
    }

    return v_strReturn.c_str() ;

}

int roman_to_dec( const char * pszRoman )
{
    int v_nReturn = 0 ;
    std::string v_strValue = pszRoman ;

    int v_nSize = sizeof( g_numValue ) ;
    v_nSize /= sizeof(int ) ;

    for ( int c = 0 ; c < v_strValue.length() ; c++ )
    {
        for ( int i = v_nSize-1; i >= 0  ; i-- )
        {
            if ( !strncmp( v_strValue.c_str()+c, g_strRom[i].c_str(), g_strRom[i].length() ) )
            {
                v_nReturn += g_numValue[i] ;
                if (g_strRom[i].length() == 2 )
                {
                    c++ ;
                    break ;
                }
            }

        }

    }

    return v_nReturn ;
}

int main(int argc, char** argv) {

    for ( int i = D_BEGIN_NUM ; i <= D_MAX_NUM ; i++ )
    {        
        const char * v_pszResult = dec_to_roman( i ) ;
        int v_nValue = roman_to_dec( v_pszResult ) ;
        std::cout << i << " [" << v_pszResult <<  "\t == " << v_nValue << std::endl ;
        // error check
        if ( v_nValue != i )
        {
            std::cout << "ERROR" << std::endl ;
            break ;
        }       

       // getchar() ;
    }
    return 0;
}

