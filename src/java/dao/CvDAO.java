/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Candidat;
import model.Cv;

/**
 *
 * @author XAVIER
 */
public interface CvDAO {

    void creerCV(Cv cv);

    List<Cv> getAllCv();

    Cv getCv(Long codeCv);

    Cv getCvCandidat(Long codeCan);

    void modifCv(Cv cv,Long codeCv);

    void suprCv(Long codeCv);

    boolean verifCV(Candidat candidat);
    
}
