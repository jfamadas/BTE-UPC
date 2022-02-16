/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Part4;

import Part2.*;
import Part1.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author josep
 */
public class Mutex {
    
    boolean ocupat1,ocupat2;
    int ultim;
    
    
    public void entraZC(int id){
        
        if (id==1)
        {
            ocupat1=true;
            ultim=1;
            while(ocupat2 && ultim==1)
            {}
        }
        if (id==2)
        {
            ocupat2=true;
            ultim=2;
            while(ocupat1 && ultim==2)
            {}
        }
    }
    
    public void surtZC(int id){
        if (id==1){
        ocupat1=false;
        ultim=1;
        }
        else{
        ocupat2=false;
        ultim=2;
        }
    }

    
    
}
