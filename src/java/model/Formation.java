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
@Table(name = "formation", catalog = "einsertion_bd", schema = "")
@NamedQueries({
    @NamedQuery(name = "Formation.findAll", query = "SELECT f FROM Formation f ORDER BY f.codeForm DESC"),
    @NamedQuery(name = "Formation.findByCodeForm", query = "SELECT f FROM Formation f WHERE f.codeForm = :codeForm"),
    @NamedQuery(name = "Formation.findAllByCodeCan", query = "SELECT f FROM Formation f WHERE f.codeCv.codeCan.codeCan = :codeCan ORDER BY f.anneeAca DESC"),
    @NamedQuery(name = "Formation.findByEtablissement", query = "SELECT f FROM Formation f WHERE f.etablissement = :etablissement"),
    @NamedQuery(name = "Formation.findByAnneeAca", query = "SELECT f FROM Formation f WHERE f.anneeAca = :anneeAca"),
    @NamedQuery(name = "Formation.findByDiplome", query = "SELECT f FROM Formation f WHERE f.diplome = :diplome")})
public class Formation implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @NotNull
    @Column(name = "code_form", nullable = false)
    private Long codeForm;
    @Size(max = 100)
    @Column(name = "etablissement", length = 100)
    private String etablissement;
    @Size(max = 10)
    @Column(name = "annee_aca", length = 10)
    private String anneeAca;
    @Size(max = 50)
    @Column(name = "diplome", length = 50)
    private String diplome;
    @Column(name = "options", length = 100)
    private String options;
    @JoinColumn(name = "code_cv", referencedColumnName = "code_cv")
    @ManyToOne
    private Cv codeCv;

    public Formation() {
    }

    public Formation(String etablissement, String anneeAca, String diplome, String options, Cv codeCv) {
        this.etablissement = etablissement;
        this.anneeAca = anneeAca;
        this.diplome = diplome;
        this.options = options;
        this.codeCv = codeCv;
    }

    public Long getCodeForm() {
        return codeForm;
    }

    public void setCodeForm(Long codeForm) {
        this.codeForm = codeForm;
    }

    public String getEtablissement() {
        return etablissement;
    }

    public void setEtablissement(String etablissement) {
        this.etablissement = etablissement;
    }

    public String getAnneeAca() {
        return anneeAca;
    }

    public void setAnneeAca(String anneeAca) {
        this.anneeAca = anneeAca;
    }

    public String getDiplome() {
        return diplome;
    }

    public void setDiplome(String diplome) {
        this.diplome = diplome;
    }

    public String getOption() {
        return options;
    }

    public void setOption(String option) {
        this.options = option;
    }

    public Cv getCodeCv() {
        return codeCv;
    }

    public void setCodeCv(Cv codeCv) {
        this.codeCv = codeCv;
    }   
}
