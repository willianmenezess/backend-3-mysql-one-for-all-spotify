-- Descomente e altere as linhas abaixo:

-- CREATE TABLE SpotifyClone.tabela(
--     coluna1 tipo restricoes,
--     coluna2 tipo restricoes,
--     colunaN tipo restricoes,
-- ) engine = InnoDB;

-- INSERT INTO SpotifyClone.tabela (coluna1, coluna2)
-- VALUES
--   ('exemplo de dados 1', 'exemplo de dados A'),
--   ('exemplo de dados 2', 'exemplo de dados B'),
--   ('exemplo de dados 3', 'exemplo de dados C');


CREATE TABLE SpotifyClone.usuario_cancoes_fav(
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    CONSTRAINT pk_usuario_cancoes_favoritas PRIMARY KEY (usuario_id, cancao_id),
        FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(usuario_id),
        FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes(cancao_id)
) engine = InnoDB;
INSERT INTO SpotifyClone.usuario_cancoes_fav (usuario_id, cancao_id)
VALUES
    (1, 3),
    (1, 6),
    (1, 10),
    (2, 4),
    (3, 1),
    (3, 3),
    (4, 7),
    (4, 4),
    (5, 10),
    (5, 2),
    (8, 4),
    (9, 7),
    (10, 3);