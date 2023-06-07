SELECT
  a.artista_nome AS artista,
  al.album_titulo AS album,
  COUNT(DISTINCT sa.usuario_id) AS pessoas_seguidoras
FROM
  SpotifyClone.artista a
  INNER JOIN SpotifyClone.album al ON a.artista_id = al.artista_id
  LEFT JOIN SpotifyClone.seguindo_artistas sa ON a.artista_id = sa.artista_id
GROUP BY
  a.artista_id,
  al.album_id
ORDER BY
  pessoas_seguidoras DESC,
  artista,
  album;
