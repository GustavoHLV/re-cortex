-- Re-Cortex - Prova de conceito do modelo relacional (4o periodo, Fase 02)
-- SQLite, dados ficticios. Nao valida MySQL, Spring Boot ou JPA.
-- PASSO 1: rode este arquivo inteiro. Tire print da tabela de resultado.
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS UsuarioReward;
DROP TABLE IF EXISTS ProgressReport;
DROP TABLE IF EXISTS Session;
DROP TABLE IF EXISTS Reward;
DROP TABLE IF EXISTS ContentModule;
DROP TABLE IF EXISTS PersonalizationProfile;
DROP TABLE IF EXISTS Usuario;

CREATE TABLE Usuario (
    id_usuario INTEGER PRIMARY KEY,
    nome       TEXT NOT NULL,
    email      TEXT NOT NULL UNIQUE,
    senha      TEXT NOT NULL,
    tipo       TEXT NOT NULL
);
CREATE TABLE PersonalizationProfile (
    id_perfil    INTEGER PRIMARY KEY,
    id_usuario   INTEGER NOT NULL UNIQUE,
    preferencias TEXT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);
CREATE TABLE ContentModule (
    id_modulo INTEGER PRIMARY KEY,
    titulo    TEXT NOT NULL,
    descricao TEXT
);
CREATE TABLE Session (
    id_sessao  INTEGER PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    id_modulo  INTEGER NOT NULL,
    data       TEXT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_modulo)  REFERENCES ContentModule(id_modulo)
);
CREATE TABLE ProgressReport (
    id_relatorio INTEGER PRIMARY KEY,
    id_sessao    INTEGER NOT NULL UNIQUE,
    desempenho   TEXT,
    FOREIGN KEY (id_sessao) REFERENCES Session(id_sessao)
);
CREATE TABLE Reward (
    id_recompensa INTEGER PRIMARY KEY,
    descricao     TEXT NOT NULL
);
CREATE TABLE UsuarioReward (
    id_usuario    INTEGER NOT NULL,
    id_recompensa INTEGER NOT NULL,
    PRIMARY KEY (id_usuario, id_recompensa),
    FOREIGN KEY (id_usuario)    REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_recompensa) REFERENCES Reward(id_recompensa)
);

INSERT INTO Usuario VALUES (1, 'Usuario Teste', 'teste@exemplo.com', 'senha_ficticia', 'paciente');
INSERT INTO PersonalizationProfile VALUES (1, 1, 'tema calmo, poucos elementos na tela');
INSERT INTO ContentModule VALUES (1, 'Modulo de exemplo', 'Atividade estruturada de teste');
INSERT INTO Session VALUES (1, 1, 1, '2026-10-17');
INSERT INTO ProgressReport VALUES (1, 1, 'Concluiu 8 de 10 atividades');
INSERT INTO Reward VALUES (1, 'Estrela de participacao');
INSERT INTO UsuarioReward VALUES (1, 1);

-- Teste 1: consulta com juncoes (deve retornar 1 linha)
SELECT u.nome, p.preferencias, c.titulo, s.data, r.desempenho
FROM Usuario u
JOIN PersonalizationProfile p ON p.id_usuario = u.id_usuario
JOIN Session s                ON s.id_usuario = u.id_usuario
JOIN ContentModule c          ON c.id_modulo  = s.id_modulo
JOIN ProgressReport r         ON r.id_sessao  = s.id_sessao;
