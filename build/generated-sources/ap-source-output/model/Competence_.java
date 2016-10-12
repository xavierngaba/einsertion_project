package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Cv;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2016-07-14T19:44:52")
@StaticMetamodel(Competence.class)
public class Competence_ { 

    public static volatile SingularAttribute<Competence, Long> codeComp;
    public static volatile SingularAttribute<Competence, String> specialite;
    public static volatile SingularAttribute<Competence, String> domaine;
    public static volatile SingularAttribute<Competence, Cv> codeCv;
    public static volatile SingularAttribute<Competence, String> libelleComp;

}