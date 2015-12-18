/*
 * Curso: Diseño y análisis de algoritmos
 * Semestre: 2015-10
 * Problema: C - Solución
 * Grupo: 08
 * Autores: Laura Ávila (201212736), Sebastián Valencia (201111578)
 *
*/

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;

/**
 * Created by scvalencia on 5/25/15.
 */
public class ProblemaB_1 {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String inputLine, parse[];
        String nombre1,  nombre2, preferenciasN1, preferenciasN2;

        while(true) {
            inputLine = br.readLine();
            parse = inputLine.split(" ");
            nombre1 = parse[0]; nombre2 = parse[1];
            if(nombre1.equals(("*")) && nombre2.equals("*")) break;

            preferenciasN1 = br.readLine();
            preferenciasN1 = preferenciasN1.substring(0, preferenciasN1.length() - 2);

            preferenciasN2 = br.readLine();
            preferenciasN2 = preferenciasN2.substring(0, preferenciasN2.length() - 2);

            System.out.println(solve(preferenciasN1, preferenciasN2));
        }
    }

    private static String solve(String preferenciasN1, String preferenciasN2) {
        HashMap<String, LinkedList<String>> count = new HashMap<String, LinkedList<String>>();
        int inversionCount = 0;
        String[] l1 = preferenciasN1.split(" , ");
        String[] l2 = preferenciasN2.split(" , ");

        count = shapeGraph(l1, l2);
        inversionCount = countCycles(count);

        return (inversionCount > 1) ? "N" : (inversionCount == 1) ? "P" : "C";
    }

    private static int countCycles(HashMap<String, LinkedList<String>> count) {
        // Hacer DFS Y CONTAR CICLOS, RETORNAR EL CONTEO
        return -1;
    }

    private static HashMap<String, LinkedList<String>> shapeGraph(String[] l1, String[] l2) {
        HashSet<String> items = new HashSet<String>();
        HashMap<String, LinkedList<String>> ans = new HashMap<String, LinkedList<String>>();
        for(String s1 : l1) {
            String[] i = s1.split(" ");
            for(String s2 : i)
                items.add(s2);
        }
        for(String s1 : l2) {
            String[] i = s1.split(" ");
            for(String s2 : i)
                items.add(s2);
        }
        for(String s1 : items) {
            ans.put(s1, new LinkedList<String>());
        }

        for(String s1 : l1) {
            String[] i = s1.split(" ");
            for(int j = 0; j < i.length; j++)
                for(int k = j + 1; k < i.length; k++) {
                    ans.get(i[j]).add(i[k]);
                }
        }

        for(String s1 : l2) {
            String[] i = s1.split(" ");
            for(int j = 0; j < i.length; j++)
                for(int k = j + 1; k < i.length; k++) {
                    ans.get(i[j]).add(i[k]);
                }
        }

        for(String s1 : items) {
            System.out.print(s1 + " : ");
            for(String s : ans.get(s1))
                System.out.print(s + " ");
            System.out.println();
        }

        return ans;
    }

}
