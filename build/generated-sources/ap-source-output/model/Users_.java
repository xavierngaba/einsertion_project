package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Candidat;
import model.Entreprise;
import model.Institut;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2016-07-14T19:44:52")
@StaticMetamodel(Users.class)
public class Users_ { 

    public static volatile SingularAttribute<Users, Long> code;
    public static volatile ListAttribute<Users, Institut> institutList;
    public static volatile SingularAttribute<Users, String> pass;
    public static volatile ListAttribute<Users, Entreprise> entrepriseList;
    public static volatile SingularAttribute<Users, String> login;
    public static volatile ListAttribute<Users, Candidat> candidatList;

}