package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Inscription;
import model.Institut;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2016-07-14T19:44:52")
@StaticMetamodel(OffreFormation.class)
public class OffreFormation_ { 

    public static volatile SingularAttribute<OffreFormation, Institut> codeIns;
    public static volatile ListAttribute<OffreFormation, Inscription> inscriptionList;
    public static volatile SingularAttribute<OffreFormation, Long> codeOffreForm;
    public static volatile SingularAttribute<OffreFormation, String> villeForm;
    public static volatile SingularAttribute<OffreFormation, String> domaine;
    public static volatile SingularAttribute<OffreFormation, String> adressForm;
    public static volatile SingularAttribute<OffreFormation, String> dateOffreForm;
    public static volatile SingularAttribute<OffreFormation, String> descripForm;

}