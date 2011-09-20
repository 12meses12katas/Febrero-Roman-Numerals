/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.prietopalacios.josemanuel.numerosromanos;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author jprieto
 */
public class NumerosRomanos {

    private enum TipoPeso {

        UNIDADES(1),
        DECENAS(10),
        CENTENAS(100),
        MILLARES(1000);
        private Integer tipo;

        TipoPeso(Integer tipo) {
            this.tipo = tipo;
            EnumHelper.correspondencesMap.put(tipo, this);
        }

        public Integer getTipo() {
            return tipo;
        }

        public static TipoPeso convert(Integer name) {
            return EnumHelper.correspondencesMap.get(name);
        }

        private static final class EnumHelper {

            static final Map<Integer, TipoPeso> correspondencesMap =
                    new HashMap<Integer, TipoPeso>();
        }
    }

    private class Numero {

        private int numeroEntero;
        private String numeroString;
        private int unidades;

        public int getCentenas() {
            return centenas * 100;
        }

        public void setCentenas(int centenas) {
            this.centenas = centenas;
        }

        public int getDecenas() {
            return decenas * 10;
        }

        public void setDecenas(int decenas) {
            this.decenas = decenas;
        }

        public int getMillares() {
            return millares * 1000;
        }

        public void setMillares(int millares) {
            this.millares = millares;
        }

        public int getUnidades() {
            return unidades;
        }

        public void setUnidades(int unidades) {
            this.unidades = unidades;
        }
        private int decenas;
        private int centenas;
        private int millares;

        public Numero(int numero) {
            numeroEntero = numero;
            numeroString = String.valueOf(numero);
            transforma();
        }

        public Numero(String numero) {
            numeroEntero = Integer.parseInt(numero);
            numeroString = numero;
            transforma();
        }

        private void transforma() {
            if (numeroString.length() == 1) {
                unidades = numeroEntero;
            }

            if (numeroString.length() == 2) {
                decenas = numeroEntero / 10;
                String unidad = numeroString.substring(1, numeroString.length());

                unidades = Integer.parseInt(unidad);
            }

            if (numeroString.length() == 3) {
                centenas = numeroEntero / 100;
                String decena = numeroString.substring(1, numeroString.length());

                decenas = Integer.parseInt(decena) / 10;
                String unidad = decena.substring(1, decena.length());

                unidades = Integer.parseInt(unidad);
            }

            if (numeroString.length() == 4) {
                millares = numeroEntero / 1000;
                String millar = numeroString.substring(1, numeroString.length());

                centenas = Integer.parseInt(millar) / 100;
                String decena = millar.substring(1, millar.length());

                decenas = Integer.parseInt(decena) / 10;
                String unidad = decena.substring(1, decena.length());

                unidades = Integer.parseInt(unidad);
            }
        }
    }
    private static final HashMap<Integer, String> romanNumberTable = new HashMap<Integer, String>();

    static {
        romanNumberTable.put(1, "I");
        romanNumberTable.put(5, "V");
        romanNumberTable.put(10, "X");
        romanNumberTable.put(50, "L");
        romanNumberTable.put(100, "C");
        romanNumberTable.put(500, "D");
        romanNumberTable.put(1000, "M");
    }

    private String genericCovert(final int numero, TipoPeso tipoPeso) {
        int tipoUnidad = tipoPeso.getTipo();
        String romanNumber = "";
        if ((numero > 0) && (numero < (10 * tipoUnidad))) {
            if (numero < (5 * tipoUnidad)) {
                if (numero == (4 * tipoUnidad)) {
                    romanNumber = (String) romanNumberTable.get(tipoUnidad);
                    romanNumber += (String) romanNumberTable.get(5 * tipoUnidad);
                } else {
                    int aux = numero / tipoUnidad;
                    romanNumber = calculateNumber(aux, romanNumber, tipoUnidad);
                }
            } else {
                if (numero == (9 * tipoUnidad)) {
                    romanNumber += (String) romanNumberTable.get(tipoUnidad);
                    romanNumber += (String) romanNumberTable.get(tipoUnidad * 10);
                } else {
                    int unidad = (numero / tipoUnidad) - 5;
                    romanNumber = (String) romanNumberTable.get(5 * tipoUnidad);
                    romanNumber = calculateNumber(unidad, romanNumber, tipoUnidad);
                }
            }
        }

        return romanNumber;
    }

    private String calculateNumber(int aux, String romanNumber, int tipoUnidad) {
        for (int i = 1; i <= aux; i++) {
            romanNumber += (String) romanNumberTable.get(tipoUnidad);
        }
        return romanNumber;
    }

    public String calculaNumeroRomano(int numero) {
        String unidades = "";
        String decenas = "";
        String centenas = "";
        String millares = "";

        Numero num = new Numero(numero);
        unidades = genericCovert(num.getUnidades(), TipoPeso.UNIDADES);
        decenas = genericCovert(num.getDecenas(), TipoPeso.DECENAS);
        centenas = genericCovert(num.getCentenas(), TipoPeso.CENTENAS);
        millares = genericCovert(num.getMillares(), TipoPeso.MILLARES);

        return millares + centenas + decenas + unidades;
    }
}
