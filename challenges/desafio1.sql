-- Descomente e altere as linhas abaixo:

DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plano(
     
    plano_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    plano_nome VARCHAR(50) NOT NULL,
    valor_plano DECIMAL(5,2) NOT NULL
) engine = InnoDB;
INSERT INTO SpotifyClone.plano (plano_nome, valor_plano)
VALUES
  ('gratuito', 0),
  ('universitário', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);

CREATE TABLE SpotifyClone.usuarios(
    usuario_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    data_assinatura DATE NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES SpotifyClone.plano(plano_id)
) engine = InnoDB;
INSERT INTO SpotifyClone.usuarios (nome_usuario, idade, plano_id, data_assinatura)
VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 4, '2017-12-30'),
    ('Martin Fowler', 46, 4, '2017-01-17'),
    ('Sandi Metz', 58, 4, '2018-04-29'),
    ('Paulo Freire', 19, 2, '2018-02-14'),
    ('Bell Hooks', 26, 2, '2018-01-05'),
    ('Christopher Alexander', 85, 3, '2019-06-05'),
    ('Judith Butler', 45, 3, '2020-05-13'),
    ('Jorge Amado', 58, 3, '2017-02-17');

CREATE TABLE SpotifyClone.artista(
    artista_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    artista_nome VARCHAR(50) NOT NULL
) engine = InnoDB;
INSERT INTO SpotifyClone.artista (artista_nome)
VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

CREATE TABLE SpotifyClone.album(
    album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    album_titulo VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    ano_lancamento YEAR NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id)
) engine = InnoDB;
INSERT INTO SpotifyClone.album (album, artista_id, ano_lancamento)
VALUES
    ('Lemonade', 1, 2016),
    ('Greatest Hits', 2, 1981),
    ('Hot Space', 2, 1982),
    ('Falso Brilhante', 3, 1976),
    ('Vento de Maio', 3, 1977),
    ('QVVJFA?', 4, 2019),
    ('Somewhere Far Beyond', 5, 1992),
    ('I Put A Spell On You', 6, 1965);

CREATE TABLE SpotifyClone.cancoes(
    cancao_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cancao_nome VARCHAR(50) NOT NULL,
    duracao_segundos INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id)
) engine = InnoDB;
INSERT INTO SpotifyClone.cancoes (cancao_nome, duracao_segundos, album_id)
VALUES
    ('Formation', 263, 1),
    ('Sorry', 242, 1),
    ('Don''t Hurt Yourself', 256, 1),
    ('Crazy In Love', 235, 1),
    ('Bohemian Rhapsody', 354, 2),
    ('Don''t Stop Me Now', 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    ('Samba em Paris', 267, 6),
    ('The Bard''s Song', 244, 7),
    ('Feeling Good', 100, 8);

CREATE TABLE SpotifyClone.seguindo_artistas(
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT pk_seguindo_artistas PRIMARY KEY (usuario_id, artista_id),
        FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(usuario_id),
        FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id)
) engine = InnoDB;
INSERT INTO SpotifyClone.seguindo_artistas (usuario_id, artista_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);

CREATE TABLE SpotifyClone.historico_reproducoes(
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    data_reproducao DATETIME NOT NULL,
    CONSTRAINT pk_historico_reproducoes PRIMARY KEY (usuario_id, cancao_id),
        FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(usuario_id),
        FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes(cancao_id)
) engine = InnoDB;
INSERT INTO SpotifyClone.historico_reproducoes (usuario_id, cancao_id, data_reproducao)
VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30');

