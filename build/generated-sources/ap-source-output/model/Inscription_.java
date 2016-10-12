package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Candidat;
import model.InscriptionPK;
import model.OffreFormation;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2016-07-14T19:44:52")
@StaticMetamodel(Inscription.class)
public class Inscription_ { 

    public static volatile SingularAttribute<Inscription, InscriptionPK> inscriptionPK;
    public static volatile SingularAttribute<Inscription, String> dateInsc;
    public static volatile SingularAttribute<Inscription, Candidat> candidat;
    public static volatile SingularAttribute<Inscription, OffreFormation> offreFormation;

}