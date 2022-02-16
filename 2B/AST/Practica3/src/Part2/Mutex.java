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
public class Mutex {
    
    boolean ocupat1,ocupat2;
    int prioritat;
    
    
    public void entraZC(int id){
        if (id==1){
        ocupat1=true;
        while (ocupat2){
        ocupat1=false;
            try {
                Thread.sleep(100);
            } catch (InterruptedException ex) {
                Logger.getLogger(Mutex.class.getName()).log(Level.SEVERE, null, ex);
            }
        ocupat1=true;
        }
        }
        else
        {
            ocupat2=true;
            while(ocupat1){
             ocupat2=false;
            try {
                Thread.sleep(10);
            } catch (InterruptedException ex) {
                Logger.getLogger(Mutex.class.getName()).log(Level.SEVERE, null, ex);
            }
        ocupat2=true;}
            
        }
    }
    
    public void surtZC(int id){
        if (id==1){
        ocupat1=false;
        }
        if (id==2){
        ocupat2=false;
        }
    }

    
    
}
