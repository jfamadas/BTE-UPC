/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Part4;

import Part1.*;

/**
 *
 * @author josep
 */
public class MeuThread extends Thread{
    
    char lletra;
    Flag flag;

    public MeuThread(char lletra,Flag flag) {
        this.flag=flag;
        this.lletra = lletra;
    }
    
    
    public void run(){
        
        while(true)
        {
            flag.waitLletra(lletra);
            System.out.println(this.lletra);
            flag.nextLletra();
        }
       
   } 
}
