package model;

import java.sql.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Cv;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2016-07-14T19:44:52")
@StaticMetamodel(ExperiencePro.class)
public class ExperiencePro_ { 

    public static volatile SingularAttribute<ExperiencePro, Long> codeExp;
    public static volatile SingularAttribute<ExperiencePro, String> nomStructure;
    public static volatile SingularAttribute<ExperiencePro, Date> dateDebut;
    public static volatile SingularAttribute<ExperiencePro, Cv> codeCv;
    public static volatile SingularAttribute<ExperiencePro, String> poste;
    public static volatile SingularAttribute<ExperiencePro, Date> dateFin;
    public static volatile SingularAttribute<ExperiencePro, String> tachesEffectuees;
    public static volatile SingularAttribute<ExperiencePro, String> activiteStructure;

}