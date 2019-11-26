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
public class indexCible {

    private final ArrayList<Triplet> icAlt;

    public indexCible(ArrayList<Triplet> alt) {
        this.icAlt = alt;
    }

    public void remplir() {
        ArrayList<Triplet> altemp = new ArrayList<>(icAlt);
        while (!altemp.isEmpty()) {
            ArrayList<Triplet> AL = new ArrayList<>();
            String cibleActuelle = altemp.get(0).getCible();
            for (int i = 0; i < altemp.size(); i++) {
                if (cibleActuelle.equals(altemp.get(i).getCible())) {
                    AL.add(altemp.get(i));
                }
            }
            ProjetIn42.htCible.put(cibleActuelle, AL);
            altemp.removeAll(AL);
        }
    }
}
