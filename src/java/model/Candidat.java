/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author XAVIER
 */
@Entity
@Table(name = "candidat", catalog = "einsertion_bd", schema = "")
@NamedQueries({
    @NamedQuery(name = "Candidat.findAll", query = "SELECT c FROM Candidat c"),
    @NamedQuery(name = "Candidat.verifCandidat", query = "SELECT COUNT(c) FROM Candidat c WHERE c.code.code = :code"),
    @NamedQuery(name = "Candidat.findByCodeCan", query = "SELECT c FROM Candidat c WHERE c.codeCan = :codeCan"),
    @NamedQuery(name = "Candidat.findByCode", query = "SELECT c FROM Candidat c WHERE c.code.code = :code"),
    @NamedQuery(name = "Candidat.findByNomCan", query = "SELECT c FROM Candidat c WHERE c.nomCan = :nomCan"),
    @NamedQuery(name = "Candidat.findByPrenomCan", query = "SELECT c FROM Candidat c WHERE c.prenomCan = :prenomCan"),
    @NamedQuery(name = "Candidat.findByAdresse", query = "SELECT c FROM Candidat c WHERE c.adresse = :adresse"),
    @NamedQuery(name = "Candidat.findByVilleCan", query = "SELECT c FROM Candidat c WHERE c.villeCan = :villeCan"),
    @NamedQuery(name = "Candidat.findByTel1Can", query = "SELECT c FROM Candidat c WHERE c.tel1Can = :tel1Can"),
    @NamedQuery(name = "Candidat.findByDateNaiss", query = "SELECT c FROM Candidat c WHERE c.dateNaiss = :dateNaiss"),
    @NamedQuery(name = "Candidat.findByEmailCan", query = "SELECT c FROM Candidat c WHERE c.emailCan = :emailCan")})
public class Candidat implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "code_can", nullable = false)
    private Long codeCan;
    @Size(max = 100)
    @Column(name = "nom_can", length = 100)
    private String nomCan;
    @Size(max = 100)
    @Column(name = "prenom_can", length = 100)
    private String prenomCan;
    @Size(max = 50)
    @Column(name = "adresse", length = 50)
    private String adresse;
    @Size(max = 50)
    @Column(name = "ville_can", length = 50)
    private String villeCan;
    @Column(name = "tel1_can")
    private String tel1Can;
    @Column(name = "date_naiss")
    private Date dateNaiss;
    @Size(max = 50)
    @Column(name = "email_can", length = 50)
    private String emailCan;
    @Size(max = 150)
    @Column(name = "domaine", length = 150)
    private String domaine;
    @JoinColumn(name = "code", referencedColumnName = "code")
    @OneToOne(cascade={ CascadeType.PERSIST, CascadeType.MERGE})
    private Users code;
    @OneToMany(mappedBy = "codeCan")
    private List<LettreMotivation> lettreMotivationList;
    @OneToMany(mappedBy = "codeCan")
    private List<Cv> cvList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "candidat")
    private List<Postulat> postulatList;
    @OneToMany(mappedBy = "codeCan")
    private List<AutrePiece> autrePieceList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "candidat")
    private List<Inscription> inscriptionList;

    public Candidat() {
    }

    public Candidat(String nomCan, String prenomCan, String adresse, String villeCan, String tel1Can, Date dateNaiss, String emailCan, String domaine, Users code) {
        this.nomCan = nomCan;
        this.prenomCan = prenomCan;
        this.adresse = adresse;
        this.villeCan = villeCan;
        this.tel1Can = tel1Can;
        this.dateNaiss = dateNaiss;
        this.emailCan = emailCan;
        this.domaine = domaine;
        this.code = code;
    }

    public Long getCodeCan() {
        return codeCan;
    }

    public void setCodeCan(Long codeCan) {
        this.codeCan = codeCan;
    }

    public String getNomCan() {
        return nomCan;
    }

    public void setNomCan(String nomCan) {
        this.nomCan = nomCan;
    }

    public String getPrenomCan() {
        return prenomCan;
    }

    public void setPrenomCan(String prenomCan) {
        this.prenomCan = prenomCan;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getVilleCan() {
        return villeCan;
    }

    public void setVilleCan(String villeCan) {
        this.villeCan = villeCan;
    }

    public String getTel1Can() {
        return tel1Can;
    }

    public void setTel1Can(String tel1Can) {
        this.tel1Can = tel1Can;
    }

    public Date getDateNaiss() {
        return dateNaiss;
    }

    public void setDateNaiss(Date dateNaiss) {
        this.dateNaiss = dateNaiss;
    }

    public String getEmailCan() {
        return emailCan;
    }

    public void setEmailCan(String emailCan) {
        this.emailCan = emailCan;
    }

    public String getDomaine() {
        return domaine;
    }

    public void setDomaine(String domaine) {
        this.domaine = domaine;
    }

    public Users getCode() {
        return code;
    }

    public void setCode(Users code) {
        this.code = code;
    }

    public List<LettreMotivation> getLettreMotivationList() {
        return lettreMotivationList;
    }

    public void setLettreMotivationList(List<LettreMotivation> lettreMotivationList) {
        this.lettreMotivationList = lettreMotivationList;
    }

    public List<Cv> getCvList() {
        return cvList;
    }

    public void setCvList(List<Cv> cvList) {
        this.cvList = cvList;
    }

    public List<Postulat> getPostulatList() {
        return postulatList;
    }

    public void setPostulatList(List<Postulat> postulatList) {
        this.postulatList = postulatList;
    }

    public List<AutrePiece> getAutrePieceList() {
        return autrePieceList;
    }

    public void setAutrePieceList(List<AutrePiece> autrePieceList) {
        this.autrePieceList = autrePieceList;
    }

    public List<Inscription> getInscriptionList() {
        return inscriptionList;
    }

    public void setInscriptionList(List<Inscription> inscriptionList) {
        this.inscriptionList = inscriptionList;
    }  
}
