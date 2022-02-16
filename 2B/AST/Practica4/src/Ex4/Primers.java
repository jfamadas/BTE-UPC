
package Ex4;

public class Primers {
    
        public static void main(String[] args) {
        /* if (args.length!=2){
            System.err.println("Arguments: num_primers num_treballadors");
            return;
        }
        */
        
        //int N = Integer.parseInt(args[0]);
        int N = 100;
        Servidor server = new Servidor(N);
        new Thread(server).start();
        
        //int M = Integer.parseInt(args[1]);
        int M = 10;
        Thread[] t = new Thread[M];
        for (int i = 0; i<M; i++){
            RepresentantGestor g = new RepresentantGestor();
            t[i] = new Thread(new Treballador(N, g));
            t[i].start();
        }
        for(int i = 0; i<M; i++){
            try{
                t[i].join();
            } catch(InterruptedException e){}
        }
        /*for(int i = 0; i<N; i++){
            System.out.println("primers["+i+"] = "+server.primers[i]);
        }*/
    
    }
    
}
