/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projetin42;

import Hits.HitsAlgo;
import entrepot.Entrepot;
import index.FabTriplet;
import java.io.IOException;
import java.util.*;
import java.io.*;
import projetin42.Page;

/**
 *
 * @author Joris
 */
public class ProjetIn42 {

    /**
     * @throws java.io.IOException
     * @throws java.lang.InterruptedException
     */
    public static HashMap<String, Page> entrepot = new HashMap<>();
    public static HashMap<String, ArrayList<Triplet>> htSource = new HashMap<>();
    public static HashMap<String, ArrayList<Triplet>> htCible = new HashMap<>();
    public static HashMap<String, ArrayList<Triplet>> htMot = new HashMap<>();

    public static void main(String[] args) throws IOException, InterruptedException, ClassNotFoundException, EOFException {

        ArrayList<Triplet> totalTriplet = new ArrayList<>(500000);
        final String fichierAL = "triplet.ser";
        final String fichierHTS = "htsource.ser";
        final String fichierHTM = "htmot.ser";
        final String fichierHTC = "htdest.ser";
        final String fichierENT = "entrepot.ser";
        FileOutputStream fos = null;
        FileInputStream fis = null;
        ObjectOutputStream oos = null;
        ObjectInputStream ois = null;
        HitsAlgo hits = new HitsAlgo();
        PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter("hits.txt")));
        PrintWriter ba = new PrintWriter(new BufferedWriter(new FileWriter("bestAuths.txt")));
        PrintWriter bh = new PrintWriter(new BufferedWriter(new FileWriter("bestHubs.txt")));

        //PARTIE CRAWLER/ENTREPOT/SERIALISATION
       /* Entrepot e1 = new Entrepot();
        e1.start();
        e1.join();
        System.out.println(ProjetIn42.entrepot.size());
        FabTriplet ft = new FabTriplet(totalTriplet);
        ft.start();
        ft.join();
        serialiserAL(fos, oos, fichierAL, totalTriplet);
        serialiserHT(fos, oos, fichierENT, entrepot);
        serialiserHT(fos, oos, fichierHTC, htCible);
        serialiserHT(fos, oos, fichierHTM, htMot);
        serialiserHT(fos, oos, fichierHTS, htSource);
        System.out.println("Fichiers sérialisés !");*/
        
        //PARTIE HITS
        totalTriplet = deserialiserAL(fis, ois, fichierAL, totalTriplet);
        entrepot = deserialiserHT(fis, ois, fichierENT, entrepot);
        htCible = deserialiserHT(fis, ois, fichierHTC, htCible);
        htMot = deserialiserHT(fis, ois, fichierHTM, htMot);
        htSource = deserialiserHT(fis, ois, fichierHTS, htSource);
        System.out.println("Fichiers désérialisés !");
        System.out.println("Lancement de l'algorithme HITS");
        entrepot = hits.hubsandauth(entrepot);
        System.out.println("Auths & Hubs Updated !");
        for (Page p : entrepot.values()) {
            pw.println(p.getSource());
            pw.println("        Auth : " + p.getAuthScore());
            pw.println("        Hub : " + p.getHubScore());
        }
        pw.close();
        ArrayList<Page> valuesList = new ArrayList<>(entrepot.values());
        Collections.sort(valuesList, Page.AuthPageComparator);
        for (int i = 0; i < 10; i++) {
            ba.println(valuesList.get(i).getSource() + "  " + valuesList.get(i).getAuthScore());         
        }
        ba.close();

        Collections.sort(valuesList, Page.HubPageComparator);
        for (int i = 0; i < 10; i++) {
            bh.println(valuesList.get(i).getSource() + "  " + valuesList.get(i).getHubScore());

        }
        bh.close();

    }

    public static void serialiserAL(FileOutputStream fos, ObjectOutputStream oos, String file, ArrayList<Triplet> al) {
        try {
            fos = new FileOutputStream(file);
            oos = new ObjectOutputStream(fos);
            oos.writeObject(al);
            oos.close();
        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public static void serialiserHT(FileOutputStream fos, ObjectOutputStream oos, String file, HashMap ht) {
        try {
            fos = new FileOutputStream(file);
            oos = new ObjectOutputStream(fos);
            oos.writeObject(ht);
            oos.close();
        } catch (FileNotFoundException ex ) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public static ArrayList<Triplet> deserialiserAL(FileInputStream fis, ObjectInputStream ois, String file, ArrayList<Triplet> AL) {
        AL = new ArrayList<>();
        try {
            fis = new FileInputStream(file);
            ois = new ObjectInputStream(fis);
            AL = (ArrayList<Triplet>) ois.readObject();

            ois.close();
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return AL;
    }

    public static HashMap deserialiserHT(FileInputStream fis, ObjectInputStream ois, String file, HashMap ht) {
        ht = new HashMap<>();
        try {
            fis = new FileInputStream(file);
            ois = new ObjectInputStream(fis);
            ht = (HashMap) ois.readObject();

            ois.close();
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return ht;
    }

}
