SELECT
  a.artista_nome AS artista,
  al.album_titulo AS album
FROM
  SpotifyClone.artista a
  INNER JOIN SpotifyClone.album al ON a.artista_id = al.artista_id
WHERE
  a.artista_nome = 'Elis Regina'
ORDER BY
  album;
