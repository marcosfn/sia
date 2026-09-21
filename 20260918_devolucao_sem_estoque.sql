-- Configuracao por empresa para devolucao de venda sem movimento de estoque.
-- PostgreSQL 8.3/9.6. Executar uma vez por banco, antes de atualizar o programa.

BEGIN;

ALTER TABLE empresas
  ADD COLUMN movimenta_estoque_devolucao varchar(3) NOT NULL DEFAULT 'SIM';

ALTER TABLE devolucao
  ADD COLUMN estoque_movimentado boolean NOT NULL DEFAULT false;

-- Notas ja geradas antes desta atualizacao seguiram a regra antiga.
-- Preserva o estorno de estoque ao reativar/excluir essas notas.
UPDATE devolucao
SET estoque_movimentado = true
WHERE gerado = 'SIM' AND tipo IN ('1', '5');

COMMIT;
