/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Part2;

import Part1.*;

/**
 *
 * @author josep
 */
public class ExecucioThreads {
    
    public static void main (String[] args)
    {
        new MeuThread('A').start();
        new MeuThread('B').start();
        
    }
    
}
