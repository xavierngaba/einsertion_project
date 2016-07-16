/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author XAVIER
 */
@Embeddable
public class InscriptionPK implements Serializable {
    @Basic(optional = false)
    @NotNull
    @Column(name = "code_can", nullable = false)
    private long codeCan;
    @Basic(optional = false)
    @NotNull
    @Column(name = "code_offre_form", nullable = false)
    private long codeOffreForm;

    public InscriptionPK() {
    }

    public InscriptionPK(long codeCan, long codeOffreForm) {
        this.codeCan = codeCan;
        this.codeOffreForm = codeOffreForm;
    }

    public long getCodeCan() {
        return codeCan;
    }

    public void setCodeCan(long codeCan) {
        this.codeCan = codeCan;
    }

    public long getCodeOffreForm() {
        return codeOffreForm;
    }

    public void setCodeOffreForm(long codeOffreForm) {
        this.codeOffreForm = codeOffreForm;
    }  
}
