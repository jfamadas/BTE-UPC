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
public class Principal {
    
    public static void main(String[] args) throws InterruptedException{
    
        Menter comptador = new Menter();
        int N = 2000;
        Mutex m = new Mutex();
        Proces p1 = new Proces(comptador,N,m);
        Proces p2 = new Proces(comptador,N,m);
        p1.start();
        p2.start();
        p1.join();
        p2.join();
        System.out.println(comptador.getValor());
    
    }
    
}
