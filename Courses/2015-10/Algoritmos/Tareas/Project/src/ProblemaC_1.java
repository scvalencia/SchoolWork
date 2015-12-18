/*
 * Curso: Diseño y análisis de algoritmos
 * Semestre: 2015-10
 * Problema: C - Solución
 * Grupo: 08
 * Autores: Laura Ávila (201212736), Sebastián Valencia (201111578)
 *
*/

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class ProblemaC_1 {
	
	private static boolean[][] matriz;

	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String lineain,data[];
		int M, N, x, z;
		int ind = 0;
		while (true){
			lineain = br.readLine();
			data = lineain.split(" ");
			N = Integer.parseInt(data[0]);
			M = Integer.parseInt(data[1]);
			if (M==0 && N ==0) break;
			if(ind==0)
			{
				ind++;
				System.out.println();
			}
			matriz = new boolean [N+1][N+1];
			for (int i = 0; i < M; i++)
			{
				lineain = br.readLine();
				data = lineain.split(" ");
				x = Integer.parseInt(data[0]);
				z = Integer.parseInt(data[2]);
			 	matriz[x][N-z] = true;
			}
			
			boolean ladoY = false;
			boolean ladoZ = false;
			boolean resp=false;
			for (int j = 0; j < matriz.length&&!resp; j++) {
				if(matriz[0][j]){
				 resp = solve(0,j,ladoY,ladoZ);
				}
			}
			String ans = resp?"N":"B";
			System.out.println(ans);
			
			
		}
	}

	public static boolean solve(int a, int b, boolean y, boolean z){
		
		boolean resp1 = false;
		boolean resp2 = false;
		boolean resp3 = false;
		matriz[a][b] = false;
		
		if(!y||!z)
		{
			if(a==b)
				y=true;
			if(b==matriz.length-1)
				z=true;
			if(y&&z)
				return true;
			else
			{
				if(a!=b){
					int d = a+1;
					if(matriz[d][b])
						resp3 = solve(d,b,y,z);
				}
				if(b<matriz.length-1){
					b++;
					int c = a+1;
					if(matriz[a][b])
						resp1 = solve(a,b,y,z);
					if(matriz[c][b])	
						resp2 = solve(c,b,y,z);
				}
			}	
		}
		return resp1||resp2||resp3;
	}
}
