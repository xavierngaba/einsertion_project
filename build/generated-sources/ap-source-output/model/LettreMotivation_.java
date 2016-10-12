package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Candidat;
import model.OffreEmploi;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2016-07-14T19:44:52")
@StaticMetamodel(LettreMotivation.class)
public class LettreMotivation_ { 

    public static volatile SingularAttribute<LettreMotivation, Candidat> codeCan;
    public static volatile SingularAttribute<LettreMotivation, OffreEmploi> code_offre_emp;
    public static volatile SingularAttribute<LettreMotivation, String> libelle;
    public static volatile SingularAttribute<LettreMotivation, Long> codeLettre;

}