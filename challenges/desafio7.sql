SELECT 
	ar.artista_nome AS artista,
    al.album_titulo AS album,
    COUNT(sa.usuario_id) AS pessoas_seguidoras
FROM SpotifyClone.artista ar
INNER JOIN SpotifyClone.album al ON ar.artista_id = al.artista_id
INNER JOIN SpotifyClone.seguindo_artistas sa ON ar.artista_id = sa.artista_id
GROUP BY 
	ar.artista_id,
	al.album_id
ORDER BY pessoas_seguidoras DESC, ar.artista_nome, al.album_titulo;
