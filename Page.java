/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projetin42;

import java.io.IOException;
import java.io.Serializable;
import org.jsoup.Jsoup;
import java.util.*;

/**
 *
 * @author Joris
 */
public class Page implements Serializable {

    private String source;
    private String codeSource;
    private double authScore;
    private double hubScore;

    public Page(String url, boolean recupCodeS) throws IOException {
        this.source = url;
        if (recupCodeS == true) {
            this.codeSource = Jsoup.connect(url).
                    validateTLSCertificates(false).
                    ignoreHttpErrors(true).
                    ignoreContentType(true).
                    get().
                    toString();            
        }
        this.authScore = 1;
        this.hubScore = 1;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getCodeSource() {
        return this.codeSource;
    }

    public double getAuthScore() {
        return this.authScore;
    }

    public double getHubScore() {
        return this.hubScore;
    }

    public void setAuthScore(double score) {
        this.authScore = score;
    }

    public void setHubScore(double score) {
        this.hubScore = score;
    }

    public static Comparator<Page> AuthPageComparator = new Comparator<Page>() {
        public int compare(Page p1, Page p2) {
            return Double.compare(p2.getAuthScore(), p1.getAuthScore());
        }
    };
    
    public static Comparator<Page> HubPageComparator = new Comparator<Page>(){
        public int compare(Page p1, Page p2){
            return Double.compare(p2.getHubScore(), p1.getHubScore());
        }
    };
            
}
