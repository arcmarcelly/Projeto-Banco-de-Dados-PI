-- ------------------------------------------------------------------------
-- ----------------------- TESTE DASTRIGGERS ------------------------------
-- ------------------------------------------------------------------------

-- ------------------------------------------------------------------------
-- TESTE DA TRIGGER 1 - Dispara quando a quantidade do lote for alterada.
-- ------------------------------------------------------------------------
UPDATE Lote
SET qtd_kg = qtd_kg + 10
WHERE idLote = 1;
SELECT * FROM Notificacao ORDER BY idNotificacao DESC LIMIT 3;

-- ------------------------------------------------------------------------
-- TESTE DA TRIGGER 2 (INSERT para a tabela lote)
-- ------------------------------------------------------------------------
INSERT INTO Lote (tipo_semente, data_recebimento, qtd_kg, Fornecedor_idFornecedor, CentroDistribuicao_idCentroDistribuicao)
VALUES ('TesteTrigger2', CURDATE(), 200, 1, 1);
SELECT * FROM TesteLaboratorial ORDER BY idTesteLaboratorial DESC LIMIT 5;

-- ------------------------------------------------------------------------
-- TESTE DA TRIGGER 3 - Cria notificação quando um lote é criado.
-- ------------------------------------------------------------------------
INSERT INTO Lote (tipo_semente, data_recebimento, qtd_kg, Fornecedor_idFornecedor, CentroDistribuicao_idCentroDistribuicao)
VALUES ('Milho Teste', CURDATE(), 500, 1, 1);

SELECT * FROM Notificacao ORDER BY idNotificacao DESC LIMIT 3;

-- ------------------------------------------------------------------------
-- TESTE DA TRIGGER 4 - Atualiza qtd_kg do Lote quando uma nova Saca é criada
-- ------------------------------------------------------------------------


INSERT INTO Saca (peso_kg, data_fracionamento, qr_code, status, Lote_idLote)
VALUES (20, CURDATE(), 'QRTESTE-001', 'No Centro', 1);
SELECT * FROM Saca;


-- ------------------------------------------------------------------------
-- TESTE DA TRIGGER 5 - Cria notificação ao cadastrar lote.
-- ------------------------------------------------------------------------
INSERT INTO Lote (tipo_semente, data_recebimento, qtd_kg, Fornecedor_idFornecedor, CentroDistribuicao_idCentroDistribuicao)
VALUES ('Milho Trigger1', CURDATE(), 300, 1, 1);
SELECT * FROM Lote;

-- ------------------------------------------------------------------------
-- TESTE DA TRIGGER 6 - Atualiza status da saca automaticamente.
-- ------------------------------------------------------------------------
INSERT INTO MovimentacaoSaca (data_hora, tipo_movimentacao, local_origem, local_destino, Saca_idSaca)
VALUES (NULL, 'Entrada', 'Origem Teste', 'Destino Teste', 1);
SELECT * FROM MovimentacaoSaca;

-- ------------------------------------------------------------------------
-- TESTE DA TRIGGER 7 - Inseri um novo lote
-- ------------------------------------------------------------------------
INSERT INTO Lote (tipo_semente, data_recebimento, qtd_kg)
VALUES ('Soja', CURDATE(), 500);
SELECT*FROM Lote;


-- ------------------------------------------------------------------------
-- TESTE DA TRIGGER 8 - Atualiza status da Saca após movimentação
-- ------------------------------------------------------------------------

INSERT INTO MovimentacaoSaca (data_hora, tipo_movimentacao, local_origem, local_destino, Saca_idSaca)
VALUES (NOW(), 'Saída', 'CD Teste', 'Destino X', 1);
SELECT*FROM MovimentacaoSaca;

-- ------------------------------------------------------------------------
-- TESTE DA TRIGGER 9 - Se data_hora for NULL, define NOW()
-- ------------------------------------------------------------------------
INSERT INTO MovimentacaoSaca (data_hora, tipo_movimentacao, local_origem, local_destino, Saca_idSaca)
VALUES (NULL, 'Entrada', 'Teste Origem', 'Teste Destino', 1);
SELECT * FROM MovimentacaoSaca ORDER BY idMovimentacaoSaca DESC LIMIT 1;

-- ------------------------------------------------------------------------
-- TESTE DA TRIGGER 10 - Atualiza status da saca de acordo com movimentação
-- ------------------------------------------------------------------------
INSERT INTO MovimentacaoSaca (data_hora, tipo_movimentacao, local_origem, local_destino, Saca_idSaca)
VALUES (NOW(), 'Saída', 'Centro', 'Cliente X', 1);

SELECT idSaca, status FROM Saca WHERE idSaca = 1;

-- ------------------------------------------------------------------------
-- TESTE DA TRIGGER 11 - Preenche data_envio automaticamente
-- ------------------------------------------------------------------------

INSERT INTO Notificacao (mensagem, status)
VALUES ('Batata doce disponível no escritório A', 'Disponível');
SELECT * FROM Notificacao;

-- ------------------------------------------------------------------------
-- TESTE DA TRIGGER 12 - Registra movimentação quando vinculada à saca
-- ------------------------------------------------------------------------
INSERT INTO Notificacao (data_envio, mensagem, status, Saca_idSaca)
VALUES (CURDATE(), 'Teste Trigger 12', 'Nova', 1);
SELECT * FROM MovimentacaoSaca ORDER BY idMovimentacaoSaca DESC LIMIT 3;

