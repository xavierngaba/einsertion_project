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
@Table(name = "institut", catalog = "einsertion_bd", schema = "")
@NamedQueries({
    @NamedQuery(name = "Institut.findAll", query = "SELECT i FROM Institut i"),
    @NamedQuery(name = "Institut.verifInstitut", query = "SELECT COUNT(i) FROM Institut i WHERE i.code.code = :code"),
    @NamedQuery(name = "Institut.findByCodeIns", query = "SELECT i FROM Institut i WHERE i.codeIns = :codeIns"),
    @NamedQuery(name = "Institut.findByCode", query = "SELECT i FROM Institut i WHERE i.code.code = :code"),
    @NamedQuery(name = "Institut.findByNomIns", query = "SELECT i FROM Institut i WHERE i.nomIns = :nomIns"),
    @NamedQuery(name = "Institut.findByNomRespIns", query = "SELECT i FROM Institut i WHERE i.nomRespIns = :nomRespIns"),
    @NamedQuery(name = "Institut.findByPrenomRespIns", query = "SELECT i FROM Institut i WHERE i.prenomRespIns = :prenomRespIns"),
    @NamedQuery(name = "Institut.findBySiteIns", query = "SELECT i FROM Institut i WHERE i.siteIns = :siteIns"),
    @NamedQuery(name = "Institut.findByTelIns", query = "SELECT i FROM Institut i WHERE i.telIns = :telIns"),
    @NamedQuery(name = "Institut.findByEmailIns", query = "SELECT i FROM Institut i WHERE i.emailIns = :emailIns")})
public class Institut implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @NotNull
    @Column(name = "code_ins", nullable = false)
    private Long codeIns;
    @Size(max = 100)
    @Column(name = "nom_ins", length = 100)
    private String nomIns;
    @Lob
    @Size(max = 65535)
    @Column(name = "descrip_ins", length = 65535)
    private String descripIns;
    @Size(max = 100)
    @Column(name = "nom_resp_ins", length = 100)
    private String nomRespIns;
    @Size(max = 100)
    @Column(name = "prenom_resp_ins", length = 100)
    private String prenomRespIns;
    @Size(max = 100)
    @Column(name = "site_ins", length = 100)
    private String siteIns;
    @Column(name = "tel_ins")
    private String telIns;
    @Size(max = 100)
    @Column(name = "email_ins", length = 100)
    private String emailIns;
    @OneToMany(mappedBy = "codeIns")
    private List<OffreFormation> offreFormationList;
    @JoinColumn(name = "code", referencedColumnName = "code")
    @OneToOne(cascade={ CascadeType.PERSIST, CascadeType.MERGE})
    private Users code;

    public Institut() {
    }

    public Institut(String nomIns, String descripIns, String nomRespIns, String prenomRespIns, String siteIns, String telIns, String emailIns, Users code) {
        this.nomIns = nomIns;
        this.descripIns = descripIns;
        this.nomRespIns = nomRespIns;
        this.prenomRespIns = prenomRespIns;
        this.siteIns = siteIns;
        this.telIns = telIns;
        this.emailIns = emailIns;
        this.code = code;
    }
    
    public Long getCodeIns() {
        return codeIns;
    }

    public void setCodeIns(Long codeIns) {
        this.codeIns = codeIns;
    }

    public String getNomIns() {
        return nomIns;
    }

    public void setNomIns(String nomIns) {
        this.nomIns = nomIns;
    }

    public String getDescripIns() {
        return descripIns;
    }

    public void setDescripIns(String descripIns) {
        this.descripIns = descripIns;
    }

    public String getNomRespIns() {
        return nomRespIns;
    }

    public void setNomRespIns(String nomRespIns) {
        this.nomRespIns = nomRespIns;
    }

    public String getPrenomRespIns() {
        return prenomRespIns;
    }

    public void setPrenomRespIns(String prenomRespIns) {
        this.prenomRespIns = prenomRespIns;
    }

    public String getSiteIns() {
        return siteIns;
    }

    public void setSiteIns(String siteIns) {
        this.siteIns = siteIns;
    }

    public String getTelIns() {
        return telIns;
    }

    public void setTelIns(String telIns) {
        this.telIns = telIns;
    }

    public String getEmailIns() {
        return emailIns;
    }

    public void setEmailIns(String emailIns) {
        this.emailIns = emailIns;
    }

    public List<OffreFormation> getOffreFormationList() {
        return offreFormationList;
    }

    public void setOffreFormationList(List<OffreFormation> offreFormationList) {
        this.offreFormationList = offreFormationList;
    }

    public Users getCode() {
        return code;
    }

    public void setCode(Users code) {
        this.code = code;
    }  
}
