/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author XAVIER
 */
@Entity
@Table(name = "competence", catalog = "einsertion_bd", schema = "")
@NamedQueries({
    @NamedQuery(name = "Competence.findAll", query = "SELECT c FROM Competence c ORDER BY c.codeComp DESC"),
    @NamedQuery(name = "Competence.findAllByCodeCan", query = "SELECT c FROM Competence c WHERE c.codeCv.codeCan.codeCan = :codeCan ORDER BY c.codeComp DESC"),
    @NamedQuery(name = "Competence.findByCodeComp", query = "SELECT c FROM Competence c WHERE c.codeComp = :codeComp")})
public class Competence implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "code_comp", nullable = false)
    private Long codeComp;
    @Column(name = "domaine", length = 150)
    private String domaine;
    @Column(name = "specialite", length = 100)
    private String specialite;
    @Lob
    @Size(max = 65535)
    @Column(name = "libelle_comp", length = 65535)
    private String libelleComp;
    @JoinColumn(name = "code_cv", referencedColumnName = "code_cv")
    @ManyToOne
    private Cv codeCv;

    public Competence() {
    }

    public Competence(Long codeComp, String domaine, String specialite, String libelleComp, Cv codeCv) {
        this.codeComp = codeComp;
        this.domaine = domaine;
        this.specialite = specialite;
        this.libelleComp = libelleComp;
        this.codeCv = codeCv;
    }

    public Long getCodeComp() {
        return codeComp;
    }

    public void setCodeComp(Long codeComp) {
        this.codeComp = codeComp;
    }

    public String getLibelleComp() {
        return libelleComp;
    }

    public void setLibelleComp(String libelleComp) {
        this.libelleComp = libelleComp;
    }

    public Cv getCodeCv() {
        return codeCv;
    }

    public void setCodeCv(Cv codeCv) {
        this.codeCv = codeCv;
    }   

    public String getDomaine() {
        return domaine;
    }

    public void setDomaine(String domaine) {
        this.domaine = domaine;
    }

    public String getSpecialite() {
        return specialite;
    }

    public void setSpecialite(String specialite) {
        this.specialite = specialite;
    }
}
