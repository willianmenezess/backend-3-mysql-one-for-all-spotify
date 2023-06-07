SELECT 
	al.album_titulo AS album,
    COUNT(uc.cancao_id) AS favoritadas
FROM SpotifyClone.album al 
INNER JOIN SpotifyClone.cancoes c ON c.album_id = al.album_id
INNER JOIN SpotifyClone.usuario_cancoes_fav uc ON c.cancao_id = uc.cancao_id
GROUP BY al.album_id
ORDER BY favoritadas DESC, al.album_titulo
LIMIT 3;