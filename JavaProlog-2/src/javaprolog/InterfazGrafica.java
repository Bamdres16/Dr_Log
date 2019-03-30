package javaprolog;

  import javax.swing.*;
  import java.awt.event.*; 
import java.io.IOException;
import java.util.Arrays;
import org.jpl7.Query; 
 
 public class InterfazGrafica  extends JFrame implements ActionListener{
    private JTextField textfield1;
    private JLabel label1,label2,label3;
    private JButton boton1;
    
    public InterfazGrafica() {
        
        /*DEBE CAMBIARLE ESA RUTA POR LA QUE TENGA USTED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
         String t1 = "consult('Gramatica.pl')";//aqui colocan el nombre de su archivo a compilar
 
        Query q1 = new Query(t1);
        
         String t2 = "start().";//aqui colocan el nombre de su archivo a compilar
 
        Query q2 = new Query(t2);
        System.out.println(t1 + " " + (q1.hasSolution() ? "verdadero" : "fallo")); //mostrara 
                System.out.println(t2 + " " + (q2.hasSolution() ? "verdadero" : "fallo")); //mostrara 

        
        
      
        
    
        
    }   
    
    public void actionPerformed(ActionEvent e) {
        if (e.getSource()==boton1) { 
        }
    }
    
 }