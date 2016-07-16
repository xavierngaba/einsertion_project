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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author XAVIER
 */
@Entity
@Table(name = "entreprise", catalog = "einsertion_bd", schema = "")
@NamedQueries({
    @NamedQuery(name = "Entreprise.findAll", query = "SELECT e FROM Entreprise e"),
    @NamedQuery(name = "Entreprise.verifEntreprise", query = "SELECT COUNT(e) FROM Entreprise e WHERE e.code.code = :code"),
    @NamedQuery(name = "Entreprise.findByCodeEnt", query = "SELECT e FROM Entreprise e WHERE e.codeEnt = :codeEnt"),
    @NamedQuery(name = "Entreprise.findByCode", query = "SELECT e FROM Entreprise e WHERE e.code.code = :code"),
    @NamedQuery(name = "Entreprise.findByNomEnt", query = "SELECT e FROM Entreprise e WHERE e.nomEnt = :nomEnt"),
    @NamedQuery(name = "Entreprise.findBySectAct", query = "SELECT e FROM Entreprise e WHERE e.sectAct = :sectAct"),
    @NamedQuery(name = "Entreprise.findByTelEnt", query = "SELECT e FROM Entreprise e WHERE e.telEnt = :telEnt"),
    @NamedQuery(name = "Entreprise.findBySiteEnt", query = "SELECT e FROM Entreprise e WHERE e.siteEnt = :siteEnt"),
    @NamedQuery(name = "Entreprise.findByNomRespEnt", query = "SELECT e FROM Entreprise e WHERE e.nomRespEnt = :nomRespEnt"),
    @NamedQuery(name = "Entreprise.findByPrenomRespEnt", query = "SELECT e FROM Entreprise e WHERE e.prenomRespEnt = :prenomRespEnt"),
    @NamedQuery(name = "Entreprise.findByEmailEnt", query = "SELECT e FROM Entreprise e WHERE e.emailEnt = :emailEnt")})
public class Entreprise implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @NotNull
    @Column(name = "code_ent", nullable = false)
    private Long codeEnt;
    @Size(max = 100)
    @Column(name = "nom_ent", length = 100)
    private String nomEnt;
    @Size(max = 100)
    @Column(name = "sect_act", length = 100)
    private String sectAct;
    @Column(name = "tel_ent")
    private String telEnt;
    @Size(max = 100)
    @Column(name = "site_ent", length = 100)
    private String siteEnt;
    @Lob
    @Size(max = 65535)
    @Column(name = "descr_ent", length = 65535)
    private String descrEnt;
    @Size(max = 50)
    @Column(name = "nom_resp_ent", length = 50)
    private String nomRespEnt;
    @Size(max = 100)
    @Column(name = "prenom_resp_ent", length = 100)
    private String prenomRespEnt;
    @Size(max = 100)
    @Column(name = "email_ent", length = 100)
    private String emailEnt;
    @OneToMany(mappedBy = "codeEnt")
    private List<OffreEmploi> offreEmploiList;
    @JoinColumn(name = "code", referencedColumnName = "code")
    @OneToOne(cascade={ CascadeType.PERSIST, CascadeType.MERGE})
    private Users code;

    public Entreprise() {
    }

    public Entreprise(String nomEnt, String sectAct, String telEnt, String siteEnt, String descrEnt, String nomRespEnt, String prenomRespEnt, String emailEnt, Users code) {
        this.nomEnt = nomEnt;
        this.sectAct = sectAct;
        this.telEnt = telEnt;
        this.siteEnt = siteEnt;
        this.descrEnt = descrEnt;
        this.nomRespEnt = nomRespEnt;
        this.prenomRespEnt = prenomRespEnt;
        this.emailEnt = emailEnt;
        this.code = code;
    }

    public Long getCodeEnt() {
        return codeEnt;
    }

    public void setCodeEnt(Long codeEnt) {
        this.codeEnt = codeEnt;
    }

    public String getNomEnt() {
        return nomEnt;
    }

    public void setNomEnt(String nomEnt) {
        this.nomEnt = nomEnt;
    }

    public String getSectAct() {
        return sectAct;
    }

    public void setSectAct(String sectAct) {
        this.sectAct = sectAct;
    }

    public String getTelEnt() {
        return telEnt;
    }

    public void setTelEnt(String telEnt) {
        this.telEnt = telEnt;
    }

    public String getSiteEnt() {
        return siteEnt;
    }

    public void setSiteEnt(String siteEnt) {
        this.siteEnt = siteEnt;
    }

    public String getDescrEnt() {
        return descrEnt;
    }

    public void setDescrEnt(String descrEnt) {
        this.descrEnt = descrEnt;
    }

    public String getNomRespEnt() {
        return nomRespEnt;
    }

    public void setNomRespEnt(String nomRespEnt) {
        this.nomRespEnt = nomRespEnt;
    }

    public String getPrenomRespEnt() {
        return prenomRespEnt;
    }

    public void setPrenomRespEnt(String prenomRespEnt) {
        this.prenomRespEnt = prenomRespEnt;
    }

    public String getEmailEnt() {
        return emailEnt;
    }

    public void setEmailEnt(String emailEnt) {
        this.emailEnt = emailEnt;
    }

    public List<OffreEmploi> getOffreEmploiList() {
        return offreEmploiList;
    }

    public void setOffreEmploiList(List<OffreEmploi> offreEmploiList) {
        this.offreEmploiList = offreEmploiList;
    }

    public Users getCode() {
        return code;
    }

    public void setCode(Users code) {
        this.code = code;
    }
}
