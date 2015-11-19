/* Fichier JS qui regroupe les étapes de la création du header afin de pouvoir
   le réutiliser facilement sur chaque page */

/* ==== Documentation ==========================================================
   ==== la représentation HTML de ce srcipt est visible dans le fichier
        header.html
    ==>todo==> : tout les commentaires précédés de cette mention signifient que
                 cet aspect conporte encore des zone de flou et qu'il faudra
                 éventuellement apporter des modification avant la mise en
                 production.
*/

// initialisation de la variable de l'élément <header> de la page web
var tag_header = document.getElementById("hd_js");

// la balise <img>, le logo du site
var tag_logo    = document.createElement("img");
tag_logo.className = "wf_img";
tag_logo.id = "hd_logo";
tag_logo.setAttribute("src", "../pictures/wf_img.jpg");
tag_logo.setAttribute("alt", "logo");
tag_header.appendChild(tag_logo);

// la balise <section>, le corps principal du header
var tag_section = document.createElement("section");
tag_header.appendChild(tag_section);
    // la balise <div>, block du slogan et du choix des langues
    var tag_div_slogan_lang = document.createElement("div");
    tag_div_slogan_lang.id = "hd_block_slogan_lang";
    tag_section.appendChild(tag_div_slogan_lang);
        // la balise <div>, block du slogan
        var tag_div_slogan = document.createElement("div");
        tag_div_slogan.className = "wf_no-link";
        tag_div_slogan.id = "hd_block_slogan";
        var tag_div_slogan_text = document.createTextNode("Slogan");
        tag_div_slogan.appendChild(tag_div_slogan_text);
        tag_div_slogan_lang.appendChild(tag_div_slogan);

        // la balise <div>, block du choix des langues
        var tag_div_lang = document.createElement("div");
        tag_div_lang.id = "hd_block_lang";
        tag_div_slogan_lang.appendChild(tag_div_lang);

            // l'ensemble des balise <figure> du choix des langues
            for (var i=0; i<2; i++) {
                var tag_figure = document.createElement("figure");
                tag_div_lang.appendChild(tag_figure);

                // la balise <img>, drapeau de la langue
                var tag_img = document.createElement("img");
                tag_img.className = "wf_img";
                tag_img.setAttribute("src", "../pictures/wf_img.jpg");
                tag_img.setAttribute("alt", "drapeau");
                tag_figure.appendChild(tag_img);

                // la balise <figcaption>, légende du drapeau
                var tag_figcaption = document.createElement("figcaption");
                var text = "Lang" + (i+1);
                var tag_figcaption_text = document.createTextNode(text);
                tag_figcaption.appendChild(tag_figcaption_text);
                tag_figcaption.className = "wf_no-link";
                tag_figure.appendChild(tag_figcaption);
            }

    // la balise <div>, block qui contient le menu horizontal et la barre de
    // recherche
    var tag_div_nav_search = document.createElement("div");
    tag_div_nav_search.id = "hd_block_nav_search";
    tag_section.appendChild(tag_div_nav_search);

        // la balise <nav>, le menu horizontal
        var tag_nav = document.createElement("nav");
        tag_div_nav_search.appendChild(tag_nav);

            // initialisation du tableau des différents liens de navigation
            var list_link = [
                {
                    name : "Accueil",
                    link : "accueil.html"
                },
                {
                    name : "Top 10",
                    link : "top_10.html"
                },
                {
                    name : "Séries",
                    link : "liste_all_serie.html"
                },
                {
                    name : "Acteurs",
                    link : "liste_all_actor.html"
                },
                {
                    name : "Calendrier diffusion",
                    link : "#"
                }
            ];

            // création des balises <a> en fonction du tableau list_link
            for (var j=0; j<list_link.length; j++) {
                var tag_a = document.createElement("a");
                tag_a.className = "wf_link";
                tag_a.setAttribute("href", list_link[j].link);
                // création du texte affiché
                var tag_a_text = document.createTextNode(list_link[j].name);
                tag_a.appendChild(tag_a_text);
                tag_nav.appendChild(tag_a);
            }

        // la balise <div>, block de la barre de recherche plus l'icone
        var tag_div_search = document.createElement("div");
        tag_div_search.id = "hd_block_search";
        tag_div_nav_search.appendChild(tag_div_search);

            // la balise <div> qui contient la barre de recherche
            var tag_div_search_bar = document.createElement("input");
            tag_div_search_bar.id = "hd_block_search_input";
            tag_div_search_bar.className = "wf_no-link";
            tag_div_search_bar.setAttribute("type", "text");
            tag_div_search_bar.setAttribute("placeholder", "recherche");
            tag_div_search.appendChild(tag_div_search_bar);

            // la balise <img>, icone de la barre de recherche
            // ==>todo==> remplacer ce lien par un bouton formulaire
            var tag_a = document.createElement("a");
            tag_a.setAttribute("href", "listing_research_serie.html");
            // création de l'image du lien
            var tag_div_search_img = document.createElement("img");
            tag_div_search_img.className = "wf_img";
            tag_div_search_img.setAttribute("src", "../pictures/wf_img.jpg");
            tag_div_search_img.setAttribute("alt", "recherche");
            tag_a.appendChild(tag_div_search_img);
            tag_div_search.appendChild(tag_a);

// la balise <aside>, la partie latérale du headee
var tag_aside = document.createElement("aside");
tag_header.appendChild(tag_aside);

    // la balise <div>, block qui contient les liens de connection 
    // et de création de compte
    var hd_block_connect = document.createElement("div");
    hd_block_connect.id = "hd_block_connect";
    tag_aside.appendChild(hd_block_connect);

        // le liens de connection à son compte utilisateur déja crée
        var link_connect = document.createElement("a");
        link_connect.className = "wf_link";
        link_connect.setAttribute("href", "user_connection.html");
        // création du texte affiché dans le liens
        var link_connect_text = document.createTextNode("connection");
        link_connect.appendChild(link_connect_text);
        hd_block_connect.appendChild(link_connect);

        // le liens de creation d'un nouveau compte
        var link_new_user = document.createElement("a");
        link_new_user.className = "wf_link";
        link_new_user.setAttribute("href", "user_registration.html");
        // création du texte affiché dans le liens
        var link_new_user_text = document.createTextNode("inscription");
        link_new_user.appendChild(link_new_user_text);
        hd_block_connect.appendChild(link_new_user);

    // la balise <div> block de liens vers les réseaux sociaux
    var tag_div_social = document.createElement("div");
    tag_div_social.id = "hd_block_social";
    tag_aside.appendChild(tag_div_social);

        // l'ensemble des balise <figure> du choix des réseaux sociaux
        for (var i=0; i<2; i++) {
            var tag_figure = document.createElement("figure");
            tag_div_social.appendChild(tag_figure);

            // la balise <img>, drapeau de la langue
            var tag_img = document.createElement("img");
            tag_img.className = "wf_img";
            tag_img.setAttribute("src", "../pictures/wf_img.jpg");
            tag_img.setAttribute("alt", "réseaux sociaux");
            tag_figure.appendChild(tag_img);

            // la balise <figcaption>, nom du réseau social associé
            var tag_figcaption = document.createElement("figcaption");
            var text = "réseau social " + (i+1);
            var tag_figcaption_text = document.createTextNode(text);
            tag_figcaption.appendChild(tag_figcaption_text);
            tag_figcaption.className = "wf_no-link";
            tag_figure.appendChild(tag_figcaption);
        }
