/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.List;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author XAVIER
 */
@Entity
@Table(name = "cv", catalog = "einsertion_bd", schema = "")
@NamedQueries({
    @NamedQuery(name = "Cv.findAll", query = "SELECT c FROM Cv c ORDER BY c.codeCv DESC"),
    @NamedQuery(name = "Cv.verif", query = "SELECT COUNT(c) FROM Cv c WHERE c.codeCan.codeCan = :codeCan"),
    @NamedQuery(name = "Cv.findByCodeCan", query = "SELECT c FROM Cv c WHERE c.codeCan.codeCan = :codeCan"),
    @NamedQuery(name = "Cv.findByCodeCv", query = "SELECT c FROM Cv c WHERE c.codeCv = :codeCv")})
public class Cv implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @NotNull
    @Column(name = "code_cv", nullable = false)
    private Long codeCv;
    @Lob
    @Size(max = 65535)
    @Column(name = "objectif", length = 65535)
    private String objectif;
    @OneToMany(mappedBy = "codeCv")
    private List<ExperiencePro> experienceProList;
    @JoinColumn(name = "code_can", referencedColumnName = "code_can")
    @ManyToOne
    private Candidat codeCan;
    @OneToMany(mappedBy = "codeCv")
    private List<Formation> formationList;
    @OneToMany(mappedBy = "codeCv")
    private List<Competence> competenceList;

    public Cv() {
    }

    public Cv(String objectif, Candidat codeCan) {
        this.objectif = objectif;
        this.codeCan = codeCan;
    }

    public Long getCodeCv() {
        return codeCv;
    }

    public void setCodeCv(Long codeCv) {
        this.codeCv = codeCv;
    }

    public String getObjectif() {
        return objectif;
    }

    public void setObjectif(String objectif) {
        this.objectif = objectif;
    }

    public List<ExperiencePro> getExperienceProList() {
        return experienceProList;
    }

    public void setExperienceProList(List<ExperiencePro> experienceProList) {
        this.experienceProList = experienceProList;
    }

    public Candidat getCodeCan() {
        return codeCan;
    }

    public void setCodeCan(Candidat codeCan) {
        this.codeCan = codeCan;
    }

    public List<Formation> getFormationList() {
        return formationList;
    }

    public void setFormationList(List<Formation> formationList) {
        this.formationList = formationList;
    }

    public List<Competence> getCompetenceList() {
        return competenceList;
    }

    public void setCompetenceList(List<Competence> competenceList) {
        this.competenceList = competenceList;
    }   
}
