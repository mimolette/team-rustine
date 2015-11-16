/* Fichier JS qui regroupe les étapes de la création du premier block de la
   balise <aside>, c'est le block du choix des genres de séries */

/* ==== Documentation ==========================================================
   ==== la représentation HTML de ce srcipt est visible dans le fichier
        aside_kind.html
    ==>todo==> : tout les commentaires précédés de cette mention signifient que
                 cet aspect conporte encore des zone de flou et qu'il faudra
                 éventuellement apporter des modification avant la mise en
                 production.
*/

// la balise <div> du block entier de choix des genres
var tag_div_kind = document.createElement("div");
tag_div_kind.className = "wf_no-link-content";
tag_div_kind.id = "as_kind";

    // la balise <h3>, le titre du block
    var tag_kind_title = document.createElement("h3");
    tag_kind_title.className = "wf_no-link";
    var tag_kind_title_text = document.createTextNode("Les genres");
    tag_kind_title.appendChild(tag_kind_title_text);
    tag_div_kind.appendChild(tag_kind_title);

    // la balise <ul>, la liste des choix de genre
    var tag_kind_list = document.createElement("ul");
    tag_div_kind.appendChild(tag_kind_list);

        // parcourt de chacun des genres
        // pour le prototype ce nombre est initialisé à 14
        for (var i=0; i<14; i++) {
            // la balise <li>, chaque genre
            var tag_kind_li = document.createElement("li");
            tag_kind_list.appendChild(tag_kind_li);
            // la balise <a>, le lien vers ce chois de genre
            var tag_a = document.createElement("a");
            tag_a.className = "wf_link";
            tag_a.setAttribute("href", "detail_genre.html");
            // création du texte affiché
            var text = "Genre " + (i+1);
            var tag_a_text = document.createTextNode(text);
            tag_a.appendChild(tag_a_text);
            tag_kind_li.appendChild(tag_a);
        }

// insertion de l'élément block choix des genres sur la page web dans la balise
// <aside>
var tag_aside = document.getElementById("as_js");
tag_aside.appendChild(tag_div_kind);
