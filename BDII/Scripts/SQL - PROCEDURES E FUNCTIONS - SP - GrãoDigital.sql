-- -----------------------------------------------------------------
				-- FUNCTIONS --
-- -----------------------------------------------------------------

-- -----------------------------------------------------------------
-- 1. FUNCTION: fn_total_sacas_lote
-- Objetivo: Retorna quantas sacas pertencem a um lote específico.
-- -----------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION fn_total_sacas_lote(p_idLote INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    -- Conta quantas sacas estão associadas ao lote
    SELECT COUNT(*) INTO total
    FROM Saca 
    WHERE Lote_idLote = p_idLote;

    RETURN total;
END $$
DELIMITER ;

-- -----------------------------------------------------------------
-- 2. FUNCTION: fn_total_kg_lote
-- Objetivo: Soma o peso total das sacas de um lote.
-- -----------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION fn_total_kg_lote(p_idLote INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(peso_kg) INTO total
    FROM Saca WHERE Lote_idLote = p_idLote;

    RETURN total;
END $$
DELIMITER ;

-- -----------------------------------------------------------------
-- 3. FUNCTION: fn_lote_aprovado
-- Objetivo: Verifica se o lote passou por algum teste laboratorial aprovado.
-- Retorno: "Aprovado" ou "Reprovado".
-- -----------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION fn_lote_aprovado(p_idLote INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE status_lote VARCHAR(20);

    IF EXISTS(
        SELECT * FROM TesteLaboratorial
        WHERE Lote_idLote = p_idLote AND resultado = 'Aprovado'
    ) THEN
        SET status_lote = 'Aprovado';
    ELSE
        SET status_lote = 'Reprovado';
    END IF;

    RETURN status_lote;
END $$
DELIMITER ;

-- -----------------------------------------------------------------
-- 4. FUNCTION: fn_total_agricultores_associacao
-- Objetivo: Contar quantos agricultores pertencem a uma mesma associação.
-- -----------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION fn_total_agricultores_associacao(p_idAssociacao INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE qtd INT;

    SELECT COUNT(*) INTO qtd
    FROM Agricultor
    WHERE Associacao_idAssociacao = p_idAssociacao;

    RETURN qtd;
END $$
DELIMITER ;

-- -----------------------------------------------------------------
-- 5. FUNCTION: fn_total_mov_saca
-- Objetivo: Retorna quantas movimentações uma saca recebeu.
-- -----------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION fn_total_mov_saca(p_idSaca INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE qtd INT;

    SELECT COUNT(*) INTO qtd
    FROM MovimentacaoSaca
    WHERE Saca_idSaca = p_idSaca;

    RETURN qtd;
END $$
DELIMITER ;

-- -----------------------------------------------------------------
-- 6. FUNCTION: fn_escritorio_saca
-- Objetivo: Retorna o total de lotes cadastrados
-- -----------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION fn_total_lotes()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE qtd INT;
    
    SELECT COUNT(*) INTO qtd
    FROM Lote;

    RETURN qtd;
END $$
DELIMITER ;


-- -----------------------------------------------------------------
-- ----------------------- PROCEDURES ------------------------------
-- -----------------------------------------------------------------

-- -----------------------------------------------------------------
-- 7. PROCEDURE: sp_detalhes_lote
-- Objetivo: Exibe informações completas do lote, incluindo fornecedor e CD.
-- -----------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE sp_detalhes_lote_simples(IN p_idLote INT)
BEGIN
    SELECT *
    FROM Lote
    WHERE idLote = p_idLote;
END $$
DELIMITER ;


-- -----------------------------------------------------------------
-- 8. PROCEDURE: sp_movimentacoes_saca
-- Objetivo: Exibe todas as movimentações de uma saca.
-- -----------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE sp_movimentacoes_saca(p_idSaca INT)
BEGIN
    SELECT * 
    FROM MovimentacaoSaca
    WHERE Saca_idSaca = p_idSaca;
END $$
DELIMITER ;

-- -----------------------------------------------------------------
-- 9. PROCEDURE: sp_notificacoes_agricultor
-- Objetivo: Lista todas as notificações enviadas para um agricultor.
-- -----------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE sp_notificacoes_agricultor(p_idAgricultor INT)
BEGIN
    SELECT * 
    FROM Notificacao
    WHERE Agricultor_idAgricultor = p_idAgricultor;
END $$
DELIMITER ;

-- -----------------------------------------------------------------
-- 10. PROCEDURE: sp_inserir_agricultor
-- Objetivo: Insere um novo agricultor no sistema.
-- -----------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE sp_inserir_agricultor(
    IN p_nome VARCHAR(120),
    IN p_CPF VARCHAR(14),
    IN p_telefone VARCHAR(15)
)
BEGIN
    INSERT INTO Agricultor (nome, CPF, telefone)
    VALUES (p_nome, p_CPF, p_telefone);
END $$
DELIMITER ;

-- -----------------------------------------------------------------
-- 11. PROCEDURE: sp_atualizar_status_saca
-- Objetivo: Atualizar o status de uma saca (No Centro, Retirada, etc).
-- -----------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE sp_atualizar_status_saca(
    IN p_idSaca INT,
    IN p_status VARCHAR(20)
)
BEGIN
    UPDATE Saca
    SET status = p_status
    WHERE idSaca = p_idSaca;
END $$
DELIMITER ;

-- -----------------------------------------------------------------
-- 12. PROCEDURE: sp_sacas_por_lote
-- Objetivo: Lista todas as sacas pertencentes a um lote específico.
-- -----------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE sp_sacas_por_lote(p_idLote INT)
BEGIN
    SELECT *
    FROM Saca
    WHERE Lote_idLote = p_idLote;
END $$
DELIMITER ;

-- -----------------------------------------------------------------
-- 13. PROCEDURE: sp_fornecedores_licitacao
-- Objetivo: Lista fornecedores vinculados a uma licitação.
-- -----------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE sp_fornecedores_licitacao(p_idLicitacao INT)
BEGIN
    SELECT *
    FROM Fornecedor
    WHERE Licitacao_idLicitacao = p_idLicitacao;
END $$
DELIMITER ;

-- -----------------------------------------------------------------
-- 14. PROCEDURE: sp_testes_laboratoriais
-- Objetivo: Exibe os testes laboratoriais associados a um lote.
-- -----------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE sp_testes_laboratoriais(p_idLote INT)
BEGIN
    SELECT *
    FROM TesteLaboratorial
    WHERE Lote_idLote = p_idLote;
END $$
DELIMITER ;
