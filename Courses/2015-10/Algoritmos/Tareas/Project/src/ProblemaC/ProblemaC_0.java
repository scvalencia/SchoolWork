// DAlgo 2015-10
// Problema B    : Solucion propia
// Grupo         : 01
// Autoras       : Paola Latino(201013111), Daniela Amador(201325772)

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;

public class ProblemaC_0 
{
	private static boolean tocoborde1, tocoborde2, tocoborde3;
	public static void main(String[] args) throws Exception 
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String lineain,data[];
		int N, M;
		int cx, cy, cz;

		while (true)
		{
			lineain = br.readLine();
			data = lineain.split(" ");
			N = Integer.parseInt(data[0]);
			M = Integer.parseInt(data[1]);
			if (M==0 && N ==0) break;				// terminación de la entrada
			boolean[][] tablero=new boolean[N+1][N+1];
			
			//Llenar el tablero
			for(int i=0; i<M; i++)
			{
				lineain = br.readLine();
				data = lineain.split(" ");
				cx = Integer.parseInt(data[0]);
				cy = Integer.parseInt(data[1]);
				cz = Integer.parseInt(data[2]);
				tablero[cy+cx][cx]=true;
			}

			//Confirmar que se cargo correctamente el tablero
			/*
			for(int y=0; y<N+1; y++)
			{
				for(int x=0; x<=y; x++)
				{
					if(tablero[y][x]) System.out.print('X'+" ");
					else System.out.print('O'+" "); 
				}
				System.out.println();
			}*/
			// Si se cargo correctamente 
			/*
			TABLERO 1:			TABLERO 2:				TABLERO 3:
			O 					X 						O
			X X 				O X 					O X 	
			O X O 				X O O
			O X O X
			*/

			//Preparamos el grafo de tamanio V
			int V=(N+1)*(N+1);
			@SuppressWarnings("unchecked")
			ArrayList<Integer>[] adj=new ArrayList[V];
			for(int i=0;i<V; i++) adj[i]=new ArrayList<Integer>();
			//Estructuras auxiliares para saber si esta en un borde
			boolean[] estaBorde1=new boolean[V];
			boolean[] estaBorde2=new boolean[V];
			boolean[] estaBorde3=new boolean[V];

			for(int y=0; y<N+1; y++)
			{
				for(int x=0; x<=y; x++)
				{
					int id=(x+y*(N+1));
					//Quienes pertecen a que borde
					if(x==y && tablero[y][x]) estaBorde1[id]=true;
					if(x==0 && tablero[y][x]) estaBorde2[id]=true;
					if(y==N && tablero[y][x]) estaBorde3[id]=true;
					//Los arcos entre los nodos del grafo
					//Arcos que van hacia los lados
					if(x>=1 && tablero[y][x] && tablero[y][x-1])
					{
						int idOtro=((x-1)+y*(N+1));
						adj[id].add(idOtro);
						adj[idOtro].add(id);
					}
					//Arcos que van hacia abajo y hacia la diagonal
					if(y<N && tablero[y][x])
					{
						//Hacia abajo
						if(tablero[y+1][x])
						{
							int idOtro=(x+(y+1)*(N+1));
							adj[id].add(idOtro);
							adj[idOtro].add(id);
						}
						//En diagonal
						if(tablero[y+1][x+1])
						{
							int idOtro=((x+1)+(y+1)*(N+1));
							adj[id].add(idOtro);
							adj[idOtro].add(id);
						}
					}
				}
			}
			//En caso de que las esquinas no cuenten se retiran
			//estaBorde1[0]=estaBorde2[0]=estaBorde3[0]=false;//esquina arriba
			//estaBorde1[V-1-N]=estaBorde2[V-1-N]=estaBorde3[V-1-N]=false;//esquina abajo izquierda
			//estaBorde1[V-1]=estaBorde2[V-1]=estaBorde3[V-1]=false;//esquina abajo derecha
			// imprimir el grafo para ver que las relaciones quedaron bien hechas.
			//for(int i=0; i<adj.length; i++) System.out.println(i+": "+adj[i]);
			/*
			TABLERO 1:					TABLERO 2:			TABLERO 3:
			0: [4, 5]					0: [4]				0: []
			1: []						1: []				1: []
			2: []						2: []				2: []
			3: []						3: []				3: []
			4: [9, 5]					4: [0]		
			5: [4, 9]					5: []
			6: []						6: []
			7: []						7: []
			8: []						8: []
			9: [4, 5, 13]
			10: []
			11: []
			12: []
			13: [9]
			14: []
			15: []
			*/
			//Ya con las estructuras de datos listas podemos solucionar el problema
			char resp = solve(adj, estaBorde1, estaBorde2, estaBorde3, N, tablero);
			System.out.println(resp+"");
		}
	}

	private static char solve(ArrayList<Integer>[] adj, boolean[] estaBorde1, boolean[] estaBorde2, boolean[] estaBorde3, int N, boolean[][] tablero)
	{
		int[] marcados=new int[adj.length];
		Arrays.fill(marcados, -1);
		for(int y=0; y<N+1; y++)
		{
			for(int x=0; x<=y; x++)
			{
				int id=(x+y*(N+1));
				if(marcados[id]==-1 && tablero[y][x])
				{
					tocoborde1=tocoborde2=tocoborde3=false;
					if(dfs(id, adj, marcados, id, estaBorde1, estaBorde2, estaBorde3))
						return 'N';
				}
			}
		}
		return 'B';
	}

	private static boolean dfs(int source, ArrayList<Integer>[] adj, int[] marcados, int v, boolean[] estaBorde1, boolean[] estaBorde2, boolean[] estaBorde3)
	{
		marcados[v]=source;
		if(estaBorde1[v]) tocoborde1=true;
		if(estaBorde2[v]) tocoborde2=true;
		if(estaBorde3[v]) tocoborde3=true;

		if(tocoborde1 && tocoborde2 && tocoborde3) return true;
		for(int w: adj[v])
		{
			if(marcados[w]!=source)
			{
				if(dfs(source, adj, marcados, w, estaBorde1, estaBorde2, estaBorde3))
					return true;
			}
		}
		return false;
	}
}