<%-- 
    Document   : listCompetence
    Created on : 14 août 2014, 22:08:58
    Author     : XAVIER
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="control-group">
    <div class="controls">
        <div class="input-prepend">
            <span class="add-on"><i class="icon-briefcase"></i></span>
            <select name="domaine" style="width: 175px">
                <option value="Null">--Choisissez un domaine--</option>
                <option value="Accesoires de mode">Accesoires de mode</option>
                <option value="Acconnage et manutention">Acconnage et manutention</option>
                <option value="Action Humanitaire et Droit de l'homme">Action Humanitaire et Droit de l'homme</option>
                <option value="Administration,collectivite locale">Administration,collectivit&eacute; locale</option>
                <option value="Agence d'hotesses">Agence d'h&ocirc;tesses</option>
                <option value="Agriculture - peche">Agriculture - p&ecirc;che</option>
                <option value="Agroalimentaire">Agroalimentaire</option>
                <option value="Agronomie">Agronomie</option>
                <option value="Alimentation et boisson">Alimentation et boisson</option>
                <option value="Appareillage et approvisionnements electriques">Appareillage et approvisionnements &egrave;lectriques</option>
                <option value="Appareils menagers">Appareils m&eacute;nagers</option>
                <option value="Assurances">Assurances</option>
                <option value="Audiovisuel">Audiovisuel</option>
                <option value="Automobile et vehicules">Automobile et véhicules</option>
                <option value="Bagage, sacs et étuis">Bagage, sacs et &eacute;tuis</option>
                <option value="Banque, finance et aassurence">Banque, finance et aassurence</option>
                <option value="Beaute et soin personnel">Beaut&eacute; et soin personnel</option>
                <option value="BPT Genie Civil">BPT Genie Civil</option>
                <option value="Cadeaux et bonnes idees">Cadeaux et bonnes id&eacute;es</option>
                <option value="Caoutchouc et plastiques">Caoutchouc et plastiques</option>
                <option value="Commerce electronique">Commerce electronique</option>
                <option value="Commerce, import et export">Commerce, import et export</option>
                <option value="Communication">Communication</option>
                <option value="Communication evenementielle">Communication &eacute;v&egrave;nementielle</option>
                <option value="Composants et approvisionnements electroniques">Composants et approvisionnements &eacute;lectroniques</option>
                <option value="Construction, batiments et travaux publics">Construction, batiments et travaux publics</option>
                <option value="Courtage en assurance">Courtage en assurance</option>
                <option value="Creation entretien espaces verts">Cr&eacute;ation entretien espaces verts</option>
                <option value="CyberCafe">CyberCafé</option>
                <option value="Decoration(Florale,interieur,urbaine etc.)">Décoration(Florale,intérieur,urbaine etc.)</option>
                <option value="Developpement social">Développement social</option>
                <option value="Distribution d'energie et de carburant">Distribution d'énergie et de carburant</option>
                <option value="Divertissements,art et spectacle">Divertissements,art et spectacle</option>
                <option value="Droit de la propriete intellectuelle">Droit de la propriété intéllectuelle</option>
                <option value="Droit des affaires et des entreprises">Droit des affaires et des entreprises</option>
                <option value="Droit prive">Droit privé</option>
                <option value="Droit public et international">Droit public et international</option>
                <option value="Droit public,prive,des affaires">Droit public,privé,des affaires</option>
                <option value="Edition - Presse">Edition - Presse</option>
                <option value="Education et formation">Education et formation</option>
                <option value="Electricite">Electricité</option>
                <option value="Emploi et Placement">Emploi et Placement</option>
                <option value="Energie">Energie</option>
                <option value="Energie renouvelables">Energie renouvelables</option>
                <option value="Environnement et nature">Environnement et nature</option>
                <option value="Equipement de service">Equipement de service</option> 
                <option value="Equipement industriel general">Equipement industriel général</option>
                <option value="Fiscalite et comptabilite">Fiscalité et comptabilité</option>
                <option value="Foresterie">Foresterie</option>
                <option value="Genie-civil">Génie-civil</option>
                <option value="Geolocalisation">Géolocalisation</option>
                <option value="Gestion des projets">Gestion des projets</option>
                <option value="Grande distribution">Grande distribution</option>
                <option value="Hotellerie et restauration">Hôtellerie et restauration</option>
                <option value="Hydrocarbure">Hydrocarbure</option>
                <option value="Hygiene et securite Environnementale">Hygiène et sécurité Environnementale</option>
                <option value="Immobilier">Immobilier</option>
                <option value="Industrie et commerce general">Industrie et commerce général</option>
                <option value="Industrie et fabrication">Industrie et fabrication</option>
                <option value="Industrie habillement">Industrie habillement</option>
                <option value="Informatique">Informatique</option>
                <option value="Informatique : materiel et logiciel d'ordinateur">Informatique:matériel et logiciel d'ordinateur</option>Informatique:matériel et logiciel d'ordinateur
                <option value="Informatique,conception logiciel">Informatique,conception logiciel</option>
                <option value="Infastructure de mesure et d'analyse">Infastructure de mesure et d'analyse</option>
                <option value="Internet et technologie web">Internet et technologie web</option>
                <option value="Jouets et passe-temps">Jouets et passe-temps</option>
                <option value="La vente">La vente</option>
                <option value="Librairie,livres et fournitures">Librairie,livres et fournitures</option>
                <option value="Logistiques et transports">Logistiques et transports</option>
                <option value="Lumieres,eclairage et son">Lumières,éclairage et son</option> 
                <option value="Medias et publicite">Médias et publicité</option>
                <option value="Maintenance Industrielle et Productique">Maintenance Industrielle et Productique</option>
                <option value="Maison et Domestique">Maison et Domestique</option>
                <option value="Management">Management</option>
                <option value="Management des projets">Management des projets</option>
                <option value="Marketing">Marketing</option>
                <option value="Marketing, ventes et BA">Marketing, ventes et BA</option>
                <option value="Marketing et Commerce">Marketing et Commerce</option>
                <option value="Marketing,Formation et coaching">Marketing,Formation et coaching</option>
                <option value="Meubles">Meubles</option>
                <option value="Minerais et metallurgie">Minerais et métallurgie</option>
                <option value="Mode,prete a porter,luxe">Mode,prête à porter,luxe</option>
                <option value="Montres,bijoux,lunettes">Montres,bijoux,lunettes</option>
                <option value="Navigation Maritime">Navigation Maritime</option>
                <option value="Optique">Optique</option>
                <option value="Orientation Scolaire">Orientation Scolaire</option>
                <option value="Prestation de service technique">Prestation de service technique</option>
                <option value="Prestation de service divers">Prestation de service divers</option>
                <option value="Production">Production</option>
                <option value="Produits chimiques">Produits chimiques</option>
                <option value="Qualite,Hygiene,Securite,Environnement">Qualité,Hygiène,Sécurité,Environnement</option>
                <option value="Quincaillerie">Quincaillerie</option>
                <option value="Responsabilite sociale de l'entreprise">Responsabilité sociale de l'entreprise</option>
                <option value="Ressource humaines">Ressource humaines</option>
                <option value="Restauration">Restauration</option>
                <option value="Sales,Marketing et BA">Sales,Marketing et BA</option>
                <option value="Sante et medecine">Santé et médecine</option>
                <option value="Secretariat bureatique">Sécrétariat bureatique</option>
                <option value="Securite et protection">Sécurité et protection</option>
                <option value="Services aux entreprises">Services aux entreprises</option>
                <option value="Services aux personnes">Services aux personnes</option>
                <option value="Services publiques">Services publiques</option>
                <option value="Sports et loisirs">Sports et loisirs</option>
                <option value="Station de service">Station de service</option>
                <option value="Technologie et communications">Technologie et communications</option>
                <option value="Topographie-Cadastes">Topographie-Cadastes</option>
                <option value="Tourisme,voyage et loisir">Tourisme,voyage et loisir</option>
                <option value="Tracking Consulting">Tracking Consulting</option>
                <option value="Transit">Transit</option>
            </select>
        </div>
    </div>
</div>
