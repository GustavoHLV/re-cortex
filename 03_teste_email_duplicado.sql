-- Re-Cortex - Prova de conceito do modelo relacional (4o periodo, Fase 02)
-- SQLite, dados ficticios. Nao valida MySQL, Spring Boot ou JPA.
-- PASSO 3: rode DEPOIS do passo 1. Deve dar erro: UNIQUE constraint failed: Usuario.email.
INSERT INTO Usuario VALUES (2, 'Outro Usuario', 'teste@exemplo.com', 'outra_senha', 'terapeuta');
