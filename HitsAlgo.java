/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Hits;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import projetin42.*;

/**
 *
 * @author Joris
 */
public class HitsAlgo {

    public HitsAlgo() {

    }

    public HashMap<String, Page> hubsandauth(HashMap<String, Page> E) throws IOException {
        int norm;
        norm = 0;
        for (Page p : E.values()) {
            p.setAuthScore(0);
            int somme = 0;
            ArrayList<Page> tempcible = new ArrayList<>();
            try {
                for (Triplet t : ProjetIn42.htCible.get(p.getSource())) {
                    Page s = ProjetIn42.entrepot.get(t.getSource());
                    tempcible.add(s);
                }
            } catch (NullPointerException e) {
            }
            for (Page q : tempcible) {
                somme += q.getHubScore();
            }
            p.setAuthScore(somme);
            norm += Math.pow(p.getAuthScore(), 2);
        }
        norm = (int) Math.sqrt(norm);
        for (Page p : E.values()) {
            p.setAuthScore(p.getAuthScore() / norm);
        }
        //-----------------------------------------------------------------
        norm = 0;
        for (Page p : E.values()) {
            p.setHubScore(0);
            int somme = 0;
            ArrayList<Page> tempsource = new ArrayList<>();
            for (Triplet r : ProjetIn42.htSource.get(p.getSource())) {
                if (ProjetIn42.entrepot.containsKey(r.getCible())) {
                    tempsource.add(ProjetIn42.entrepot.get(r.getCible()));
                } else {
                    Page s = new Page(r.getCible(), false);
                    tempsource.add(s);
                }
            }
            for (Page q : tempsource) {
                somme += q.getAuthScore();
            }
            p.setHubScore(somme);
            norm += Math.pow(p.getHubScore(), 2);
        }
        norm = (int) Math.sqrt(norm);
        for (Page p : E.values()) {
            p.setHubScore(p.getHubScore() / norm);
        }
        return E;
    }
}
