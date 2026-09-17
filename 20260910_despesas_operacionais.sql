-- Classificacao de despesas operacionais para Contas a Pagar.
-- Compativel com PostgreSQL 8.3 e 9.6. Execute uma unica vez em cada banco.

BEGIN;

CREATE TABLE despesa_operacional (
  id integer NOT NULL,
  descricao varchar(60) NOT NULL,
  CONSTRAINT pk_despesa_operacional PRIMARY KEY (id),
  CONSTRAINT uk_despesa_operacional_descricao UNIQUE (descricao)
);

INSERT INTO despesa_operacional (id, descricao) VALUES (1, 'CAPEX - EMPREST. INVEST.');
INSERT INTO despesa_operacional (id, descricao) VALUES (2, 'DESPESA ADMINISTRATIVA');
INSERT INTO despesa_operacional (id, descricao) VALUES (3, 'DESPESA COMERCIAL');
INSERT INTO despesa_operacional (id, descricao) VALUES (4, 'DESPESA DE VIAGEM');
INSERT INTO despesa_operacional (id, descricao) VALUES (5, 'DESPESA FINANCEIRA');
INSERT INTO despesa_operacional (id, descricao) VALUES (6, 'DESPESA OPERACIONAL');
INSERT INTO despesa_operacional (id, descricao) VALUES (7, 'DESPESA PATRIMONIAL');
INSERT INTO despesa_operacional (id, descricao) VALUES (8, 'DESPESA SERV. DE TERCEIROS');
INSERT INTO despesa_operacional (id, descricao) VALUES (9, 'DIVIDENDOS');
INSERT INTO despesa_operacional (id, descricao) VALUES (10, 'FORNECEDORES - CMV');
INSERT INTO despesa_operacional (id, descricao) VALUES (11, 'IMPOSTOS S/ LUCRO');
INSERT INTO despesa_operacional (id, descricao) VALUES (12, 'IMPOSTOS S/ VENDAS');

ALTER TABLE conta_pagar ADD COLUMN id_despesa_operacional integer;

ALTER TABLE conta_pagar
  ADD CONSTRAINT fk_conta_pagar_despesa_operacional
  FOREIGN KEY (id_despesa_operacional)
  REFERENCES despesa_operacional (id);

CREATE INDEX ix_conta_pagar_despesa_operacional
  ON conta_pagar (id_despesa_operacional);

COMMIT;
