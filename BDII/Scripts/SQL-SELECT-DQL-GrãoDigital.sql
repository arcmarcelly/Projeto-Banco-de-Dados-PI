-- ----------------------------------------------------------------------------------
    -- DQL - SELECT - 20 CONSULTAS/PERGUNTAS/RELATÓRIOS USANDO JJOIN E SUBSELECT --
-- ----------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------
-- 1.  Quais lotes foram entregues, mas ainda não possuem um registro de teste laboratorial associado? --
-- -----------------------------------------------------------------------------------------------------
SELECT
    L.idLote,
    L.tipo_semente,
    L.data_recebimento,
    F.nome_fornecedor
FROM
    Lote L
JOIN
    Fornecedor F ON L.Fornecedor_idFornecedor = F.idFornecedor
WHERE
    L.idLote NOT IN (
        SELECT DISTINCT
            Lote_idLote
        FROM
            TesteLaboratorial
    );

-- ------------------------------------------------------------------
-- 2. -- Relatório de lotes aprovados e reprovados por fornecedor --
-- ------------------------------------------------------------------
SELECT
    F.nome_fornecedor,
    (SELECT COUNT(*)
     FROM TesteLaboratorial T
     JOIN Lote L2 ON L2.idLote = T.Lote_idLote
     WHERE T.resultado = 'Aprovado'
       AND L2.Fornecedor_idFornecedor = F.idFornecedor) AS total_aprovados,

    (SELECT COUNT(*)
     FROM TesteLaboratorial T
     JOIN Lote L2 ON L2.idLote = T.Lote_idLote
     WHERE T.resultado = 'Reprovado'
       AND L2.Fornecedor_idFornecedor = F.idFornecedor) AS total_reprovados

FROM Fornecedor F;

-- ------------------------------------------------------
-- 3. Consulta da última movimentação de cada saca. --
-- -------------------------------------------------------
SELECT
    S.idSaca,
    S.qr_code,
    (SELECT M.tipo_movimentacao
     FROM MovimentacaoSaca M
     WHERE M.Saca_idSaca = S.idSaca
     ORDER BY M.data_hora DESC
     LIMIT 1) AS ultima_movimentacao,

    (SELECT M.local_destino
     FROM MovimentacaoSaca M
     WHERE M.Saca_idSaca = S.idSaca
     ORDER BY M.data_hora DESC
     LIMIT 1) AS destino_final

FROM Saca S;


-- -------------------------------------------------------------------------------------------------
-- 4. Relatório completo do fluxo da semente: licitação → fornecedor → lote → saca → agricultor --
-- -------------------------------------------------------------------------------------------------
SELECT 
    LCT.numero_processo,
    F.nome_fornecedor AS fornecedor,
    L.tipo_semente,
    S.qr_code,
    AGR.nome AS agricultor
FROM Licitacao LCT
JOIN Fornecedor F ON F.Licitacao_idLicitacao = LCT.idLicitacao
JOIN Lote L ON L.Fornecedor_idFornecedor = F.idFornecedor
JOIN Saca S ON S.Lote_idLote = L.idLote
LEFT JOIN Notificacao N ON N.Saca_idSaca = S.idSaca
LEFT JOIN Agricultor AGR ON AGR.idAgricultor = N.Agricultor_idAgricultor;

-- -----------------------------------------------------------------------------------------------------
-- 5.  Consulta de agricultores que receberam notificação que a saca estava disponível para retirada --
-- -----------------------------------------------------------------------------------------------------
SELECT 
    A.nome AS agricultor,
    N.data_envio AS data_notificacao
FROM Notificacao N
JOIN Agricultor A ON A.idAgricultor = N.Agricultor_idAgricultor
WHERE N.status = 'Disponível'
ORDER BY N.data_envio DESC;


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 6. Relatório que lista os lotes de acordo com nome fornecedor e município do CD para entender quem forneceu cada lote e para onde ele foi enviado. --
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    L.idLote,
    L.tipo_semente,
    L.qtd_kg,
    F.nome_fornecedor AS fornecedor,
    CDE.cidade AS municipio_cd
FROM Lote L
JOIN Fornecedor F ON L.Fornecedor_idFornecedor = F.idFornecedor
JOIN CentroDistribuicao_Endereco CDE 
     ON CDE.CentroDistribuicao_idCentroDistribuicao = L.CentroDistribuicao_idCentroDistribuicao;

-- -------------------------------------------------------------------
-- 7.   Relatório de volume de sementes recebidas por município. --
-- -------------------------------------------------------------------
SELECT 
    CDE.cidade AS municipio,
    SUM(L.qtd_kg) AS total_kg
FROM Lote L
JOIN CentroDistribuicao_Endereco CDE 
    ON CDE.CentroDistribuicao_idCentroDistribuicao = L.CentroDistribuicao_idCentroDistribuicao
GROUP BY municipio
ORDER BY total_kg DESC;


-- ----------------------------------------------------------------------
-- 8. Relatório dos 5 fornecedores que entregaram mais kg de sementes --
-- ----------------------------------------------------------------------
SELECT 
    F.nome_fornecedor,
    SUM(L.qtd_kg) AS total_kg
FROM Fornecedor F
JOIN Lote L ON L.Fornecedor_idFornecedor = F.idFornecedor
GROUP BY F.idFornecedor
ORDER BY total_kg DESC
LIMIT 5;

-- -------------------------------------------------------------------
-- 9. Relatório do tipo de semente mais distribuída para os CD --
-- -------------------------------------------------------------------
SELECT 
    CDE.cidade AS municipio,
    L.tipo_semente,
    SUM(L.qtd_kg) AS total_kg
FROM Lote L
JOIN CentroDistribuicao_Endereco CDE 
    ON CDE.CentroDistribuicao_idCentroDistribuicao = L.CentroDistribuicao_idCentroDistribuicao
GROUP BY municipio, L.tipo_semente
ORDER BY municipio, total_kg DESC;


-- ----------------------------------------------------------------------------------------------------------------------
-- 10. Relatório dos Escritórios Locais que receberam sacas que foram transportadas pelo veículo com a placa 'XYZ9B87' --
-- -----------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT
    EL.nome_escritorio AS Escritorio_Local,
    MS.data_hora AS Data_e_Hora_Movimentacao,
    T.placa_veiculo AS Placa_do_Veiculo,
    U.nome AS Nome_Operador_Movimentacao
FROM
    mydb.EscritorioLocal EL
JOIN
    mydb.Saca S ON EL.Saca_idSaca = S.idSaca
JOIN
    mydb.MovimentacaoSaca MS ON S.idSaca = MS.Saca_idSaca
JOIN
    mydb.Transporte T ON MS.Transporte_idTransporte = T.idTransporte
JOIN
    mydb.Usuario U ON MS.Usuario_idUsuario = U.idUsuario
WHERE
    MS.idMovimentacaoSaca IN (
        -- Subconsulta: Encontra os IDs das Movimentações de Transporte da placa 'XYZ9B87'
        SELECT idMovimentacaoSaca
        FROM mydb.MovimentacaoSaca MS2
        JOIN mydb.Transporte T2 ON MS2.Transporte_idTransporte = T2.idTransporte
        WHERE T2.placa_veiculo = 'XYZ9B87'
    )
ORDER BY
    MS.data_hora;
    
    
-- -------------------------------------------------------------------
-- 11. Consulta sobre qual fornecedor entregou o lote mais recente --
-- -------------------------------------------------------------------
SELECT 
    F.nome_fornecedor,
    L.*
FROM Lote L
JOIN Fornecedor F ON F.idFornecedor = L.Fornecedor_idFornecedor
ORDER BY L.data_recebimento DESC
LIMIT 1;


-- -------------------------------------------------------------------------------------------
-- 12. Consulta dos fornecedores que entregaram o lote mais antigo de cada tipo de semente --
-- -------------------------------------------------------------------------------------------
SELECT 
    L.tipo_semente,
    L.data_recebimento,
    F.nome_fornecedor
FROM Lote L
JOIN Fornecedor F ON F.idFornecedor = L.Fornecedor_idFornecedor
WHERE L.data_recebimento = (
   SELECT MIN(L2.data_recebimento)
   FROM Lote L2
   WHERE L2.tipo_semente = L.tipo_semente
);

-- ---------------------------------------------------------------------------
-- 13. Relatório dos 10 agricultores que mais receberam notificações. --
-- ---------------------------------------------------------------------------
SELECT 
    A.nome AS agricultor,
    COUNT(N.idNotificacao) AS qtd_notificacoes
FROM Agricultor A
LEFT JOIN Notificacao N ON N.Agricultor_idAgricultor = A.idAgricultor
GROUP BY A.idAgricultor
ORDER BY qtd_notificacoes DESC
LIMIT 10;


-- -------------------------------------------------------------------
-- 14. Relatório do número de visitas feitas por cada técnico  --
-- -------------------------------------------------------------------
SELECT 
    U.nome AS tecnico,
    COUNT(A.idAcompTecnico) AS total_visitas
FROM Usuario U
LEFT JOIN AcompTecnico A ON A.Usuario_idUsuario = U.idUsuario
WHERE U.tipo_usuario = 'Técnico'
GROUP BY U.idUsuario
ORDER BY total_visitas DESC;

-- -------------------------------------------------------------------------------------
-- 15. Relatório que exibe total de visitas por técnico e compara com a média geral. --
-- -------------------------------------------------------------------------------------
SELECT 
    U.nome,
    (SELECT COUNT(*) 
     FROM AcompTecnico AC 
     WHERE AC.Usuario_idUsuario = U.idUsuario) AS total_visitas,
    (SELECT AVG(visitas_por_tecnico)
        FROM (
            SELECT COUNT(*) AS visitas_por_tecnico
            FROM AcompTecnico
            GROUP BY Usuario_idUsuario
        ) AS T
    ) AS media_geral
FROM Usuario U
WHERE U.tipo_usuario = 'Técnico';


-- ------------------------------------------------------------------------------------
-- 16. Relatório dos lotes que tiveram testes laboratoriais com resultado reprovado --
-- ------------------------------------------------------------------------------------
SELECT 
    L.idLote,
    L.tipo_semente,
    T.resultado
FROM Lote L
JOIN TesteLaboratorial T ON T.Lote_idLote = L.idLote
WHERE T.resultado = 'Reprovado';


-- -----------------------------------------------------------------
-- 17. Consulta com detalhes de lote e fornecedor --
-- ------------------------------------------------------------------
SELECT
    L.idLote,
    L.tipo_semente,
    L.qtd_kg,
    F.nome_fornecedor
FROM
    Lote L
JOIN
    Fornecedor F ON L.Fornecedor_idFornecedor = F.idFornecedor
ORDER BY
    L.data_recebimento DESC;

-- ------------------------------------------------
-- 18. Relatório da quantidade de sacas por lote--
-- ------------------------------------------------
SELECT 
    L.idLote,
    L.tipo_semente,
    COUNT(S.idSaca) AS total_sacas
FROM Lote L
LEFT JOIN Saca S ON S.Lote_idLote = L.idLote
GROUP BY L.idLote;


-- ----------------------------------------------------------------------------------
-- 19. Consulta do CD que fornece apenas 'Sementes Alfa'--
-- ----------------------------------------------------------------------------------
SELECT DISTINCT
    CD.nome_centroDistribuicao
FROM
    mydb.CentroDistribuicao CD
JOIN
    mydb.Lote L ON CD.idCentroDistribuicao = L.CentroDistribuicao_idCentroDistribuicao
WHERE
    L.Fornecedor_idFornecedor IN (
        -- Subconsulta: Encontra o ID do Fornecedor 'Sementes Alfa Ltda.'
        SELECT idFornecedor
        FROM mydb.Fornecedor
        WHERE nome_fornecedor = 'Sementes Alfa Ltda.'
    )
ORDER BY
    CD.nome_centroDistribuicao;


-- -------------------------------------------------------------------
-- 20. Lotes com maior quantidade de testes realizados--
-- -------------------------------------------------------------------
SELECT 
    L.idLote,
    L.tipo_semente,
    COUNT(T.idTesteLaboratorial) AS total_testes
FROM Lote L
JOIN TesteLaboratorial T ON T.Lote_idLote = L.idLote
GROUP BY L.idLote
ORDER BY total_testes DESC;



