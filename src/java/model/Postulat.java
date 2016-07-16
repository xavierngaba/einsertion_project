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
@Table(name = "postulat", catalog = "einsertion_bd", schema = "")
@NamedQueries({
    @NamedQuery(name = "Postulat.findAll", query = "SELECT p FROM Postulat p"),
    @NamedQuery(name = "Postulat.findByCodeCan", query = "SELECT p FROM Postulat p WHERE p.postulatPK.codeCan = :codeCan ORDER BY p.postulatPK.codeCan DESC"),
    @NamedQuery(name = "Postulat.verif", query = "SELECT COUNT(p) FROM Postulat p WHERE p.candidat.codeCan = :codeCan AND p.offreEmploi.codeOffreEmp = :codeOffreEmp"),
    @NamedQuery(name = "Postulat.findByCandidatOffreEmp", query = "SELECT p FROM Postulat p WHERE p.candidat.codeCan = :codeCan AND p.offreEmploi.codeOffreEmp = :codeOffreEmp"),
    @NamedQuery(name = "Postulat.findByCodeOffreEmp", query = "SELECT p FROM Postulat p WHERE p.postulatPK.codeOffreEmp = :codeOffreEmp ORDER BY p.postulatPK.codeOffreEmp DESC"),
    @NamedQuery(name = "Postulat.findByCodeEnt", query = "SELECT p FROM Postulat p WHERE p.offreEmploi.codeEnt.codeEnt = :codeEnt ORDER BY p.offreEmploi.codeOffreEmp ASC"),
    @NamedQuery(name = "Postulat.findByDatePost", query = "SELECT p FROM Postulat p WHERE p.datePost = :datePost")})
public class Postulat implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected PostulatPK postulatPK;
    @Column(name = "date_post")
    private String datePost;
    @JoinColumn(name = "code_can", referencedColumnName = "code_can", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Candidat candidat;
    @JoinColumn(name = "code_offre_emp", referencedColumnName = "code_offre_emp", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private OffreEmploi offreEmploi;

    public Postulat() {
    }

    public Postulat(PostulatPK postulatPK) {
        this.postulatPK = postulatPK;
    }

    public Postulat(long codeCan, long codeOffreEmp, String datePost) {
        this.postulatPK = new PostulatPK(codeCan, codeOffreEmp);
        this.datePost = datePost;
    }

    public PostulatPK getPostulatPK() {
        return postulatPK;
    }

    public void setPostulatPK(PostulatPK postulatPK) {
        this.postulatPK = postulatPK;
    }

    public String getDatePost() {
        return datePost;
    }

    public void setDatePost(String datePost) {
        this.datePost = datePost;
    }

    public Candidat getCandidat() {
        return candidat;
    }

    public void setCandidat(Candidat candidat) {
        this.candidat = candidat;
    }

    public OffreEmploi getOffreEmploi() {
        return offreEmploi;
    }

    public void setOffreEmploi(OffreEmploi offreEmploi) {
        this.offreEmploi = offreEmploi;
    }  
}
