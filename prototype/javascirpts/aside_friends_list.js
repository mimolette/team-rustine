/* Fichier JS qui regroupe les étapes de la création du deuxième block de la
   balise <aside>, c'est le block de la liste des amis de l'utilisateur */

/* ==== Documentation ==========================================================
   ==== la représentation HTML de ce srcipt est visible dans le fichier
        aside_friends_list.html
    ==>todo==> : tout les commentaires précédés de cette mention signifient que
                 cet aspect conporte encore des zone de flou et qu'il faudra
                 éventuellement apporter des modification avant la mise en
                 production.
*/

// la balise <div>, le block entier de la liste des amis
var tag_friends = document.createElement("div");
tag_friends.id = "as_friends_list";
tag_friends.className = "wf_no-link-content";

    // la balise <h3>, le titre du block
    var tag_friends_title = document.createElement("h3");
    tag_friends_title.className = "wf_no-link";
    var tag_friends_title_text = document.createTextNode("Liste des amis");
    tag_friends_title.appendChild(tag_friends_title_text);
    tag_friends.appendChild(tag_friends_title);

    // la balise <ul>, la liste différents amis
    var tag_friends_list = document.createElement("ul");
    tag_friends.appendChild(tag_friends_list);

    // parcourt de chacun des amis
    // pour le prototype ce nombre est initialisé à 3
    for (var i=0; i<3; i++) {
        // la balise <li>, chaque amis
        var tag_friends_li = document.createElement("li");
        tag_friends_list.appendChild(tag_friends_li);

        // la balise <img>, l'avatar des amis
        var tag_avatar = document.createElement("img");
        tag_avatar.className = "wf_img";
        tag_avatar.setAttribute("src", "../pictures/wf_img.jpg");
        tag_avatar.setAttribute("alt", "avatar");
        tag_friends_li.appendChild(tag_avatar);

        // la balise <div> qui regroupe pseudo et statut des amis
        var tag_friends_div = document.createElement("div");
        tag_friends_div.className = "as_friends_list_info_user";
        tag_friends_li.appendChild(tag_friends_div);

            // la balise <a> qui est le pseudo des amis
            var tag_pseudo = document.createElement("a");
            tag_pseudo.className = "wf_link";
            tag_pseudo.setAttribute("href", "#");
            // création du texte affiché
            var tag_pseudo_text = document.createTextNode("Pseudo");
            tag_pseudo.appendChild(tag_pseudo_text);
            tag_friends_div.appendChild(tag_pseudo);

            // la balise <div> qui représente le statut
            var tag_statut = document.createElement("div");
            tag_statut.className = "wf_no-link";
            // création du texte affiché
            var tag_statut_text = document.createTextNode("statut");
            tag_statut.appendChild(tag_statut_text);
            tag_friends_div.appendChild(tag_statut);
    }

    // la balise <div>, le bouton en bas de block pour permettre
    // l'agrandissement de cette liste des amis
    var tag_button = document.createElement("div");
    tag_button.id = "as_friends_list_button";
    tag_button.className = "wf_link";
    tag_friends.appendChild(tag_button);

        // la balise <img> dans ce bouton, c'est une icone
        var tag_button_icone = document.createElement("img");
        tag_button_icone.className = "wf_img";
        tag_button_icone.setAttribute("src", "../pictures/wf_img.jpg");
        tag_button_icone.setAttribute("alt", "flèche");
        tag_button.appendChild(tag_button_icone);


// insertion de l'élément block liste des amis sur la page web dans la balise
// <aside>
var tag_aside = document.getElementById("as_js");
tag_aside.appendChild(tag_friends);
