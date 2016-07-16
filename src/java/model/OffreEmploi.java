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
@Table(name = "offre_emploi", catalog = "einsertion_bd", schema = "")
@NamedQueries({
    @NamedQuery(name = "OffreEmploi.findAll", query = "SELECT o FROM OffreEmploi o ORDER BY o.codeOffreEmp DESC"),
    @NamedQuery(name = "OffreEmploi.findByDomaineOffreEmp", query = "SELECT o FROM OffreEmploi o WHERE o.domaine = :domaine ORDER BY o.codeOffreEmp DESC"),
    @NamedQuery(name = "OffreEmploi.findByEnt", query = "SELECT o FROM OffreEmploi o WHERE o.codeEnt.codeEnt = :codeEnt ORDER BY o.codeOffreEmp DESC"),
    @NamedQuery(name = "OffreEmploi.findByCodeOffreEmp", query = "SELECT o FROM OffreEmploi o WHERE o.codeOffreEmp = :codeOffreEmp"),
    @NamedQuery(name = "OffreEmploi.findByEntByUser", query = "SELECT o FROM OffreEmploi o WHERE o.codeEnt.code.code = :codeUser ORDER BY o.codeOffreEmp DESC"),
    @NamedQuery(name = "OffreEmploi.findByDomaine", query = "SELECT o FROM OffreEmploi o WHERE o.domaine = :domaine"),
    @NamedQuery(name = "OffreEmploi.findByAdressePost", query = "SELECT o FROM OffreEmploi o WHERE o.adressePost = :adressePost"),
    @NamedQuery(name = "OffreEmploi.findByVillePoste", query = "SELECT o FROM OffreEmploi o WHERE o.villePoste = :villePoste ORDER BY o.codeOffreEmp DESC")})
public class OffreEmploi implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @NotNull
    @Column(name = "code_offre_emp", nullable = false)
    private Long codeOffreEmp;
    @Column(name = "date_offre_emp")
    private String dateOffreEmp;
    @Column(name = "poste")
    private String poste;
    @Lob
    @Size(max = 65535)
    @Column(name = "descrip_poste", length = 65535)
    private String descripPoste;
    @Lob
    @Size(max = 65535)
    @Column(name = "qualite_req", length = 65535)
    private String qualiteReq;
    @Size(max = 100)
    @Column(name = "domaine", length = 100)
    private String domaine;
    @Size(max = 100)
    @Column(name = "adresse_post", length = 100)
    private String adressePost;
    @Size(max = 100)
    @Column(name = "ville_poste", length = 100)
    private String villePoste;
    @JoinColumn(name = "code_ent", referencedColumnName = "code_ent")
    @ManyToOne
    private Entreprise codeEnt;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "offreEmploi")
    private List<Postulat> postulatList;

    public OffreEmploi() {
    }

    public OffreEmploi(String dateOffreEmp, String poste, String descripPoste, String qualiteReq, String domaine, String adressePost, String villePoste, Entreprise codeEnt) {
        this.dateOffreEmp = dateOffreEmp;
        this.poste = poste;
        this.descripPoste = descripPoste;
        this.qualiteReq = qualiteReq;
        this.domaine = domaine;
        this.adressePost = adressePost;
        this.villePoste = villePoste;
        this.codeEnt = codeEnt;
    }

    public Long getCodeOffreEmp() {
        return codeOffreEmp;
    }

    public void setCodeOffreEmp(Long codeOffreEmp) {
        this.codeOffreEmp = codeOffreEmp;
    }

    public String getDateOffreEmp() {
        return dateOffreEmp;
    }

    public void setDateOffreEmp(String dateOffreEmp) {
        this.dateOffreEmp = dateOffreEmp;
    }

    public String getPoste() {
        return poste;
    }

    public void setPoste(String poste) {
        this.poste = poste;
    }

    public String getDescripPoste() {
        return descripPoste;
    }

    public void setDescripPoste(String descripPoste) {
        this.descripPoste = descripPoste;
    }

    public String getQualiteReq() {
        return qualiteReq;
    }

    public void setQualiteReq(String qualiteReq) {
        this.qualiteReq = qualiteReq;
    }

    public String getDomaine() {
        return domaine;
    }

    public void setDomaine(String domaine) {
        this.domaine = domaine;
    }

    public String getAdressePost() {
        return adressePost;
    }

    public void setAdressePost(String adressePost) {
        this.adressePost = adressePost;
    }

    public String getVillePoste() {
        return villePoste;
    }

    public void setVillePoste(String villePoste) {
        this.villePoste = villePoste;
    }

    public Entreprise getCodeEnt() {
        return codeEnt;
    }

    public void setCodeEnt(Entreprise codeEnt) {
        this.codeEnt = codeEnt;
    }

    public List<Postulat> getPostulatList() {
        return postulatList;
    }

    public void setPostulatList(List<Postulat> postulatList) {
        this.postulatList = postulatList;
    }   
}
