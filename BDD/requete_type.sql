
#Touts les utiliateur qui sont bannis ainsi que la date à 
#laquelle il ont été banni
SELECT 
	first_name,
	last_name,
	ban_date
FROM user
	INNER JOIN ban_list
		ON user_ban_id = user_id;

#Lister tout les nom de série en Français d'un genre en 
#particulier
#Ex: Policier
SELECT
	ts.name
FROM serie
	INNER JOIN category_serie cs 
		ON cs.serie_id = serie.serie_id
	INNER JOIN category c
		ON c.category_id = cs.category_id
	INNER JOIN translation_serie ts 
		ON ts.serie_id = serie.serie_id
WHERE
	c.name = "Policier" aND ts.language_id = 2;

#lister tout les pseudo des ami d'un utilisateur
#Ex: utilisateur_id = 4
SELECT
	(
		SELECT user.pseudo
		FROM user
		WHERE friend_list.friend_id = user.user_id
	) AS amis
FROM friend_list
	INNER JOIN user
		ON friend_list.user_id = user.user_id
WHERE friend_list.user_id = 4;
