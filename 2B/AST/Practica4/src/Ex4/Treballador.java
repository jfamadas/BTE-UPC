
package Ex4;


public class Treballador implements Runnable {
    protected int[] primers;
    protected int ultim_index;
    protected RepresentantGestor gestor;
    
    Treballador(int N, RepresentantGestor g){
        primers = new int[N];
        primers[0] = 3;
        primers[1] = 5;
        ultim_index = 1;     
        gestor = g;
    }
    
    @Override
    public void run(){
        while(true){
            int candidat, i;
            boolean es_primer; 
            candidat = gestor.seguent_candidat();
            if (candidat ==0) break;
            
            es_primer = true;
                    i = 0;
                    while (es_primer && (primers[i]*primers[i] <= candidat)){
                        if (candidat % primers [i] == 0) es_primer = false;
                        else{
                            i++;
                            if (i>ultim_index){
                                int primer;
                                primer = gestor.primer(i);
                                ultim_index++;
                                primers[ultim_index] = primer;
                            }
                        }
                    }
            gestor.resultat(candidat, es_primer);
        }
    }
}
                                
                                
    
