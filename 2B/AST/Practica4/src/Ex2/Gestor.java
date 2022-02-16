
package Ex2;

import Ex1.*;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Gestor {
    
    protected volatile int[] primers;
    protected volatile int index_per_on_va,esperat,candidat,donats,fiables,han_passat,candidat_a_afegir;
    protected ReentrantLock mon;
    protected Condition espera1,espera2;

    Gestor(int N){
        primers = new int[N];
        mon = new ReentrantLock();
        espera1 = mon.newCondition();
        espera2 = mon.newCondition();
        candidat = 5;
        primers[0]=3;
        primers[1] = 5;
        index_per_on_va = 1;
        esperat = 7;
        donats = 0;
        fiables = 0;
        han_passat = 0;
        
    }
    
    int seguent_candidat(){
        int num;
        donats++;
        mon.lock();
        if(index_per_on_va+1>=primers.length) num=0;
        else{
            if(donats == 1){
                candidat = candidat +2;
                num = candidat;
            }
            else if(donats == 2) num = candidat;
            else{
                num = candidat;
                donats = 0;
            }
            
        }
        mon.unlock();
        return num;
    }
    
    
    int primer(int index){
        mon.lock();
        while(index>index_per_on_va){
            try {
                espera1.await();
            } catch (InterruptedException ex) {
                Logger.getLogger(Gestor.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        mon.unlock();
        return primers[index];
    }
    
    void resultat (int candidat, boolean es_primer){
        mon.lock();
        while(candidat!=esperat){
            try {
                espera2.await();
            } catch (InterruptedException ex) {
                Logger.getLogger(Gestor.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        han_passat++;
        if(es_primer) fiables ++;  candidat_a_afegir = candidat; //cal guardar el candidat bo ja que
                                                                 //no sempre el tercer en passar
                                                                 // estem segurs que tindra un nombre primer
        if(han_passat == 3 && fiables > 1){
                index_per_on_va++;
                primers[index_per_on_va]=candidat_a_afegir;
                espera1.signalAll();
        }
        
        if(han_passat == 3){
            esperat = esperat + 2;
            espera2.signalAll();
            fiables = 0;
            han_passat = 0;
            
        }
        mon.unlock();
    }
    
}