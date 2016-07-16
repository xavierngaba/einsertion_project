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
public class PostulatPK implements Serializable {
    @Basic(optional = false)
    @NotNull
    @Column(name = "code_can", nullable = false)
    private long codeCan;
    @Basic(optional = false)
    @NotNull
    @Column(name = "code_offre_emp", nullable = false)
    private long codeOffreEmp;

    public PostulatPK() {
    }

    public PostulatPK(long codeCan, long codeOffreEmp) {
        this.codeCan = codeCan;
        this.codeOffreEmp = codeOffreEmp;
    }

    public long getCodeCan() {
        return codeCan;
    }

    public void setCodeCan(long codeCan) {
        this.codeCan = codeCan;
    }

    public long getCodeOffreEmp() {
        return codeOffreEmp;
    }

    public void setCodeOffreEmp(long codeOffreEmp) {
        this.codeOffreEmp = codeOffreEmp;
    }  
}
