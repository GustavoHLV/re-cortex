-- Re-Cortex - Prova de conceito do modelo relacional (4o periodo, Fase 02)
-- SQLite, dados ficticios. Nao valida MySQL, Spring Boot ou JPA.
-- PASSO 2: rode DEPOIS do passo 1. Deve dar erro: FOREIGN KEY constraint failed.
PRAGMA foreign_keys = ON;
INSERT INTO PersonalizationProfile VALUES (2, 999, 'perfil invalido');
