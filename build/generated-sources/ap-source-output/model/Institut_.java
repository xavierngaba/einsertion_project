package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.OffreFormation;
import model.Users;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2016-07-14T19:44:52")
@StaticMetamodel(Institut.class)
public class Institut_ { 

    public static volatile SingularAttribute<Institut, String> telIns;
    public static volatile SingularAttribute<Institut, String> nomIns;
    public static volatile SingularAttribute<Institut, String> prenomRespIns;
    public static volatile SingularAttribute<Institut, Long> codeIns;
    public static volatile SingularAttribute<Institut, String> descripIns;
    public static volatile SingularAttribute<Institut, Users> code;
    public static volatile ListAttribute<Institut, OffreFormation> offreFormationList;
    public static volatile SingularAttribute<Institut, String> nomRespIns;
    public static volatile SingularAttribute<Institut, String> siteIns;
    public static volatile SingularAttribute<Institut, String> emailIns;

}