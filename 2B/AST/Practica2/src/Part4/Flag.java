/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Part4;

/**
 *
 * @author josep
 */
public class Flag {
    
    protected char permis;

    public Flag(){
        permis='A';
    }
    
    public void waitLletra(char lletra){
        
        while (permis!=lletra)
        {}
        
        
    }
    public void nextLletra(){
        if (permis=='A')
        {
            permis='B';
        }
        else permis='A';
    }
}
