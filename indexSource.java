/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package index;

import java.util.ArrayList;
import projetin42.ProjetIn42;
import projetin42.Triplet;

/**
 *
 * @author Joris
 */
public class indexSource extends Thread {

    private final ArrayList<Triplet> isAlt;

    public indexSource(ArrayList<Triplet> alt) {
        this.isAlt = alt;
    }

    public void remplir() {
        ArrayList<Triplet> altemp = new ArrayList<>(isAlt);
        while (!altemp.isEmpty()) {
            ArrayList<Triplet> AL = new ArrayList<>();
            String sourceActuelle = altemp.get(0).getSource();
            for (int i = 0; i < altemp.size(); i++) {
                if (sourceActuelle.equals(altemp.get(i).getSource())) {
                    AL.add(altemp.get(i));
                }
            }
            ProjetIn42.htSource.put(sourceActuelle, AL);
            altemp.removeAll(AL);
        }
    }
}
