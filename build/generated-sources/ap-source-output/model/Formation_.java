package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Cv;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2016-07-14T19:44:52")
@StaticMetamodel(Formation.class)
public class Formation_ { 

    public static volatile SingularAttribute<Formation, String> options;
    public static volatile SingularAttribute<Formation, String> etablissement;
    public static volatile SingularAttribute<Formation, Cv> codeCv;
    public static volatile SingularAttribute<Formation, Long> codeForm;
    public static volatile SingularAttribute<Formation, String> anneeAca;
    public static volatile SingularAttribute<Formation, String> diplome;

}