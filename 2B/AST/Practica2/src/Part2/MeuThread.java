/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Part2;

import Part1.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author josep
 */
public class MeuThread extends Thread{
    
    char lletra;

    public MeuThread(char lletra) {
        this.lletra = lletra;
    }
    
    
    public void run(){
        
        while(true)
        {
            System.out.println(this.lletra);
            try {
                Thread.sleep(500);
            } catch (InterruptedException ex) {
                Logger.getLogger(MeuThread.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
       
   } 
}
