package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Candidat;
import model.OffreEmploi;
import model.PostulatPK;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2016-07-14T19:44:52")
@StaticMetamodel(Postulat.class)
public class Postulat_ { 

    public static volatile SingularAttribute<Postulat, String> datePost;
    public static volatile SingularAttribute<Postulat, Candidat> candidat;
    public static volatile SingularAttribute<Postulat, PostulatPK> postulatPK;
    public static volatile SingularAttribute<Postulat, OffreEmploi> offreEmploi;

}