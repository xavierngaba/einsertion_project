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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author XAVIER
 */
@Entity
@Table(name = "users", catalog = "einsertion_bd", schema = "")
@NamedQueries({
    @NamedQuery(name = "Users.findAll", query = "SELECT u FROM Users u ORDER BY u.code DESC"),
    @NamedQuery(name = "Users.findByCode", query = "SELECT u FROM Users u WHERE u.code = :code"),
    @NamedQuery(name = "Users.findByLogPass", query = "SELECT u FROM Users u WHERE u.login = :login AND u.pass = :pass"),
    @NamedQuery(name = "Users.findByLogin", query = "SELECT COUNT(u) FROM Users u WHERE u.login = :login"),
    @NamedQuery(name = "Users.verif", query = "SELECT COUNT(u) FROM Users u WHERE u.login = :login AND u.pass = :pass")})
public class Users implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "code", nullable = false)
    private Long code;
    @Size(max = 50)
    @Column(name = "login", length = 50)
    private String login;
    @Size(max = 50)
    @Column(name = "pass", length = 200)
    private String pass;
    @OneToMany(mappedBy = "code")
    private List<Candidat> candidatList;
    @OneToMany(mappedBy = "code")
    private List<Entreprise> entrepriseList;
    @OneToMany(mappedBy = "code")
    private List<Institut> institutList;

    public Users() {
    }

    public Users(String login, String pass) {
        this.login = login;
        this.pass = pass;
    }

    public Long getCode() {
        return code;
    }

    public void setCode(Long code) {
        this.code = code;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public List<Candidat> getCandidatList() {
        return candidatList;
    }

    public void setCandidatList(List<Candidat> candidatList) {
        this.candidatList = candidatList;
    }

    public List<Entreprise> getEntrepriseList() {
        return entrepriseList;
    }

    public void setEntrepriseList(List<Entreprise> entrepriseList) {
        this.entrepriseList = entrepriseList;
    }

    public List<Institut> getInstitutList() {
        return institutList;
    }

    public void setInstitutList(List<Institut> institutList) {
        this.institutList = institutList;
    }
}
