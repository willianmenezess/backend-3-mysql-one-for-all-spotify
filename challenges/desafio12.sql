SELECT
    a.artista_nome AS artista,
    CASE
        WHEN COUNT(ucf.cancao_id) >= 5 THEN 'A'
        WHEN COUNT(ucf.cancao_id) BETWEEN 3 AND 4 THEN 'B'
        WHEN COUNT(ucf.cancao_id) BETWEEN 1 AND 2 THEN 'C'
        ELSE '-'
    END AS ranking
FROM
    SpotifyClone.artista AS a
LEFT JOIN
    SpotifyClone.album AS al ON a.artista_id = al.artista_id
LEFT JOIN
    SpotifyClone.cancoes AS c ON al.album_id = c.album_id
LEFT JOIN
    SpotifyClone.usuario_cancoes_fav AS ucf ON c.cancao_id = ucf.cancao_id
GROUP BY
    a.artista_id
ORDER BY
    CASE
        WHEN COUNT(ucf.cancao_id) >= 5 THEN 1
        WHEN COUNT(ucf.cancao_id) BETWEEN 3 AND 4 THEN 2
        WHEN COUNT(ucf.cancao_id) BETWEEN 1 AND 2 THEN 3
        ELSE 4
    END ASC, a.artista_nome ASC;


