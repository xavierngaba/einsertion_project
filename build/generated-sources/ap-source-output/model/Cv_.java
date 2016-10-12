package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Candidat;
import model.Competence;
import model.ExperiencePro;
import model.Formation;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2016-07-14T19:44:52")
@StaticMetamodel(Cv.class)
public class Cv_ { 

    public static volatile SingularAttribute<Cv, Candidat> codeCan;
    public static volatile ListAttribute<Cv, Formation> formationList;
    public static volatile SingularAttribute<Cv, String> objectif;
    public static volatile SingularAttribute<Cv, Long> codeCv;
    public static volatile ListAttribute<Cv, ExperiencePro> experienceProList;
    public static volatile ListAttribute<Cv, Competence> competenceList;

}