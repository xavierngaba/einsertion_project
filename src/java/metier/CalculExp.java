/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metier;

import java.text.SimpleDateFormat;
import java.util.Date;
import org.joda.time.DateTime;
import org.joda.time.Months;

/**
 *
 * @author xavier_ng
 */
public final class CalculExp {
    public int getMois(String dateDebut,String dateFin){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
 
	Date d1 = null;
	Date d2 = null;
        try {
		d1 = format.parse(dateDebut);
		d2 = format.parse(dateFin);
         } catch (Exception e) {
		e.printStackTrace();
	 }
        DateTime dt1 = new DateTime(d1);
        DateTime dt2 = new DateTime(d2);
        return Months.monthsBetween(dt1, dt2).getMonths();
    }
}
