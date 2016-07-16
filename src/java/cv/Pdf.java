/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cv;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chapter;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Section;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import model.Candidat;
import model.Cv;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

/**
 *
 * @author xavier_ng
 */
public final class Pdf {
    private static final String FORMAT_DATE = "dd MMMM yyyy";
    public void genererPDF(Candidat candidat,Cv cv, HttpServletResponse resp){
        Document document = new Document(PageSize.A4);
        DateTimeFormatter formatter = DateTimeFormat.forPattern( FORMAT_DATE );
        try {
            resp.setContentType("application/pdf");
            resp.setHeader("Content-Disposition", "inline;filename="+candidat.getNomCan()+"CV.pdf");
            PdfWriter.getInstance(document, resp.getOutputStream());
            document.open();

            Paragraph paragraph = new Paragraph(new Phrase("CURRICULUM VITAE",FontFactory.getFont(FontFactory.TIMES_ROMAN, 30, Font.BOLD, BaseColor.DARK_GRAY)));
            paragraph.setAlignment(Element.ALIGN_CENTER);
            Chapter chapter = new Chapter(paragraph, 1);
            chapter.setNumberDepth(0);

            Section section = chapter.addSection(new Paragraph(""), 5);
            section.setNumberDepth(0);

            Chunk chunk = new Chunk("COMPETENCE",FontFactory.getFont(FontFactory.COURIER, 20, Font.BOLD, BaseColor.BLUE));
            chunk.setUnderline(BaseColor.BLUE,1.0f, 0.0f, 0.0f, -0.2f,PdfContentByte.LINE_CAP_ROUND);
            paragraph = new Paragraph(chunk);
            paragraph.setAlignment(Element.ALIGN_CENTER);
            Section section1 = chapter.addSection(paragraph, 2);
            section1.setNumberDepth(0);

            chunk = new Chunk("EXPERIENCE PROFESSIONNELLE",FontFactory.getFont(FontFactory.COURIER, 20, Font.BOLD, BaseColor.BLUE));
            chunk.setUnderline(BaseColor.BLUE,1.0f, 0.0f, 0.0f, -0.2f,PdfContentByte.LINE_CAP_ROUND);
            paragraph = new Paragraph(chunk);
            paragraph.setAlignment(Element.ALIGN_CENTER);
            Section section2 = chapter.addSection(paragraph, 3);
            section2.setNumberDepth(0);

            chunk = new Chunk("FORMATION ACADEMIQUE OU PROFESSIONNELLE",FontFactory.getFont(FontFactory.COURIER, 20, Font.BOLD, BaseColor.BLUE));
            chunk.setUnderline(BaseColor.BLUE,1.0f, 0.0f, 0.0f, -0.2f,PdfContentByte.LINE_CAP_ROUND);
            paragraph = new Paragraph(chunk);
            paragraph.setAlignment(Element.ALIGN_CENTER);
            Section section3 = chapter.addSection(paragraph, 4);
            section3.setNumberDepth(0);

            DateTime dt = new DateTime(candidat.getDateNaiss());
            Paragraph paragraph1 = new Paragraph("");
            Phrase ph = new Phrase(candidat.getNomCan().toUpperCase()+" "+candidat.getPrenomCan()+"\n",FontFactory.getFont(FontFactory.COURIER, 10, Font.BOLD, BaseColor.DARK_GRAY));paragraph1.add(ph);
            ph = new Phrase("Né le "+dt.toString(formatter)+"\n",FontFactory.getFont(FontFactory.COURIER, 10, Font.BOLD, BaseColor.DARK_GRAY));paragraph1.add(ph);
            ph = new Phrase("Tél: "+candidat.getTel1Can()+" \n",FontFactory.getFont(FontFactory.COURIER, 10, Font.BOLD, BaseColor.DARK_GRAY));paragraph1.add(ph);
            ph = new Phrase(candidat.getEmailCan()+"\n",FontFactory.getFont(FontFactory.COURIER, 10, Font.BOLD, BaseColor.DARK_GRAY));paragraph1.add(ph);
            paragraph1.setAlignment(Element.ALIGN_LEFT);
            section.add(paragraph1);

            Paragraph paragraph2 = new Paragraph("\n");
            Phrase ph2 = new Phrase("",FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD, BaseColor.BLUE));
            List liste = new List(false, 20);
            if(!cv.getCompetenceList().isEmpty()){
               for(int i = 0; i < cv.getCompetenceList().size();i++){
                    ph2 = new Phrase(new Chunk("Spécialité : ",FontFactory.getFont(FontFactory.COURIER, 14, Font.BOLDITALIC, BaseColor.BLACK)));
                    ph2.add(cv.getCompetenceList().get(i).getSpecialite()+"\n");
                    paragraph2.add(ph2);
                    ph2 = new Phrase(cv.getCompetenceList().get(i).getLibelleComp()+"\n\n");
                    paragraph2.add(ph2);
                    paragraph2.setIndentationLeft(65f);
                } 
            }else{
                ph2 = new Phrase(new Chunk(" Actuellement aucune Compétence enregistrée!!!",FontFactory.getFont(FontFactory.COURIER_BOLD, 14, Font.BOLD
                            , BaseColor.RED)));
               paragraph2.add(ph2);
            }   
            section1.add(paragraph2);

            Paragraph paragraph3 = new Paragraph("\n");
            ph2 = new Phrase("",FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD, BaseColor.BLUE));
            if(!cv.getExperienceProList().isEmpty()){
               for(int i = 0; i < cv.getExperienceProList().size();i++){
                   DateTime dt1 = new DateTime(cv.getExperienceProList().get(i).getDateDebut());
                   DateTime dt2 = new DateTime(cv.getExperienceProList().get(i).getDateFin());
                    ph2 = new Phrase(new Chunk("Du "+dt1.toString(formatter)+" au " +dt2.toString(formatter)+ " : ",FontFactory.getFont(FontFactory.COURIER_BOLD, 14, Font.BOLD, BaseColor.BLACK)));
                    ph2.add(cv.getExperienceProList().get(i).getPoste() + " au sein de " + cv.getExperienceProList().get(i).getNomStructure()+ "\n");
                    paragraph3.add(ph2);
                    ph2 = new Phrase(cv.getExperienceProList().get(i).getTachesEffectuees()+ "\n\n");
                    paragraph3.add(ph2);
                    paragraph3.setIndentationLeft(65f);
                } 
            }else{
               ph2 = new Phrase(new Chunk(" Actuellement aucune expérience professionnelle!!!",FontFactory.getFont(FontFactory.COURIER_BOLD, 14, Font.BOLD
                            , BaseColor.RED)));
               paragraph3.add(ph2);
            }
            section2.add(paragraph3);

            Paragraph paragraph4 = new Paragraph("\n");
            liste = new List(false, 20);
            for(int i = 0; i < cv.getFormationList().size();i++){
                liste.add(new ListItem("De "+cv.getFormationList().get(i).getAnneeAca()+" : "
                                      +""+cv.getFormationList().get(i).getDiplome()+" au "+cv.getFormationList().get(i).getEtablissement()));
                 
            }
            paragraph4.add(liste);
            paragraph4.setIndentationLeft(65f);
            section3.add(paragraph4);

            document.add(chapter);
          } catch (DocumentException de) {
            de.printStackTrace();
          } catch (IOException ioe) {
            ioe.printStackTrace();
          }

        document.close();
    }
}
