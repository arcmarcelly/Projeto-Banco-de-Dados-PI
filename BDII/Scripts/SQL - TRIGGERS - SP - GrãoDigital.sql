-- ------------------------------------------------------------------------
-- ----------------------- TRIGGERS ---------------------------------------
-- ------------------------------------------------------------------------

-- -------------------------------------------------------------------------
-- 1. Dispara quando a quantidade do lote for alterada.
-- --------------------------------------------------------------------------
DROP TRIGGER IF EXISTS trg_lote_au_historico;
DELIMITER $$
CREATE TRIGGER trg_lote_au_historico
AFTER UPDATE ON Lote
FOR EACH ROW
BEGIN
    IF OLD.qtd_kg <> NEW.qtd_kg THEN
        INSERT INTO Notificacao (data_envio, mensagem, status, Saca_idSaca)
        VALUES (
            CURDATE(),
            CONCAT('Alteração no lote ', NEW.idLote,
                   ': qtd_kg alterado de ', OLD.qtd_kg,
                   ' para ', NEW.qtd_kg),
            'Alteração',
            NULL
        );
    END IF;
END $$
DELIMITER ;


-- -------------------------------------------------------------------------------
-- 2. Registra histórico de exclusão. — cria teste laboratorial inicial "Pendente"
-- -------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS trg_lote_ai_cria_teste;
DELIMITER $$
CREATE TRIGGER trg_lote_ai_cria_teste
AFTER INSERT ON Lote
FOR EACH ROW
BEGIN
    INSERT INTO TesteLaboratorial (data_teste, resultado, Lote_idLote)
    VALUES (CURDATE(), 'Pendente', NEW.idLote);
END $$
DELIMITER ;

-- ------------------------------------------------------------------------------------------------------------------------
-- 3. Cria notificação quando um lote é criado.
-- ------------------------------------------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS trg_lote_ai_notificacao;
DELIMITER $$
CREATE TRIGGER trg_lote_ai_notificacao
AFTER INSERT ON Lote
FOR EACH ROW
BEGIN
    INSERT INTO Notificacao (data_envio, mensagem, status, Saca_idSaca)
    VALUES (
        CURDATE(),
        CONCAT('Novo lote criado: ID ', NEW.idLote),
        'Criado',
        NULL
    );
END $$
DELIMITER ;

-- ------------------------------------------------------------
-- 4. Atualiza qtd_kg do Lote quando uma nova Saca é criada
-- -----------------------------------------------------------
DELIMITER $$
CREATE TRIGGER trg_saca_atualiza_lote
AFTER INSERT ON Saca
FOR EACH ROW
BEGIN
    UPDATE Lote
    SET qtd_kg = qtd_kg - NEW.peso_kg
    WHERE idLote = NEW.Lote_idLote;
END$$
DELIMITER ;

-- ---------------------------------------------
-- 5. Cria notificação ao cadastrar lote.
-- ---------------------------------------------
DROP TRIGGER IF EXISTS trg_lote_ai_notif;
DELIMITER $$
CREATE TRIGGER trg_lote_ai_notif
AFTER INSERT ON Lote
FOR EACH ROW
BEGIN
    INSERT INTO Notificacao (data_envio, mensagem, status, Saca_idSaca)
    VALUES (CURDATE(), CONCAT('Lote criado: ', NEW.idLote), 'Criado', NULL);
END $$
DELIMITER ;

-- ----------------------------------------------------------
-- 6.Inseri um novo lote
-- ----------------------------------------------------------
DROP TRIGGER IF EXISTS trg1_lote_ai;
DELIMITER $$
CREATE TRIGGER trg1_lote_ai
AFTER INSERT ON Lote
FOR EACH ROW
BEGIN
    INSERT INTO Notificacao (data_envio, mensagem, status)
    VALUES (CURDATE(), CONCAT('Lote criado ID: ', NEW.idLote), 'ok');
END $$
DELIMITER ;

-- ---------------------------------------------
-- 7. BEFORE UPDATE — impede status inválido
-- ---------------------------------------------
DROP TRIGGER IF EXISTS trg_saca_bu_valida_status;
DELIMITER $$
CREATE TRIGGER trg_saca_bu_valida_status
BEFORE UPDATE ON Saca
FOR EACH ROW
BEGIN
    IF NEW.status NOT IN ('No Centro','Em Transito','Retirada') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Status inválido na tabela Saca.';
    END IF;
END $$
DELIMITER ;

-- -------------------------------------------------------------
-- 8. Atualiza status da Saca após movimentação
-- -------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER trg_movimentacao_atualiza_status
AFTER INSERT ON MovimentacaoSaca
FOR EACH ROW
BEGIN
    IF NEW.tipo_movimentacao = 'Entrada' THEN
        UPDATE Saca 
        SET status = 'No Centro'
        WHERE idSaca = NEW.Saca_idSaca;
    ELSEIF NEW.tipo_movimentacao = 'Saída' THEN
        UPDATE Saca 
        SET status = 'Em Transito'
        WHERE idSaca = NEW.Saca_idSaca;
    END IF;
END$$
DELIMITER ;


-- ---------------------------------------------
-- 9. Se data_hora for NULL, define NOW()
-- ---------------------------------------------
DROP TRIGGER IF EXISTS trg_mov_bi_data;
DELIMITER $$
CREATE TRIGGER trg_mov_bi_data
BEFORE INSERT ON MovimentacaoSaca
FOR EACH ROW
BEGIN
    IF NEW.data_hora IS NULL THEN
        SET NEW.data_hora = NOW();
    END IF;
END $$
DELIMITER ;

-- ----------------------------------------------------------------------
-- 10. Atualiza status da saca de acordo com movimentação
-- ----------------------------------------------------------------------
DROP TRIGGER IF EXISTS trg_mov_ai_status;
DELIMITER $$
CREATE TRIGGER trg_mov_ai_status
AFTER INSERT ON MovimentacaoSaca
FOR EACH ROW
BEGIN
    IF NEW.tipo_movimentacao = 'Saída' THEN
        UPDATE Saca SET status = 'Em Transito' WHERE idSaca = NEW.Saca_idSaca;
    ELSEIF NEW.tipo_movimentacao = 'Entrada' THEN
        UPDATE Saca SET status = 'No Centro' WHERE idSaca = NEW.Saca_idSaca;
    END IF;
END $$
DELIMITER ;

-- -----------------------------------------------------------
-- 11. Preenche data_envio automaticamente
-- -----------------------------------------------------------
DELIMITER $$
CREATE TRIGGER trg_notificacao_set_data
BEFORE INSERT ON Notificacao
FOR EACH ROW
BEGIN
    IF NEW.data_envio IS NULL THEN
        SET NEW.data_envio = CURDATE();
    END IF;
END$$
DELIMITER ;

-- -----------------------------------------------------------------
-- 12. Registra movimentação quando vinculada à saca
-- -----------------------------------------------------------------
DROP TRIGGER IF EXISTS trg_notif_ai_mov;
DELIMITER $$
CREATE TRIGGER trg_notif_ai_mov
AFTER INSERT ON Notificacao
FOR EACH ROW
BEGIN
    IF NEW.Saca_idSaca IS NOT NULL THEN
        INSERT INTO MovimentacaoSaca (
            data_hora, tipo_movimentacao, local_origem, local_destino, Saca_idSaca
        )
        VALUES (
            NOW(), 'Entrada', 'Notificação', 'Centro', NEW.Saca_idSaca
        );
    END IF;
END $$
DELIMITER ;
