 SELECT 
	u.nome_usuario AS pessoa_usuaria,
    COUNT(hr.cancao_id) AS musicas_ouvidas,
    ROUND(SUM(c.duracao_segundos/60),2) AS total_minutos
FROM 
    SpotifyClone.usuarios u
INNER JOIN SpotifyClone.historico_reproducoes hr ON u.usuario_id = hr.usuario_id 
INNER JOIN SpotifyClone.cancoes c ON hr.cancao_id = c.cancao_id
GROUP BY u.nome_usuario
ORDER BY nome_usuario;