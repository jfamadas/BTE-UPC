
package Ex1;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Gestor {
    
    protected volatile int[] primers;
    protected volatile int index_per_on_va,esperat,candidat;
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
        
    }
    
    int seguent_candidat(){
        int num;
        mon.lock();
        candidat = candidat +2;
        if(index_per_on_va+1>=primers.length) num=0;
        else num = candidat;
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
        if(es_primer) {
            index_per_on_va++;
            primers[index_per_on_va]=candidat;
            espera1.signalAll();

        }
        esperat = esperat + 2;
        espera2.signalAll();
        mon.unlock();
    }
    
}