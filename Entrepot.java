/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entrepot;

import java.io.*;
import java.net.*;
import projetin42.*;

/**
 *
 * @author Joris
 */
public class Entrepot extends Thread {

    private final int port = 9999;
    private final ServerSocket soc;
    private boolean stop = false;
    
    public Entrepot() throws IOException {
        this.soc = new ServerSocket(port);

    }

    public synchronized void run() {
        try {
            System.out.println("En attente d'une connexion ...");
            Socket s = soc.accept();
            System.out.println("... Connexion recue !");
            BufferedReader sisr = new BufferedReader(new InputStreamReader(s.getInputStream()));
            while (!stop) {
                String recue = sisr.readLine();
                if (recue.equals("fin")) {
                    stop = true;
                } else {
                    checkURL(recue);
                }
            }
            s.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public void checkURL(String url) throws IOException {        
        if (!ProjetIn42.entrepot.containsKey(url)) {
            Page p = new Page(url,true);
            ProjetIn42.entrepot.put(url, p);
        }
    }
}
