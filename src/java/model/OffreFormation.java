/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
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
@Table(name = "offre_formation", catalog = "einsertion_bd", schema = "")
@NamedQueries({
    @NamedQuery(name = "OffreFormation.findAll", query = "SELECT o FROM OffreFormation o ORDER BY o.dateOffreForm DESC"),
    @NamedQuery(name = "OffreFormation.findByCodeOffreForm", query = "SELECT o FROM OffreFormation o WHERE o.codeOffreForm = :codeOffreForm"),
    @NamedQuery(name = "OffreFormation.findByDomaineOffreForm", query = "SELECT o FROM OffreFormation o WHERE o.domaine = :domaine ORDER BY o.dateOffreForm DESC"),
    @NamedQuery(name = "OffreFormation.findByIns", query = "SELECT o FROM OffreFormation o WHERE o.codeIns.codeIns = :codeIns ORDER BY o.dateOffreForm DESC"),
    @NamedQuery(name = "OffreFormation.findByInsByUser", query = "SELECT o FROM OffreFormation o WHERE o.codeIns.code.code = :codeUser ORDER BY o.dateOffreForm DESC"),
    @NamedQuery(name = "OffreFormation.findByDateOffreForm", query = "SELECT o FROM OffreFormation o WHERE o.dateOffreForm = :dateOffreForm"),
    @NamedQuery(name = "OffreFormation.findByAdressForm", query = "SELECT o FROM OffreFormation o WHERE o.adressForm = :adressForm"),
    @NamedQuery(name = "OffreFormation.findByVilleForm", query = "SELECT o FROM OffreFormation o WHERE o.villeForm = :villeForm ORDER BY o.dateOffreForm DESC")})
public class OffreFormation implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @NotNull
    @Column(name = "code_offre_form", nullable = false)
    private Long codeOffreForm;
    @Column(name = "domaine")
    private String domaine;
    @Column(name = "date_offre_form")
    private String dateOffreForm;
    @Lob
    @Size(max = 65535)
    @Column(name = "descrip_form", length = 65535)
    private String descripForm;
    @Size(max = 100)
    @Column(name = "adress_form", length = 100)
    private String adressForm;
    @Size(max = 100)
    @Column(name = "ville_form", length = 100)
    private String villeForm;
    @JoinColumn(name = "code_ins", referencedColumnName = "code_ins")
    @ManyToOne
    private Institut codeIns;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "offreFormation")
    private List<Inscription> inscriptionList;

    public OffreFormation() {
    }

    public OffreFormation(String domaine, String dateOffreForm, String descripForm, String adressForm, String villeForm, Institut codeIns) {
        this.domaine = domaine;
        this.dateOffreForm = dateOffreForm;
        this.descripForm = descripForm;
        this.adressForm = adressForm;
        this.villeForm = villeForm;
        this.codeIns = codeIns;
    }

    public Long getCodeOffreForm() {
        return codeOffreForm;
    }

    public void setCodeOffreForm(Long codeOffreForm) {
        this.codeOffreForm = codeOffreForm;
    }

    public String getDomaine() {
        return domaine;
    }

    public void setDomaine(String domaine) {
        this.domaine = domaine;
    }

    public String getDateOffreForm() {
        return dateOffreForm;
    }

    public void setDateOffreForm(String dateOffreForm) {
        this.dateOffreForm = dateOffreForm;
    }

    public String getDescripForm() {
        return descripForm;
    }

    public void setDescripForm(String descripForm) {
        this.descripForm = descripForm;
    }

    public String getAdressForm() {
        return adressForm;
    }

    public void setAdressForm(String adressForm) {
        this.adressForm = adressForm;
    }

    public String getVilleForm() {
        return villeForm;
    }

    public void setVilleForm(String villeForm) {
        this.villeForm = villeForm;
    }

    public Institut getCodeIns() {
        return codeIns;
    }

    public void setCodeIns(Institut codeIns) {
        this.codeIns = codeIns;
    }

    public List<Inscription> getInscriptionList() {
        return inscriptionList;
    }

    public void setInscriptionList(List<Inscription> inscriptionList) {
        this.inscriptionList = inscriptionList;
    } 
}
