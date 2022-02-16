
package Ex4;

public class Servidor implements Runnable {
    
    protected MyServerSocket s;
    protected Gestor g;
    
    public Servidor(int N){
        
        s = new MyServerSocket(COMMS.port);
        g = new Gestor(N);
        
    }
    
    @Override
    public void run(){
        while(true){
            MySocket ss = s.accept();
            new Thread(new Ajudant(ss,g)).start();
        }
        
    }
    
}
