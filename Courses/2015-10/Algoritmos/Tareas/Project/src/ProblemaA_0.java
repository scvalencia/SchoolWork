// DAlgo 2015-10
// Problema A    : Soluci�n ingenua
// Grupo         : 00
// Autor         : Rodrigo Cardoso

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class ProblemaA_0 {

	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String lineain,data[];
		int M, N;
		
		while (true){
			lineain = br.readLine();
			data = lineain.split(" ");
			M = Integer.parseInt(data[0]);
			N = Integer.parseInt(data[1]);
			if (M==0 && N ==0) break;				// terminaci�n de la entrada
			boolean [][] foto = new boolean [M][N];
			for (int i=0; i!=M; i++){
				lineain = br.readLine();
				for (int j=0; j!=N; j++){
					if (lineain.charAt(j) == '1'){
						foto[i][j] = true;
					}
					else{
						foto[i][j] = false;
					}
				}
			}


			int [] resp = new int [2];
            resp = solve(foto);
            /*
            Stopwatch timer = new Stopwatch();
			resp = solve(foto);
            double time = timer.elapsedTime();
            System.out.printf(resp[0] + " " + resp[1] + " " + String.format("%.12f", time) + " seconds." + '\n');
            */
			System.out.println(resp[0] + " " + resp[1]);
		}
	}

	//Soluci�n ingenua
	public static int[] solve(boolean [][] foto){
		int cmax = 0;
		int rmax = 0;
		int m = foto.length;
		int n = foto[0].length;

		for(int i=0; i != m; i++){
			for (int j=0; j != n; j++){
				int cmaxij = 0;
				int rmaxij = 0;
				for (int p1=0; p1!=i+1; p1++){
					for(int p2=p1; p2!=i+1; p2++){
						for (int q1=0; q1!=j+1; q1++){
							for(int q2=q1; q2!=j+1; q2++){
								int r = p1;
								int rcent = p2+1;
								int s = q1;
								while (r != rcent){
									if (!foto[r][s]){
										rcent = r;
									}
									else{
										if (s!=q2) s++;
										else{
											r++;
											s = q1;
										}
									}
								}
								if (r == p2+1){
									int area = (p2-p1+1)*(q2-q1+1);
									rmaxij = Math.max(rmaxij,area);
									if (p2-p1+1 == q2-q1+1){
										cmaxij = Math.max(cmaxij,area);
									}
								}
							}
						}
					}
				}
				rmax = Math.max(rmax, rmaxij);
				cmax = Math.max(cmax, cmaxij);
			}
		}
		int [] resp = new int [2];
		resp[0] = cmax;
		resp[1] = rmax;
		return resp;
	}
}
