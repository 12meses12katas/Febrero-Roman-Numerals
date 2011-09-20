/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.prietopalacios.josemanuel.numerosromanos;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

/**
 *
 * @author jprieto
 */
public class NumerosRomanosTest {

    @Test
    public void testNumeroRomano() throws Exception {
        NumerosRomanos nr = new NumerosRomanos();
        assertEquals("", "XV", nr.calculaNumeroRomano(15));
        assertEquals("", "CL", nr.calculaNumeroRomano(150));
        assertEquals("", "CLI", nr.calculaNumeroRomano(151));
        assertEquals("", "CLI", nr.calculaNumeroRomano(151));
        assertEquals("", "MMXI", nr.calculaNumeroRomano(2011));
        assertEquals("", "MCDXCII", nr.calculaNumeroRomano(1492));
    }
}
