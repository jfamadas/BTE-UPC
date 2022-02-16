/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Part1;

/**
 *
 * @author josep
 */
public class Proces extends Thread{
    
    Menter m;
    int N;
    Mutex mut;

    public Proces(Menter m, int N, Mutex mut) {
        this.m = m;
        this.N = N;
        this.mut = mut;
    }
    
    public void run(){
        for (int i=0;i<N;i++)
        {
            mut.entraZC();
            m.inc();
            mut.surtZC();
        }
    }
    
    
}
