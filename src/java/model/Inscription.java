/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author XAVIER
 */
@Entity
@Table(name = "inscription", catalog = "einsertion_bd", schema = "")
@NamedQueries({
    @NamedQuery(name = "Inscription.findAll", query = "SELECT i FROM Inscription i"),
    @NamedQuery(name = "Inscription.findAllByCodeCan", query = "SELECT i FROM Inscription i where i.candidat.codeCan = :codeCan"),
    @NamedQuery(name = "Inscription.findByCodeCan", query = "SELECT i FROM Inscription i WHERE i.inscriptionPK.codeCan = :codeCan"),
    @NamedQuery(name = "Inscription.findByCodeOffreForm", query = "SELECT i FROM Inscription i WHERE i.inscriptionPK.codeOffreForm = :codeOffreForm"),
    @NamedQuery(name = "Inscription.findByDateInsc", query = "SELECT i FROM Inscription i WHERE i.dateInsc = :dateInsc")})
public class Inscription implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected InscriptionPK inscriptionPK;
    @Column(name = "date_insc")
    private String dateInsc;
    @JoinColumn(name = "code_can", referencedColumnName = "code_can", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Candidat candidat;
    @JoinColumn(name = "code_offre_form", referencedColumnName = "code_offre_form", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private OffreFormation offreFormation;

    public Inscription() {
    }

    public Inscription(InscriptionPK inscriptionPK) {
        this.inscriptionPK = inscriptionPK;
    }

    public Inscription(long codeCan, long codeOffreForm, String dateInsc) {
        this.inscriptionPK = new InscriptionPK(codeCan, codeOffreForm);
        this.dateInsc = dateInsc;
    }

    public InscriptionPK getInscriptionPK() {
        return inscriptionPK;
    }

    public void setInscriptionPK(InscriptionPK inscriptionPK) {
        this.inscriptionPK = inscriptionPK;
    }

    public String getDateInsc() {
        return dateInsc;
    }

    public void setDateInsc(String dateInsc) {
        this.dateInsc = dateInsc;
    }

    public Candidat getCandidat() {
        return candidat;
    }

    public void setCandidat(Candidat candidat) {
        this.candidat = candidat;
    }

    public OffreFormation getOffreFormation() {
        return offreFormation;
    }

    public void setOffreFormation(OffreFormation offreFormation) {
        this.offreFormation = offreFormation;
    }   
}
