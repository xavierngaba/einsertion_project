package org.apache.jsp.vue;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class domaine_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<option value=\"Null\"> ----Choisissez un domaine---- </option>\n");
      out.write("<option value=\"Accesoires de mode\">Accesoires de mode</option>\n");
      out.write("<option value=\"Acconnage et manutention\">Acconnage et manutention</option>\n");
      out.write("<option value=\"Action Humanitaire et Droit de l'homme\">Action Humanitaire et Droit de l'homme</option>\n");
      out.write("<option value=\"Administration,collectivite locale\">Administration,collectivit&eacute; locale</option>\n");
      out.write("<option value=\"Agence d'hotesses\">Agence d'h&ocirc;tesses</option>\n");
      out.write("<option value=\"Agriculture - pêche\">Agriculture - p&ecirc;che</option>\n");
      out.write("<option value=\"Agroalimentaire\">Agroalimentaire</option>\n");
      out.write("<option value=\"Agronomie\">Agronomie</option>\n");
      out.write("<option value=\"Alimentation et boisson\">Alimentation et boisson</option>\n");
      out.write("<option value=\"Appareillage et approvisionnements electriques\">Appareillage et approvisionnements &egrave;lectriques</option>\n");
      out.write("<option value=\"Appareils menagers\">Appareils m&eacute;nagers</option>\n");
      out.write("<option value=\"Assurances\">Assurances</option>\n");
      out.write("<option value=\"Audiovisuel\">Audiovisuel</option>\n");
      out.write("<option value=\"Automobile et vehicules\">Automobile et véhicules</option>\n");
      out.write("<option value=\"Bagage, sacs et etuis\">Bagage, sacs et &eacute;tuis</option>\n");
      out.write("<option value=\"Banque, finance et aassurence\">Banque, finance et aassurence</option>\n");
      out.write("<option value=\"Beaute et soin personnel\">Beaut&eacute; et soin personnel</option>\n");
      out.write("<option value=\"BPT Genie Civil\">BPT Genie Civil</option>\n");
      out.write("<option value=\"Cadeaux et bonnes idees\">Cadeaux et bonnes id&eacute;es</option>\n");
      out.write("<option value=\"Caoutchouc et plastiques\">Caoutchouc et plastiques</option>\n");
      out.write("<option value=\"Commerce electronique\">Commerce electronique</option>\n");
      out.write("<option value=\"Commerce, import et export\">Commerce, import et export</option>\n");
      out.write("<option value=\"Communication\">Communication</option>\n");
      out.write("<option value=\"Communication evenementielle\">Communication &eacute;v&egrave;nementielle</option>\n");
      out.write("<option value=\"Composants et approvisionnements electroniques\">Composants et approvisionnements &eacute;lectroniques</option>\n");
      out.write("<option value=\"Construction, batiments et travaux publics\">Construction, batiments et travaux publics</option>\n");
      out.write("<option value=\"Courtage en assurance\">Courtage en assurance</option>\n");
      out.write("<option value=\"Création entretien espaces verts\">Cr&eacute;ation entretien espaces verts</option>\n");
      out.write("<option value=\"CyberCafe\">CyberCafé</option>\n");
      out.write("<option value=\"Decoration(Florale,interieur,urbaine etc.)\">Décoration(Florale,intérieur,urbaine etc.)</option>\n");
      out.write("<option value=\"Developpement social\">Développement social</option>\n");
      out.write("<option value=\"Distribution d'energie et de carburant\">Distribution d'énergie et de carburant</option>\n");
      out.write("<option value=\"Divertissements,art et spectacle\">Divertissements,art et spectacle</option>\n");
      out.write("<option value=\"Droit de la propriete intéllectuelle\">Droit de la propriété intéllectuelle</option>\n");
      out.write("<option value=\"Droit des affaires et des entreprises\">Droit des affaires et des entreprises</option>\n");
      out.write("<option value=\"Droit prive\">Droit privé</option>\n");
      out.write("<option value=\"Droit public et international\">Droit public et international</option>\n");
      out.write("<option value=\"Droit public,prive,des affaires\">Droit public,privé,des affaires</option>\n");
      out.write("<option value=\"Edition - Presse\">Edition - Presse</option>\n");
      out.write("<option value=\"Education et formation\">Education et formation</option>\n");
      out.write("<option value=\"Electricite\">Electricité</option>\n");
      out.write("<option value=\"Emploi et Placement\">Emploi et Placement</option>\n");
      out.write("<option value=\"Energie\">Energie</option>\n");
      out.write("<option value=\"Energie renouvelables\">Energie renouvelables</option>\n");
      out.write("<option value=\"Environnement et nature\">Environnement et nature</option>\n");
      out.write("<option value=\"Equipement de service\">Equipement de service</option> \n");
      out.write("<option value=\"Equipement industriel general\">Equipement industriel général</option>\n");
      out.write("<option value=\"Fiscalite et comptabilite\">Fiscalité et comptabilité</option>\n");
      out.write("<option value=\"Foresterie\">Foresterie</option>\n");
      out.write("<option value=\"Genie-civil\">Génie-civil</option>\n");
      out.write("<option value=\"Géolocalisation\">Géolocalisation</option>\n");
      out.write("<option value=\"Gestion des projets\">Gestion des projets</option>\n");
      out.write("<option value=\"Grande distribution\">Grande distribution</option>\n");
      out.write("<option value=\"Hotellerie et restauration\">Hôtellerie et restauration</option>\n");
      out.write("<option value=\"Hydrocarbure\">Hydrocarbure</option>\n");
      out.write("<option value=\"Hygiene et securite Environnementale\">Hygiène et sécurité Environnementale</option>\n");
      out.write("<option value=\"Immobilier\">Immobilier</option>\n");
      out.write("<option value=\"Industrie et commerce general\">Industrie et commerce général</option>\n");
      out.write("<option value=\"Industrie et fabrication\">Industrie et fabrication</option>\n");
      out.write("<option value=\"Industrie habillement\">Industrie habillement</option>\n");
      out.write("<option value=\"Informatique\">Informatique</option>\n");
      out.write("<option value=\"Informatique:materiel et logiciel d'ordinateur\">Informatique:matériel et logiciel d'ordinateur</option>Informatique:matériel et logiciel d'ordinateur\n");
      out.write("<option value=\"Informatique,conception logiciel\">Informatique,conception logiciel</option>\n");
      out.write("<option value=\"Infastructure de mesure et d'analyse\">Infastructure de mesure et d'analyse</option>\n");
      out.write("<option value=\"Internet et technologie web\">Internet et technologie web</option>\n");
      out.write("<option value=\"Jouets et passe-temps\">Jouets et passe-temps</option>\n");
      out.write("<option value=\"La vente\">La vente</option>\n");
      out.write("<option value=\"Librairie,livres et fournitures\">Librairie,livres et fournitures</option>\n");
      out.write("<option value=\"Logistiques et transports\">Logistiques et transports</option>\n");
      out.write("<option value=\"Lumieres,eclairage et son\">Lumières,éclairage et son</option> \n");
      out.write("<option value=\"Médias et publicite\">Médias et publicité</option>\n");
      out.write("<option value=\"Maintenance Industrielle et Productique\">Maintenance Industrielle et Productique</option>\n");
      out.write("<option value=\"Maison et Domestique\">Maison et Domestique</option>\n");
      out.write("<option value=\"Management\">Management</option>\n");
      out.write("<option value=\"Management des projets\">Management des projets</option>\n");
      out.write("<option value=\"Marketing\">Marketing</option>\n");
      out.write("<option value=\"Marketing, ventes et BA\">Marketing, ventes et BA</option>\n");
      out.write("<option value=\"Marketing et Commerce\">Marketing et Commerce</option>\n");
      out.write("<option value=\"Marketing,Formation et coaching\">Marketing,Formation et coaching</option>\n");
      out.write("<option value=\"Meubles\">Meubles</option>\n");
      out.write("<option value=\"Minerais et metallurgie\">Minerais et métallurgie</option>\n");
      out.write("<option value=\"Mode,prete e porter,luxe\">Mode,prête à porter,luxe</option>\n");
      out.write("<option value=\"Montres,bijoux,lunettes\">Montres,bijoux,lunettes</option>\n");
      out.write("<option value=\"Navigation Maritime\">Navigation Maritime</option>\n");
      out.write("<option value=\"Optique\">Optique</option>\n");
      out.write("<option value=\"Orientation Scolaire\">Orientation Scolaire</option>\n");
      out.write("<option value=\"Prestation de service technique\">Prestation de service technique</option>\n");
      out.write("<option value=\"Prestation de service divers\">Prestation de service divers</option>\n");
      out.write("<option value=\"Production\">Production</option>\n");
      out.write("<option value=\"Produits chimiques\">Produits chimiques</option>\n");
      out.write("<option value=\"Qualité,Hygiene,Securite,Environnement\">Qualité,Hygiène,Sécurité,Environnement</option>\n");
      out.write("<option value=\"Quincaillerie\">Quincaillerie</option>\n");
      out.write("<option value=\"Responsabilite sociale de l'entreprise\">Responsabilité sociale de l'entreprise</option>\n");
      out.write("<option value=\"Ressource humaines\">Ressource humaines</option>\n");
      out.write("<option value=\"Restauration\">Restauration</option>\n");
      out.write("<option value=\"Sales,Marketing et BA\">Sales,Marketing et BA</option>\n");
      out.write("<option value=\"Sante et medecine\">Santé et médecine</option>\n");
      out.write("<option value=\"Secretariat bureatique\">Sécrétariat bureatique</option>\n");
      out.write("<option value=\"Securite et protection\">Sécurité et protection</option>\n");
      out.write("<option value=\"Services aux entreprises\">Services aux entreprises</option>\n");
      out.write("<option value=\"Services aux personnes\">Services aux personnes</option>\n");
      out.write("<option value=\"Services publiques\">Services publiques</option>\n");
      out.write("<option value=\"Sports et loisirs\">Sports et loisirs</option>\n");
      out.write("<option value=\"Station de service\">Station de service</option>\n");
      out.write("<option value=\"Technologie et communications\">Technologie et communications</option>\n");
      out.write("<option value=\"Topographie-Cadastes\">Topographie-Cadastes</option>\n");
      out.write("<option value=\"Tourisme,voyage et loisir\">Tourisme,voyage et loisir</option>\n");
      out.write("<option value=\"Tracking Consulting\">Tracking Consulting</option>\n");
      out.write("<option value=\"Transit\">Transit</option>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
