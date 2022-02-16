
package Ex4;

import java.util.logging.Level;
import java.util.logging.Logger;

public class Ajudant implements Runnable {
    
    protected Gestor g;
    protected MySocket socket;
    protected boolean tancar;
    
    public Ajudant(MySocket s, Gestor r){
        
        g = r;
        socket = s;
        tancar = true;
        
    }
    
    @Override
    public void run(){
        
      while(tancar){
        int peticio = socket.read_int();
        switch(peticio){
            case COMMS.seg_cand:
                    int index = g.seguent_candidat();
                    socket.write_int(index);
                    if(index == 0) {
                        tancar = false;
                    }
                    break;
                
            case COMMS.primer_de_i:
                    int indice = socket.read_int();
                    int num = g.primer(indice);
                    socket.write_int(num);
                    break;
                
            case COMMS.resultat:
                    int number = socket.read_int();
                    boolean si_no_primer= socket.read_boolean();
                    g.resultat(number,si_no_primer);
                    socket.write_int(COMMS.ok);
                    break;
        }
        
        
      }
      socket.close();
        
    }
    
    
}
