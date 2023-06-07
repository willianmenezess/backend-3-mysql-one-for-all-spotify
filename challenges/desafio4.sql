SELECT
  u.nome_usuario AS pessoa_usuaria,
  CASE
    WHEN MAX(hr.data_reproducao) >= '2021-01-01' THEN 'Ativa'
    ELSE 'Inativa'
  END AS status_pessoa_usuaria
FROM
  SpotifyClone.usuarios u
  LEFT JOIN SpotifyClone.historico_reproducoes hr ON u.usuario_id = hr.usuario_id
GROUP BY
  u.usuario_id
ORDER BY
  pessoa_usuaria;