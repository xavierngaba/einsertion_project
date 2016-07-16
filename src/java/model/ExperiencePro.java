/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Date;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author XAVIER
 */
@Entity
@Table(name = "experience_pro", catalog = "einsertion_bd", schema = "")
@NamedQueries({
    @NamedQuery(name = "ExperiencePro.findAll", query = "SELECT e FROM ExperiencePro e ORDER BY e.codeExp DESC"),
    @NamedQuery(name = "ExperiencePro.findAllByCodeCan", query = "SELECT e FROM ExperiencePro e WHERE e.codeCv.codeCan.codeCan = :codeCan ORDER BY e.dateDebut DESC"),
    @NamedQuery(name = "ExperiencePro.findByCodeExp", query = "SELECT e FROM ExperiencePro e WHERE e.codeExp = :codeExp"),
    @NamedQuery(name = "ExperiencePro.findByNomStructure", query = "SELECT e FROM ExperiencePro e WHERE e.nomStructure = :nomStructure"),
    @NamedQuery(name = "ExperiencePro.findByActiviteStructure", query = "SELECT e FROM ExperiencePro e WHERE e.activiteStructure = :activiteStructure"),
    @NamedQuery(name = "ExperiencePro.findByPoste", query = "SELECT e FROM ExperiencePro e WHERE e.poste = :poste"),
    @NamedQuery(name = "ExperiencePro.findByDateDebut", query = "SELECT e FROM ExperiencePro e WHERE e.dateDebut = :dateDebut"),
    @NamedQuery(name = "ExperiencePro.findByDateFin", query = "SELECT e FROM ExperiencePro e WHERE e.dateFin = :dateFin")})
public class ExperiencePro implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @NotNull
    @Column(name = "code_exp", nullable = false)
    private Long codeExp;
    @Size(max = 100)
    @Column(name = "nom_structure", length = 100)
    private String nomStructure;
    @Size(max = 150)
    @Column(name = "activite_structure", length = 150)
    private String activiteStructure;
    @Size(max = 100)
    @Column(name = "poste", length = 100)
    private String poste;
    @Column(name = "date_debut")
    private Date dateDebut;
    @Column(name = "date_fin")
    private Date dateFin;
    @Lob
    @Size(max = 65535)
    @Column(name = "taches_effectuees", length = 65535)
    private String tachesEffectuees;
    @JoinColumn(name = "code_cv", referencedColumnName = "code_cv")
    @ManyToOne
    private Cv codeCv;

    public ExperiencePro() {
    }

    public ExperiencePro(String nomStructure, String activiteStructure, String poste, Date dateDebut, Date dateFin, String tachesEffectuees, Cv codeCv) {
        this.nomStructure = nomStructure;
        this.activiteStructure = activiteStructure;
        this.poste = poste;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.tachesEffectuees = tachesEffectuees;
        this.codeCv = codeCv;
    }

    public Long getCodeExp() {
        return codeExp;
    }

    public void setCodeExp(Long codeExp) {
        this.codeExp = codeExp;
    }

    public String getNomStructure() {
        return nomStructure;
    }

    public void setNomStructure(String nomStructure) {
        this.nomStructure = nomStructure;
    }

    public String getActiviteStructure() {
        return activiteStructure;
    }

    public void setActiviteStructure(String activiteStructure) {
        this.activiteStructure = activiteStructure;
    }

    public String getPoste() {
        return poste;
    }

    public void setPoste(String poste) {
        this.poste = poste;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public String getTachesEffectuees() {
        return tachesEffectuees;
    }

    public void setTachesEffectuees(String tachesEffectuees) {
        this.tachesEffectuees = tachesEffectuees;
    }

    public Cv getCodeCv() {
        return codeCv;
    }

    public void setCodeCv(Cv codeCv) {
        this.codeCv = codeCv;
    }
}
