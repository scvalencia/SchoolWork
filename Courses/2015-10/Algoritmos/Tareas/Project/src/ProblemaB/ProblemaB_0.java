// DAlgo 2015-10
// Problema B    : Solucion propia
// Grupo         : 01
// Autoras       : Paola Latino(201013111), Daniela Amador(201325772)

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.LinkedHashMap;

public class ProblemaB_0
{
	private final static int WHITE=0, GRAY=1, BLACK=2;

	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String lineain,data[];
		LinkedHashMap<String, Integer> nodos= new LinkedHashMap<String, Integer>();
		
		while (true)
		{
			lineain = br.readLine();
			data = lineain.split(" ");
			if(data[0].equals("*") && data[1].equals("*")) break;	// terminacion de la entrada encontro "* *"

			//Aqui se va a crear un grafo que representa la preferencias de ambos
			//Como son palabras, un hashmap auxiliar(nodos) va a tradurlas a indices
			nodos.clear();
			int indiceNodos=0;

			lineain = br.readLine().replaceAll(";","").trim();//Para quitarle el " ;" del final
			String[] gustos1=lineain.split(" , ");
			for(String grupo : gustos1)
			{
				String[] elementos=grupo.trim().split("\\s+");// por si estan separados por mas de un espacio
				for(String pref : elementos)
				{
					Integer indiceAsignado=nodos.get(pref);
					if(indiceAsignado==null)//Es la primera vez que ve esta palabra
					{
						indiceAsignado=indiceNodos++; 
						nodos.put(pref, indiceAsignado); // como no estaba se le pone su numero correspondiente
					} 

				}
			}
			
			lineain = br.readLine().replaceAll(";","").trim();//Para quitarle el " ;" del final
			String[] gustos2=lineain.split(" , ");
			for(String grupo : gustos2)
			{
				String[] elementos=grupo.trim().split("\\s+");// por si estan separados por mas de un espacio
				for(String pref : elementos)
				{
					Integer indiceAsignado=nodos.get(pref);
					if(indiceAsignado==null)//Es la primera vez que ve esta palabra
					{
						indiceAsignado=indiceNodos++; 
						nodos.put(pref, indiceAsignado); // como no estaba se le pone su numero correspondiente
					} 

				}
			}
			//System.out.println(nodos);//Asi queda la correspondencia palabra numero
			/*
			{organizado=0, acertijos=1, rico=2, nadador=3, teatro=4, peliculas=5, navegante=6}
			----------------------------------------------------------------------------------
			{organizado=0, acertijos=1, rico=2, nadador=3, teatro=4, navegante=5, peliculas=6}
			----------------------------------------------------------------------------------
			{organizado=0, acertijos=1, rico=2, nadador=3, teatro=4, peliculas=5, navegante=6}
			----------------------------------------------------------------------------------
			*/


			//Ahora se crea el grafo
			ArrayList<int[]> listaArcos=new ArrayList<int[]>();

			//Llenar el grafo, represenatdo como una lista de arcos
			for(String grupo : gustos1)// lo que aporta la persona 1
			{
				String[] elementos=grupo.split(" ");
				for(int i=0; i<elementos.length-1; i++) // se va a poner un arco con el que se tiene al frente
				{
					int[] arco={nodos.get(elementos[i]), nodos.get(elementos[i+1])};
					listaArcos.add(arco);
				}
			}
			for(String grupo : gustos2)// lo que aporta la persona 2
			{
				String[] elementos=grupo.split(" ");
				for(int i=0; i<elementos.length-1; i++) // se va a poner un arco con el que se tiene al frente
				{
					int[] arco={nodos.get(elementos[i]), nodos.get(elementos[i+1])};
					listaArcos.add(arco);
				}
			}

			//Revisar que la lista de arcos esta bien hecha
			//for(int[] arco: listaArcos)System.out.println(arco[0]+" "+arco[1]);
			/*
			GRAFO 1:		GRAFO 2:		GRAFO 3:
			0 1				0 1 			0 1
			1 2 			1 2 			1 2
			3 4				3 4 			3 4
			2 5				5 6				2 5
			6 5				6 1 			4 1
			5 1 			2 4				6 5
			2 4								5 1
											2 4
			*/
			char resp = solve(listaArcos, nodos.size());
			System.out.println(resp+"");
			/* //RESPUESTAS CASO Small
			P
			C
			P
			*/
			//El ultimo caso dio diferente pero es que parece que si la relacion "acertijo > rico (1 2)"
			//Se quita el grafo no presentaria ciclos, por lo que serian Parcialmente compatibles
		}
		br.close();
	}

	/*
	La idea es que si el grafo generado no tiene cliclos se retorna C (Compatibles)
	elseif si al quitar una de las preferencias originales el grafo queda sin ciclos se retorna P (Parcialmente)
	else se retorna N (no compatibles)
	*/
	public static char solve(ArrayList<int[]> listaArcos, int V)
	{
		//caso 1 se mira si hay ciclos en el grafo cuando estan todas las preferencias
		if(!grafoTieneCiclos(darAdj(listaArcos, -1, V))) return 'C';

		//caso 2 se quita uno por uno de los arcos y se vuelve a evaluar
		for(int i=0; i<listaArcos.size(); i++)
		{
			if(!grafoTieneCiclos(darAdj(listaArcos, i, V))) return 'P';
		}

		//caso 3
		return 'N';
	}

	/*
	Retorna una represenatcion del grafo como listas de adyacencia
	le entra una lista de arcos y el arco que no debe ser tenido en cuenta para ese caso
	*/
	public static ArrayList<Integer>[] darAdj(ArrayList<int[]> listaArcos, int quitar, int V)
	{
		@SuppressWarnings("unchecked")
		ArrayList<Integer>[] adj=new ArrayList[V];
		for(int i=0;i<V; i++) adj[i]=new ArrayList<Integer>();
		
	
		for(int i=0; i<listaArcos.size(); i++)
		{
			if(i!=quitar)
			{
				//adj[from].add(to);
				int[] arco=listaArcos.get(i);
				adj[arco[0]].add(arco[1]);
			}
		}
		// imprimir el grafo para ver que las relaciones quedaron bien hechas(quitar=-1, cuando no se quitan relaciones)
		//for(int i=0; i<adj.length; i++) System.out.println(i+": "+adj[i]);
		/*
		GRAFO 1:			GRAFO 2:			GRAFO 3:
		0: [1]				0: [1]				0: [1]
		1: [2]				1: [2]				1: [2]
		2: [5, 4]			2: [4]				2: [5, 4]
		3: [4]				3: [4]				3: [4]
		4: []				4: []				4: [1]
		5: [1]				5: [6]				5: [1]
		6: [5]				6: [1]				6: [5]
		---------			---------			---------
		*/
		return adj;
	}

	public static boolean grafoTieneCiclos(ArrayList<Integer>[] adj)
	{
		int[] color=new int[adj.length];//como se inicia en 0's todos estan "WHITE"
		for(int i=0; i<adj.length; i++)
			if(nodoTieneCiclo(adj, i, color)) return true;
		return false;
	}

	/*
	Este es un algoritmo que funciona como un DFS por eso es recursivo
	*/
	public static boolean nodoTieneCiclo(ArrayList<Integer>[] adj, int v, int[] color)
	{
		if(color[v]==GRAY) return true;
		if(color[v]==BLACK) return false;
		color[v]=GRAY;
		
		for(int w: adj[v])
			if(nodoTieneCiclo(adj, w, color))return true;

		color[v] = BLACK;
    	return false;
	}
}
