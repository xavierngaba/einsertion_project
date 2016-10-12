package model;

import java.sql.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.AutrePiece;
import model.Cv;
import model.Inscription;
import model.LettreMotivation;
import model.Postulat;
import model.Users;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2016-07-14T19:44:52")
@StaticMetamodel(Candidat.class)
public class Candidat_ { 

    public static volatile SingularAttribute<Candidat, Long> codeCan;
    public static volatile ListAttribute<Candidat, Inscription> inscriptionList;
    public static volatile SingularAttribute<Candidat, Users> code;
    public static volatile ListAttribute<Candidat, Cv> cvList;
    public static volatile ListAttribute<Candidat, LettreMotivation> lettreMotivationList;
    public static volatile SingularAttribute<Candidat, String> nomCan;
    public static volatile SingularAttribute<Candidat, String> domaine;
    public static volatile SingularAttribute<Candidat, String> prenomCan;
    public static volatile SingularAttribute<Candidat, String> emailCan;
    public static volatile ListAttribute<Candidat, AutrePiece> autrePieceList;
    public static volatile SingularAttribute<Candidat, String> tel1Can;
    public static volatile ListAttribute<Candidat, Postulat> postulatList;
    public static volatile SingularAttribute<Candidat, String> adresse;
    public static volatile SingularAttribute<Candidat, Date> dateNaiss;
    public static volatile SingularAttribute<Candidat, String> villeCan;

}