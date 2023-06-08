SELECT
    faixa_etaria,
    COUNT(DISTINCT faixas_etarias.usuario_id) AS total_pessoas_usuarias,
    COUNT(fc.cancao_id) AS total_favoritadas
FROM (
    SELECT
        u.usuario_id,
        u.idade,
        CASE
            WHEN u.idade <= 30 THEN 'Até 30 anos'
            WHEN u.idade BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
            ELSE 'Maior de 60 anos'
        END AS faixa_etaria
    FROM
        SpotifyClone.usuarios AS u
) AS faixas_etarias
LEFT JOIN
    SpotifyClone.usuario_cancoes_fav AS fc ON faixas_etarias.usuario_id = fc.usuario_id
GROUP BY
    faixa_etaria
ORDER BY
    CASE
        WHEN faixa_etaria = 'Até 30 anos' THEN 1
        WHEN faixa_etaria = 'Entre 31 e 60 anos' THEN 2
        ELSE 3
    END;


