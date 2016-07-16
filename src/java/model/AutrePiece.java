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
@Table(name = "autre_piece", catalog = "einsertion_bd", schema = "")
@NamedQueries({
    @NamedQuery(name = "AutrePiece.findAll", query = "SELECT a FROM AutrePiece a"),
    @NamedQuery(name = "AutrePiece.findByCodePiece", query = "SELECT a FROM AutrePiece a WHERE a.codePiece = :codePiece"),
    @NamedQuery(name = "AutrePiece.findByNomPiece", query = "SELECT a FROM AutrePiece a WHERE a.nomPiece = :nomPiece"),
    @NamedQuery(name = "AutrePiece.findByPiece", query = "SELECT a FROM AutrePiece a WHERE a.piece = :piece")})
public class AutrePiece implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @NotNull
    @Column(name = "code_piece", nullable = false)
    private Long codePiece;
    @Size(max = 50)
    @Column(name = "nom_piece", length = 50)
    private String nomPiece;
    @Size(max = 100)
    @Column(name = "piece", length = 100)
    private String piece;
    @JoinColumn(name = "code_can", referencedColumnName = "code_can")
    @ManyToOne
    private Candidat codeCan;

    public AutrePiece() {
    }

    public AutrePiece(String nomPiece, String piece, Candidat codeCan) {
        this.nomPiece = nomPiece;
        this.piece = piece;
        this.codeCan = codeCan;
    }

    public Long getCodePiece() {
        return codePiece;
    }

    public void setCodePiece(Long codePiece) {
        this.codePiece = codePiece;
    }

    public String getNomPiece() {
        return nomPiece;
    }

    public void setNomPiece(String nomPiece) {
        this.nomPiece = nomPiece;
    }

    public String getPiece() {
        return piece;
    }

    public void setPiece(String piece) {
        this.piece = piece;
    }

    public Candidat getCodeCan() {
        return codeCan;
    }

    public void setCodeCan(Candidat codeCan) {
        this.codeCan = codeCan;
    }  
}
