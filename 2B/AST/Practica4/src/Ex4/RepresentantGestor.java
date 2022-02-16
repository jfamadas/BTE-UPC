/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ex4;

public class RepresentantGestor {
    
    protected MySocket s;
    
    public RepresentantGestor(){
        s = new MySocket("LocalHost", COMMS.port);
    }
    
    public int seguent_candidat(){
        s.write_int(COMMS.seg_cand);
        int candidat = s.read_int();
        if(candidat == 0) s.close();
        return candidat;
    }
    
    public int primer(int index){
        s.write_int(COMMS.primer_de_i);
        s.write_int(index);
        int num = s.read_int();
        return num;
    }
    
    public void resultat(int candidat, boolean es_primer){
        s.write_int(COMMS.resultat);
        s.write_int(candidat);
        s.write_boolean(es_primer);
        s.read_int();
        
    }    
    
}
