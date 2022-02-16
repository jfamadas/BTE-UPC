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
public class ExecucioThreads {
    
    public static void main (String[] args)
    {
        Flag f = new Flag();
        new MeuThread('A',f).start();
        new MeuThread('B',f).start();
        
    }
    
}
