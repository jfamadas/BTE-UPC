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
public class Mutex {
    
    boolean ocupat;
    
    
    public void entraZC(){
        while (ocupat){}
        ocupat=true;
    }
    public void surtZC(){
        ocupat=false;
    }

    
    
}
