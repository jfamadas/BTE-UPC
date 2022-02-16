/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Part4;

import Part2.*;
import Part1.*;

/**
 *
 * @author josep
 */
public class Proces extends Thread{
    
    Menter m;
    int N;
    Mutex mut;
    int id;

    public Proces(Menter m, int N, Mutex mut,int id) {
        this.m = m;
        this.N = N;
        this.mut = mut;
        this.id=id;
    }
    
    public void run(){
        for (int i=0;i<N;i++)
        {
            mut.entraZC(id);
            m.inc();
            mut.surtZC(id);
        }
    }
    
    
}
