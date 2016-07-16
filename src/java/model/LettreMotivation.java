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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author XAVIER
 */
@Entity
@Table(name = "lettre_motivation", catalog = "einsertion_bd", schema = "")
@NamedQueries({
    @NamedQuery(name = "LettreMotivation.findAll", query = "SELECT l FROM LettreMotivation l"),
    @NamedQuery(name = "LettreMotivation.findByCodeOffreEmp", query = "SELECT l FROM LettreMotivation l WHERE l.code_offre_emp.codeOffreEmp = :codeOffreEmp"),
    @NamedQuery(name = "LettreMotivation.findByCandidatOffreEmp", query = "SELECT l FROM LettreMotivation l WHERE l.codeCan.codeCan = :codeCan AND l.code_offre_emp.codeOffreEmp = :codeOffreEmp"),
    @NamedQuery(name = "LettreMotivation.findByCodeLettre", query = "SELECT l FROM LettreMotivation l WHERE l.codeLettre = :codeLettre")})
public class LettreMotivation implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @NotNull
    @Column(name = "code_lettre", nullable = false)
    private Long codeLettre;
    @Lob
    @Size(max = 65535)
    @Column(name = "libelle", length = 65535)
    private String libelle;
    @JoinColumn(name = "code_can", referencedColumnName = "code_can")
    @ManyToOne
    private Candidat codeCan;
    @JoinColumn(name = "code_offre_emp", referencedColumnName = "code_offre_emp")
    @ManyToOne
    private OffreEmploi code_offre_emp;

    public LettreMotivation() {
    }

    public LettreMotivation(String libelle, Candidat codeCan, OffreEmploi code_offre_emp) {
        this.libelle = libelle;
        this.codeCan = codeCan;
        this.code_offre_emp = code_offre_emp;
    }

    public OffreEmploi getCode_offre_emp() {
        return code_offre_emp;
    }

    public void setCode_offre_emp(OffreEmploi code_offre_emp) {
        this.code_offre_emp = code_offre_emp;
    }


    public Long getCodeLettre() {
        return codeLettre;
    }

    public void setCodeLettre(Long codeLettre) {
        this.codeLettre = codeLettre;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public Candidat getCodeCan() {
        return codeCan;
    }

    public void setCodeCan(Candidat codeCan) {
        this.codeCan = codeCan;
    }  
}
