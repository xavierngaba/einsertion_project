package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.OffreEmploi;
import model.Users;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2016-07-14T19:44:52")
@StaticMetamodel(Entreprise.class)
public class Entreprise_ { 

    public static volatile SingularAttribute<Entreprise, String> sectAct;
    public static volatile SingularAttribute<Entreprise, String> emailEnt;
    public static volatile SingularAttribute<Entreprise, String> telEnt;
    public static volatile SingularAttribute<Entreprise, Users> code;
    public static volatile SingularAttribute<Entreprise, String> nomRespEnt;
    public static volatile SingularAttribute<Entreprise, String> prenomRespEnt;
    public static volatile SingularAttribute<Entreprise, String> descrEnt;
    public static volatile ListAttribute<Entreprise, OffreEmploi> offreEmploiList;
    public static volatile SingularAttribute<Entreprise, Long> codeEnt;
    public static volatile SingularAttribute<Entreprise, String> nomEnt;
    public static volatile SingularAttribute<Entreprise, String> siteEnt;

}