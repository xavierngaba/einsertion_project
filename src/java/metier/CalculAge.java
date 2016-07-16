/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metier;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 *
 * @author xavier_ng
 */
public final class CalculAge {
    private static int UN = 1;
    private static int DOUZE = 12;

    public CalculAge() {}
    
    public int getAge(String dateNaiss){
        Calendar calStr1 = Calendar.getInstance();
        Calendar calStr2 = Calendar.getInstance();
        Calendar calStr0 = Calendar.getInstance();
        
        Date date1 = null;
        Date date2 = new Date(System.currentTimeMillis());
        
        int nbMois = 0;
        int nbAnnees = 0;
        long nbJours = 0;
        
        try{
            date1 = new SimpleDateFormat("yyyy-mm-dd").parse(dateNaiss);
        }catch(ParseException e){
            e.printStackTrace();
        }
        if(date1.equals(date2)){
        }
        date2.setDate(date1.getDay());
        date2.setMonth(date1.getMonth());
        calStr1.setTime(date1);
        calStr2.setTime(date2);
        
        nbMois = 0;
        while(calStr1.before(calStr2)){
            calStr1.add(GregorianCalendar.MONTH, UN);
            if(calStr1.before(calStr2) || calStr1.equals(calStr2)){
                nbMois++;
            }
        }
        nbAnnees = (nbMois / DOUZE);
        nbMois = (nbMois - (nbAnnees * DOUZE));
        
        calStr0 = Calendar.getInstance();
        calStr0.setTime(date1);
        calStr0.add(GregorianCalendar.YEAR, nbAnnees);
        calStr0.add(GregorianCalendar.MONTH, nbMois);
        nbJours = (calStr2.getTimeInMillis() - calStr0.getTimeInMillis()) / 86400000;
        
        return nbAnnees;
    }
    
    public int getMois(String dateDebut,String dateFin){
        Calendar calStr1 = Calendar.getInstance();
        Calendar calStr2 = Calendar.getInstance();
        Calendar calStr0 = Calendar.getInstance();
        
        Date date1 = null;
        Date date2 = null;
        
        int nbMois = 0;
        int nbAnnees = 0;
        long nbJours = 0;
        
        try{
            date1 = new SimpleDateFormat("yyyy-mm-dd").parse(dateDebut);
        }catch(ParseException e){
            e.printStackTrace();
        }
        try{
            date2 = new SimpleDateFormat("yyyy-mm-dd").parse(dateFin);
        }catch(ParseException e){
            e.printStackTrace();
        }
        if(date1.equals(date2)){
        }
        calStr1.setTime(date1);
        calStr2.setTime(date2);
        
        nbMois = 0;
        while(calStr1.before(calStr2)){
            calStr1.add(GregorianCalendar.MONTH, UN);
            if(calStr1.before(calStr2) || calStr1.equals(calStr2)){
                nbMois++;
            }
        }
        nbAnnees = (nbMois / DOUZE);
        nbMois = (nbMois - (nbAnnees * DOUZE));
        
        calStr0 = Calendar.getInstance();
        calStr0.setTime(date1);
        calStr0.add(GregorianCalendar.YEAR, nbAnnees);
        calStr0.add(GregorianCalendar.MONTH, nbMois);
        nbJours = (calStr2.getTimeInMillis() - calStr0.getTimeInMillis()) / 86400000;
        
        return nbMois;
    }
}
