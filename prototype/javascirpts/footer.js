/* Fichier JS qui regroupe les étapes de la création du footer de la page web */

/* ==== Documentation ==========================================================
   ==== la représentation HTML de ce srcipt est visible dans le fichier
        aside_kind.html
    ==>todo==> : tout les commentaires précédés de cette mention signifient que
                 cet aspect conporte encore des zone de flou et qu'il faudra
                 éventuellement apporter des modification avant la mise en
                 production.
*/

// initialisation de l'élément dans le lequel insérer le footer sur la page
var tag_footer = document.getElementById("ft_js");

// la balises <a>, mentions légales
var tag_a = document.createElement("a");
tag_a.className = "wf_link";
tag_a.setAttribute("href", "#");
// création du texte affiché
var text = "Mentions légales";
var tag_a_text = document.createTextNode(text);
tag_a.appendChild(tag_a_text);
tag_footer.appendChild(tag_a);

// la balises <a>, contact
var tag_a_contact = document.createElement("a");
tag_a_contact.className = "wf_link";
tag_a_contact.setAttribute("href", "#");
// création du texte affiché
var text = "contact";
var tag_a_contact_text = document.createTextNode(text);
tag_a_contact.appendChild(tag_a_contact_text);
tag_footer.appendChild(tag_a_contact);

// la balises <a>, plan du site
var tag_a_plan = document.createElement("a");
tag_a_plan.className = "wf_link";
tag_a_plan.setAttribute("href", "#");
// création du texte affiché
var text = "Plan du site";
var tag_a_plan_text = document.createTextNode(text);
tag_a_plan.appendChild(tag_a_plan_text);
tag_footer.appendChild(tag_a_plan);

// la balise <div> qui regroupe le block du copyright
var tag_div_copy = document.createElement("div");
tag_div_copy.id = "footer_copy";
tag_footer.appendChild(tag_div_copy);

    // la balise <div>, le bouton du copyright
    var tag_div_copy_button = document.createElement("div");
    tag_div_copy_button.className = "wf_no-link";
    // création du texte affiché
    var text = "Copyright";
    var tag_div_copy_button_text = document.createTextNode(text);
    tag_div_copy_button.appendChild(tag_div_copy_button_text);
    tag_footer.appendChild(tag_div_copy_button);