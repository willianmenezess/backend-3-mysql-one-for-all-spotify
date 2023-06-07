SELECT 
	c.cancao_nome AS cancao,
    COUNT(hr.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes c
INNER JOIN SpotifyClone.historico_reproducoes hr ON c.cancao_id = hr.cancao_id
GROUP BY cancao_nome
ORDER BY reproducoes DESC, cancao_nome
LIMIT 2