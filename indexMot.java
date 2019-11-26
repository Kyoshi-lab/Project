/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package index;

import java.util.ArrayList;
import projetin42.*;

/**
 *
 * @author Joris
 */
public class indexMot extends Thread {

    private final ArrayList<Triplet> imAlt;
    
    public indexMot(ArrayList<Triplet> alt) {
        this.imAlt = alt;
    }
    
    public void remplir() {
        ArrayList<Triplet> altemp = new ArrayList<>(imAlt);
        while (!altemp.isEmpty()) {
            ArrayList<Triplet> AL = new ArrayList<>();
            String motActuel = altemp.get(0).getMot();
            for (int i = 0; i < altemp.size(); i++) {
                if (motActuel.equals(altemp.get(i).getMot())) {
                    AL.add(altemp.get(i));
                }
            }
            ProjetIn42.htMot.put(motActuel, AL);
            altemp.removeAll(AL);
        }
    }
}
