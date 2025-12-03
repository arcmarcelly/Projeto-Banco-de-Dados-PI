-- -----------------------------------------------------------------
-- ---------------   TESTE DAS FUNCTIONS ---------------------------
-- -----------------------------------------------------------------

-- 1. Total de sacas do lote 1
SELECT fn_total_sacas_lote(1);

-- 2. Peso total das sacas do lote 1
SELECT fn_total_kg_lote(1);

-- 3. Verifica se o lote 1 possui algum teste aprovado
SELECT fn_lote_aprovado(1);

-- 4. Quantidade de agricultores da associação 1
SELECT fn_total_agricultores_associacao(1);

-- 5. Quantidade de movimentações da saca 1
SELECT fn_total_mov_saca(1);

-- 6. Total de lotes cadastrados
SELECT fn_total_lotes();



-- -----------------------------------------------------------------
-- ---------------   TESTE DAS PROCEDURES --------------------------
-- -----------------------------------------------------------------

-- 7. Mostra em qual linha está determinado lote
CALL sp_detalhes_lote_simples(1);

-- 8. Exibir todas as movimentações da saca 1
CALL sp_movimentacoes_saca(1);

-- 9. Exibir todas as notificações do agricultor 1
CALL sp_notificacoes_agricultor(1);

-- 10. Inserir novo agricultor (CALL DE INSERIR)
CALL sp_inserir_agricultor('Novo Agricultor', '111.222.333-44', '81988887777');

-- 11. Atualizar status da saca 1 para "Retirada" (CALL DE ATUALIZAR)
CALL sp_atualizar_status_saca(1, 'Retirada');

-- 12. Exibir sacas do lote 1
CALL sp_sacas_por_lote(1);

-- 13. Exibir fornecedores da licitação 1
CALL sp_fornecedores_licitacao(1);

-- 14. Exibir testes laboratoriais do lote 1
CALL sp_testes_laboratoriais(1);
