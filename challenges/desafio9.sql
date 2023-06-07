SELECT 
	COUNT(*) AS musicas_no_historico
FROM SpotifyClone.historico_reproducoes hr 
INNER JOIN SpotifyClone.usuarios u ON hr.usuario_id = u.usuario_id
WHERE u.nome_usuario = 'Barbara Liskov';