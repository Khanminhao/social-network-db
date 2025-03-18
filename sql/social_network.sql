DROP TABLE IF EXISTS Registrar;
DROP TABLE IF EXISTS Posts;
DROP TABLE IF EXISTS Usuários;
DROP TABLE IF EXISTS MSG;
DROP TABLE IF EXISTS Perfil;
DROP TABLE IF EXISTS Vídeos;
DROP TABLE IF EXISTS Postagem;
DROP TABLE IF EXISTS Comentário;
DROP TABLE IF EXISTS Grupo;
DROP TABLE IF EXISTS Desafios;
DROP TABLE IF EXISTS Ranking;


-- Tabela Registrar
CREATE TABLE Registrar (
    id VARCHAR(255) PRIMARY KEY NOT NULL,
    email VARCHAR(255) NOT NULL,
    primeiroNome VARCHAR(255) NOT NULL,
    segundoNome VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);

-- Tabela Posts
CREATE TABLE Posts (
    id VARCHAR(255) PRIMARY KEY NOT NULL,
    Tipo VARCHAR(255) NOT NULL,
    Descricao TEXT NOT NULL,
    Data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(255) NOT NULL,
    likes INT DEFAULT 0
);

-- Tabela Usuários
CREATE TABLE Usuários (
    id VARCHAR(255) PRIMARY KEY NOT NULL,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    genero VARCHAR(50),
    aniversario TIMESTAMP,
    status VARCHAR(255) NOT NULL,
    mensagens INT DEFAULT 0,
    amigos INT DEFAULT 0
);

-- Tabela MSG
CREATE TABLE MSG (
    texto TEXT NOT NULL,
    abas INT PRIMARY KEY NOT NULL,
    users VARCHAR(255) NOT NULL
);

-- Tabela Perfil
CREATE TABLE Perfil (
    id VARCHAR(255) PRIMARY KEY NOT NULL,
    foto LONGBLOB,
    capa LONGBLOB,
    amigos VARCHAR(255),
    posts VARCHAR(255),
    descProg TEXT
);

-- Tabela Vídeos
CREATE TABLE Vídeos (
    id VARCHAR(255) PRIMARY KEY NOT NULL,
    tipo INT NOT NULL,
    descricao TEXT NOT NULL,
    duracao INT NOT NULL,
    comentarios INT DEFAULT 0
);

-- Tabela Postagem
CREATE TABLE Postagem (
    id VARCHAR(255) PRIMARY KEY NOT NULL,
    tipo INT NOT NULL,
    descricao TEXT NOT NULL,
    tem_Img INT DEFAULT 0,
    img_tipo INT,
    comentarios INT DEFAULT 0
);

-- Tabela Comentário
CREATE TABLE Comentário (
    id VARCHAR(255) PRIMARY KEY NOT NULL,
    tipo INT NOT NULL,
    texto TEXT NOT NULL,
    tem_Img INT DEFAULT 0,
    img_tipo INT,
    comentarios INT DEFAULT 0
);

-- Tabela Grupo
CREATE TABLE Grupo (
    id VARCHAR(255) PRIMARY KEY NOT NULL,
    membros VARCHAR(255) NOT NULL,
    postagens VARCHAR(255) NOT NULL
);

-- Tabela Desafios
CREATE TABLE Desafios (
    id VARCHAR(255) PRIMARY KEY NOT NULL,
    descricao TEXT NOT NULL,
    post VARCHAR(255) NOT NULL
);

-- Tabela Ranking
CREATE TABLE Ranking (
    idRanking VARCHAR(255) PRIMARY KEY NOT NULL,
    top_user_id VARCHAR(255) NOT NULL
);

-- Adicionando chaves estrangeiras
ALTER TABLE Posts ADD CONSTRAINT fk_posts_registrar FOREIGN KEY (id) REFERENCES Registrar(id);
ALTER TABLE Grupo ADD CONSTRAINT fk_grupo_usuarios FOREIGN KEY (membros) REFERENCES Usuários(id);
ALTER TABLE Ranking ADD CONSTRAINT fk_ranking_desafios FOREIGN KEY (idRanking) REFERENCES Desafios(id);
ALTER TABLE Ranking ADD CONSTRAINT fk_ranking_usuarios FOREIGN KEY (top_user_id) REFERENCES Usuários(id);
ALTER TABLE Desafios ADD CONSTRAINT fk_desafios_usuarios FOREIGN KEY (id) REFERENCES Usuários(id);
ALTER TABLE Desafios ADD CONSTRAINT fk_desafios_grupo FOREIGN KEY (id) REFERENCES Grupo(id);
ALTER TABLE Comentário ADD CONSTRAINT fk_comentario_posts FOREIGN KEY (id) REFERENCES Posts(id);
ALTER TABLE MSG ADD CONSTRAINT fk_msg_usuarios FOREIGN KEY (abas) REFERENCES Usuários(id);
ALTER TABLE Postagem ADD CONSTRAINT fk_postagem_posts FOREIGN KEY (id) REFERENCES Posts(id);
ALTER TABLE Vídeos ADD CONSTRAINT fk_videos_posts FOREIGN KEY (id) REFERENCES Posts(id);
ALTER TABLE Perfil ADD CONSTRAINT fk_perfil_usuarios FOREIGN KEY (id) REFERENCES Usuários(id);
ALTER TABLE Usuários ADD CONSTRAINT fk_usuarios_perfil FOREIGN KEY (amigos) REFERENCES Perfil(amigos);