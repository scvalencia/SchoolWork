 /*
  * Curso: Diseño y análisis de algoritmos
  * Semestre: 2015-10
  * Problema: A - Solución
  * Grupo: 08
  * Autores: Laura Ávila (201212736), Sebastián Valencia (201111578)
  *
 */


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.*;

public class ProblemaA_1 {

    public static void main(String[] args) throws Exception {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String inputLine, parse[];
        int M, N;

        while (true){
            inputLine = br.readLine();
            parse = inputLine.split(" ");

            M = Integer.parseInt(parse[0]);
            N = Integer.parseInt(parse[1]);

            if(M == 0 && N == 0)
                break;

            int[][] matrix = new int[M][N];

            for(int i = 0; i != M; i++) {
                inputLine = br.readLine();
                for(int j = 0; j != N; j++)
                    matrix[i][j] = (inputLine.charAt(j) == '1') ? 1 : 0;
            }

            int[] ans = new int[2];
            ans = solve(matrix);
            System.out.println(ans[0] + " " + ans[1]);
        }
    }

    public static int[] solve(int[][] matrix) {
        int rows = matrix.length, cols = matrix[0].length;

        int[] ans = new int[2];


        if(rows == 1 && cols == 1)
            return new int[]{matrix[0][0], matrix[0][0]};

        int[][] aux = new int[rows][cols];
        int base[] = new int[cols];

        int up, right, upright, maxSquare = -1, maxRectangle = -1;


        for(int i = 0; i != rows; i++) {
            for(int j = 0; j != cols; j++) {
                aux[i][j] = (matrix[i][j] == 0) ? 0 : 1;
                base[j] = (matrix[i][j] == 1) ? base[j] + matrix[i][j] : 0;
            }
            maxRectangle = Math.max(maxRectangle, maximumHistogram(base));
        }


        for(int i = 1; i != rows; i++)
            for(int j = 1; j != cols; j++)
                if(matrix[i][j] == 1) {

                    up = aux[i - 1][j];
                    right = aux[i][j - 1];
                    upright = aux[i - 1][j - 1];

                    aux[i][j] = Math.min(up, Math.min(right, upright)) + 1;

                    maxSquare = Math.max(maxSquare, aux[i][j]);
                }

        ans[0] = maxSquare * maxSquare;
        ans[1] = maxRectangle;

        return ans;
    }

    public static int maximumHistogram(int[] input) {
        Stack<Integer> stack = new Stack<Integer>();
        int ans = -1, currentArea = 0, i = 0, top = 0;

        while(i < input.length) {

            if(stack.empty() || input[stack.peek()] <= input[i]){
                stack.push(i);
                i++;
            } else{
                top = stack.pop();
                if(stack.empty())
                    currentArea = input[top] * i;
                else
                    currentArea = input[top] * (i - stack.peek() - 1);

                ans = Math.max(ans, currentArea);
            }
        }

        while(!stack.empty()) {

            top = stack.pop();
            if(stack.empty())
                currentArea = input[top] * i;
            else
                currentArea = input[top] * (i - stack.peek() - 1);

            ans = Math.max(ans, currentArea);
        }
        return ans;
    }
}