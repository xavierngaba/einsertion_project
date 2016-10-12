package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Entreprise;
import model.Postulat;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2016-07-14T19:44:52")
@StaticMetamodel(OffreEmploi.class)
public class OffreEmploi_ { 

    public static volatile SingularAttribute<OffreEmploi, String> qualiteReq;
    public static volatile ListAttribute<OffreEmploi, Postulat> postulatList;
    public static volatile SingularAttribute<OffreEmploi, String> villePoste;
    public static volatile SingularAttribute<OffreEmploi, String> domaine;
    public static volatile SingularAttribute<OffreEmploi, String> adressePost;
    public static volatile SingularAttribute<OffreEmploi, Long> codeOffreEmp;
    public static volatile SingularAttribute<OffreEmploi, String> dateOffreEmp;
    public static volatile SingularAttribute<OffreEmploi, String> poste;
    public static volatile SingularAttribute<OffreEmploi, Entreprise> codeEnt;
    public static volatile SingularAttribute<OffreEmploi, String> descripPoste;

}