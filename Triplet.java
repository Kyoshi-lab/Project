/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projetin42;

import java.io.*;

/**
 *
 * @author Joris
 */

public class Triplet implements Serializable{
    private final String source;
    private final String mot;
    private final String cible;
    
    
    public Triplet(String source, String mot, String cible) {
        this.source = source;
        this.mot = mot;
        this.cible = cible;
    }

    public String getSource() {
        return source;
    }

    public String getMot() {
        return mot;
    }

    public String getCible() {
        return cible;
    }

}