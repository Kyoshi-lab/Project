/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package index;

import java.util.*;
import org.jsoup.*;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import projetin42.*;

/**
 *
 * @author Joris
 */
public class FabTriplet extends Thread {

    private final ArrayList<Triplet> AlTriplet;

    public FabTriplet(ArrayList<Triplet> alt) {
        this.AlTriplet = alt;
    }

    public void run() {
        System.out.println("Fabrication de triplets commence");
        for (Page p : ProjetIn42.entrepot.values()) {
            parser(p);
        }
        System.out.println("Nombre de triplets totaux : " + this.AlTriplet.size());
        indexCible ic = new indexCible(AlTriplet);
        ic.remplir();
        System.out.println("hashMap cible remplie");
        indexSource is = new indexSource(AlTriplet);
        is.remplir();
        System.out.println("hashMap source remplie");
        indexMot im = new indexMot(AlTriplet);
        im.remplir();
        System.out.println("hashMap mot remplie");

        System.out.println("Taille hmCible : " + ProjetIn42.htCible.size());
        System.out.println("Taille hmMot : " + ProjetIn42.htMot.size());
        System.out.println("Taille hmSource : " + ProjetIn42.htSource.size());

    }

    public void parser(Page p) {
        String source = p.getSource();
        Document doc = Jsoup.parse(p.getCodeSource(), source);
        Elements liste = doc.select("a[title]")
                .not(".image")
                .not("img")
                .not(".internal")
                .not("[href*=#")
                .not("[href*=:")
                .not("[href*=%")
                .not("[href*=php");
        for (Element elem : liste) {
            String mot = elem.text();
            String temp = elem.absUrl("href");
            Triplet t = new Triplet(source, mot, temp);
            this.AlTriplet.add(t);

        }
    }
}
