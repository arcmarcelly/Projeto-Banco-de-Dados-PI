-- -----------------------------------------------------------------
				-- INSERTS DAS TABELAS --
-- -----------------------------------------------------------------

-- 1. Tabela Associação --
INSERT INTO Associacao (nome_associacao) VALUES 
('Associação dos Produtores de Grãos do Agreste PE'),
('Cooperativa Agrícola do Vale do Ipojuca PE'),
('Associação dos Agricultores Familiares do Sertão PE'),
('Núcleo de Desenvolvimento Rural Central de Caruaru PE'),
('Associação Grão Forte de Petrolina PE'),
('Sindicato Rural de Limoeiro PE'),
('Cooperativa de Produtores Orgânicos de Garanhuns PE'),
('União Agrícola da Zona da Mata PE'),
('Associação de Plantio Sustentável de Arcoverde PE'),
('Núcleo de Apoio ao Agricultor de Vitória de Santo Antão PE'),
('Cooperativa Terra Fértil de Salgueiro PE'),
('Associação de Pequenos Produtores de Pesqueira PE'),
('Rede de Produtores de Milho e Feijão de Afogados da Ingazeira PE'),
('Associação de Desenvolvimento Rural de Goiana PE'),
('Cooperativa Agropecuária do Nordeste em Jaboatão PE'),
('Associação dos Irrigantes do São Francisco em Petrolina PE'),
('Sindicato Rural de Palmares PE'),
('Associação dos Produtores de Mandioca de Buíque PE'),
('Cooperativa de Fruticultores do Vale do Moxotó PE'),
('Núcleo Integrado de Pesquisa Agrícola do IPA em Recife PE');

-- 2. Tabela Associação_Endereço --
INSERT INTO Associacao_Endereco (cep, rua, numero, cidade, UF, pais, Associacao_idAssociacao) VALUES
('50010-000', 'Rua da Aurora', '123', 'Recife', 'PE', 'Brasil', 1),
('56302-000', 'Avenida Monsenhor Ângelo Sampaio', '456', 'Petrolina', 'PE', 'Brasil', 2),
('55293-900', 'Rua Doutor João Pessoa', '789', 'Garanhuns', 'PE', 'Brasil', 3),
('56506-970', 'Rua Cleto Campelo', '101', 'Arcoverde', 'PE', 'Brasil', 4),
('56800-000', 'Avenida Afonso Magalhães', '202', 'Serra Talhada', 'PE', 'Brasil', 5),
('55192-901', 'Rua Bela Vista', '303', 'Santa Cruz do Capibaribe', 'PE', 'Brasil', 6),
('55200-000', 'Rua Esmelinda Freire', '404', 'Pesqueira', 'PE', 'Brasil', 7),
('56000-000', 'Avenida Coronel Cícero de Sá', '505', 'Salgueiro', 'PE', 'Brasil', 8),
('55660-000', 'Rua Cônego Benigno Lira', '606', 'Bezerros', 'PE', 'Brasil', 9),
('56800-970', 'Praça Monsenhor Alfredo de S. Lira', '707', 'Afogados da Ingazeira', 'PE', 'Brasil', 10),
('56530-000', 'Rua Projetada A', '808', 'Custódia', 'PE', 'Brasil', 11),
('55600-000', 'Rua José Ferreira da Silva', '909', 'Belo Jardim', 'PE', 'Brasil', 12),
('56180-000', 'Rua Projetada B', '1010', 'Cabrobó', 'PE', 'Brasil', 13),
('55540-000', 'Rua Coronel José Dourado', '1111', 'Lajedo', 'PE', 'Brasil', 14),
('56460-000', 'Avenida Marechal Rondon', '1212', 'Petrolândia', 'PE', 'Brasil', 15),
('56200-000', 'Rua Cônego', '1313', 'Ouricuri', 'PE', 'Brasil', 16),
('55560-000', 'Rua Doutor Pedro de Alcântara', '1414', 'Palmares', 'PE', 'Brasil', 17),
('55700-000', 'Rua do Comércio', '1515', 'Limoeiro', 'PE', 'Brasil', 18),
('55600-970', 'Rua Severino Farias', '1616', 'Vitória de Santo Antão', 'PE', 'Brasil', 19),
('55002-000', 'Avenida Agamenon Magalhães', '1717', 'Caruaru', 'PE', 'Brasil', 20);    

-- 3. Tabela Licitação --
INSERT INTO Licitacao (numero_processo, data_abertura, data_fechamento) VALUES 
(2023001, '2023-01-15', '2023-02-28'),
(2023002, '2023-03-01', '2023-04-15'),
(2023003, '2023-05-10', '2023-06-30'),
(2023004, '2023-07-01', '2023-08-15'),
(2023005, '2023-09-01', '2023-10-31'),
(2023006, '2023-11-05', '2023-12-20'),
(2024001, '2024-01-10', '2024-02-25'),
(2024002, '2024-03-05', '2024-04-10'),
(2024003, '2024-05-01', '2024-06-15'),
(2024004, '2024-07-20', '2024-09-01'),
(2024005, '2024-10-01', '2024-11-15'),
(2023007, '2023-02-10', '2023-03-10'),
(2023008, '2023-04-20', '2023-05-25'),
(2023009, '2023-06-01', '2023-07-15'),
(2023010, '2023-08-01', '2023-09-10'),
(2023011, '2023-10-01', '2023-11-10'),
(2024006, '2024-02-01', '2024-03-15'),
(2024007, '2024-04-20', '2024-05-30'),
(2024008, '2024-06-10', '2024-07-25'),
(2024009, '2024-08-01', '2024-09-15');

-- 4. Tabela Centro de Distribuição --
INSERT INTO CentroDistribuicao (nome_centroDistribuicao) VALUES
('CD Principal Recife PE'),
('CD Logístico Caruaru PE'),
('CD Operacional Petrolina PE'),
('CD Regional Jaboatão dos Guararapes PE'),
('CD de Trânsito Garanhuns PE'),
('CD Primário Olinda PE'),
('CD Norte Logística Goiana PE'),
('CD Sul Exportação Suape PE'),
('CD Centro de Abastecimento PE'),
('CD Leste Rápido Cabo de Santo Agostinho PE'),
('CD Oeste Fronteira Serra Talhada PE'),
('CD Sertão Arcoverde PE'),
('CD Mata Sul Palmares PE'),
('CD Metropolitano Paulista PE'),
('CD Agreste Belo Jardim PE'),
('CD Central Vitória de Santo Antão PE'),
('CD Armazenamento Ipojuca PE'),
('CD Logístico Sementeiras Gravatá PE'),
('CD Distribuição Limoeiro PE'),
('CD Especiarias São Lourenço da Mata PE');


-- 5. Tabela Centro de Distribuição_Endereço --
INSERT INTO CentroDistribuicao_Endereco 
    (cep, rua, numero, cidade, UF, pais, CentroDistribuicao_idCentroDistribuicao) VALUES 
('51000-010', 'Rua dos Logísticos', '150', 'Recife', 'PE', 'Brasil', 1), 
('55000-020', 'Av. de Cargas', '220', 'Caruaru', 'PE', 'Brasil', 2),
('56300-030', 'Rua do Armazém', '500', 'Petrolina', 'PE', 'Brasil', 3), 
('54300-040', 'Av. Distribuição Jaboatão', '10', 'Jaboatão dos Guararapes', 'PE', 'Brasil', 4),
('55290-050', 'Rua do Trânsito', '75', 'Garanhuns', 'PE', 'Brasil', 5), 
('53000-060', 'Rodovia do Milho', '101', 'Olinda', 'PE', 'Brasil', 6),
('55600-070', 'Rua Norte', '77', 'Vitória de Santo Antão', 'PE', 'Brasil', 7), 
('55590-080', 'Av. Sul Export Suape', '88', 'Ipojuca', 'PE', 'Brasil', 8),
('56800-090', 'Rua Centro-Oeste', '99', 'Arcoverde', 'PE', 'Brasil', 9), 
('55700-100', 'Av. Leste', '10', 'Limoeiro', 'PE', 'Brasil', 10),
('56900-110', 'Rua Fronteira', '11', 'Serra Talhada', 'PE', 'Brasil', 11), 
('55540-120', 'Rua Palmares Log', '120', 'Palmares', 'PE', 'Brasil', 12),
('53400-130', 'Av. Paulista', '13', 'Paulista', 'PE', 'Brasil', 13), 
('55190-140', 'Rua São Paulo S', '140', 'Santa Cruz do Capibaribe', 'PE', 'Brasil', 14),
('55200-150', 'Av. Serra', '15', 'Belo Jardim', 'PE', 'Brasil', 15), 
('53000-160', 'Rua Contagem Olinda', '16', 'Olinda', 'PE', 'Brasil', 16),
('55600-170', 'Rodovia PE-045', '17', 'Gravatá', 'PE', 'Brasil', 17), 
('55300-180', 'Av. Maranhão', '180', 'Bezerros', 'PE', 'Brasil', 18),
('54300-190', 'Rua Itajaí', '19', 'Jaboatão dos Guararapes', 'PE', 'Brasil', 19), 
('52000-200', 'Av. Vila Velha', '200', 'Recife', 'PE', 'Brasil', 20);

-- 6. Tabela Transporte--
INSERT INTO Transporte (placa_veiculo, data_chegada, data_saida) VALUES 
('ABC1A23', '2023-03-01 10:00:00', '2023-03-01 12:00:00'), 
('XYZ9B87', '2023-05-10 14:30:00', '2023-05-11 08:00:00'),
('DEF4C56', '2023-07-05 09:00:00', '2023-07-05 15:30:00'), 
('GHI7D89', '2023-09-20 18:00:00', '2023-09-21 07:00:00'),
('JKL0E12', '2023-11-20 10:00:00', '2023-11-20 11:00:00'), 
('MNO3F45', '2023-11-20 13:00:00', '2023-11-20 14:00:00'),
('PRS6G78', '2024-01-15 08:00:00', '2024-01-15 10:30:00'), 
('TUV9H01', '2024-03-25 11:00:00', '2024-03-25 15:00:00'),
('WXY2I34', '2024-05-05 16:00:00', '2024-05-06 06:00:00'), 
('ZAB5J67', '2024-07-10 12:00:00', '2024-07-10 17:00:00'),
('CDE8K90', '2024-09-01 07:00:00', '2024-09-01 09:30:00'), 
('FGH1L23', '2023-03-15 14:00:00', '2023-03-16 09:00:00'),
('IJK4M56', '2023-05-20 10:00:00', '2023-05-20 12:30:00'), 
('LMN7N89', '2023-07-30 16:00:00', '2023-07-31 07:00:00'),
('OPQ0P12', '2023-09-15 09:00:00', '2023-09-15 11:30:00'), 
('RST3Q45', '2023-11-01 13:00:00', '2023-11-01 15:00:00'),
('UVW6R78', '2024-02-20 11:00:00', '2024-02-20 14:00:00'), 
('XYZ9S01', '2024-04-10 08:00:00', '2024-04-10 10:30:00'),
('BCA2T34', '2024-06-25 12:00:00', '2024-06-25 16:00:00'), 
('DCE5U67', '2024-08-15 15:00:00', '2024-08-16 06:00:00');


-- 7. Tabela Usuário--
INSERT INTO Usuario (nome, email, senha, tipo_usuario) VALUES
('Carlos Almeida', 'carlos.a@ipa.pe.gov.br', 'senha123', 'administrativo'),
('Beatriz Costa', 'beatriz.c@ipa.pe.gov.br', 'TÉCNICO1', 'técnico'),
('Daniela Silva', 'daniela.s@ipa.pe.gov.br', 'ADMIN789', 'administrativo'),
('Eduardo Santos', 'eduardo.s@ipa.pe.gov.br', 'TÉCNICO4', 'técnico'),
('Felipe Oliveira', 'felipe.o@associacao1.org', 'ASSO5', 'associação'),
('Giovana Lima', 'giovana.l@ipa.pe.gov.br', 'GERENTE6', 'administrativo'),
('Helena Rocha', 'helena.r@associacao2.org', 'ASSO7', 'associação'),
('Igor Mendes', 'igor.m@ipa.pe.gov.br', 'TÉCNICO8', 'técnico'),
('Julia Torres', 'julia.t@ipa.pe.gov.br', 'GERENTE9', 'administrativo'),
('Kleber Nunes', 'kleber.n@ipa.pe.gov.br', 'ADMIN010', 'administrativo'),
('Laura Pires', 'laura.p@ipa.pe.gov.br', 'TÉCNICO11', 'técnico'),
('Marcelo Queiroz', 'marcelo.q@associacao3.org', 'ASSO12', 'associação'),
('Natália Ribeiro', 'natalia.r@ipa.pe.gov.br', 'ADMIN13', 'administrativo'),
('Otávio Souza', 'otavio.s@ipa.pe.gov.br', 'TÉCNICO14', 'técnico'),
('Paula Xavier', 'paula.x@associacao4.org', 'ASSO15', 'associação'),
('Quiteria Vaz', 'quiteria.v@ipa.pe.gov.br', 'GERENTE16', 'administrativo'),
('Renato William', 'renato.w@ipa.pe.gov.br', 'ADMIN17', 'administrativo'),
('Sofia Yunes', 'sofia.y@ipa.pe.gov.br', 'TÉCNICO18', 'técnico'),
('Thiago Zanon', 'thiago.z@associacao5.org', 'ASSO19', 'associação'),
('Úrsula Alves', 'ursula.a@ipa.pe.gov.br', 'ADMIN20', 'administrativo');

-- 8. Tabela Fornecedor --
INSERT INTO Fornecedor (CNPJ, nome_fornecedor, Licitacao_idLicitacao) VALUES 
('01.234.567/0001-89', 'Sementes Alfa Ltda.', 1),
('09.876.543/0001-21', 'Grãos Prime S.A.', 2),
('11.222.333/0001-44', 'AgroVida Distribuidora', 3),
('44.555.666/0001-77', 'BioPlant Culturas', 4),
('77.888.999/0001-00', 'Fornecedor Sementeiro', 5),
('10.101.010/0001-11', 'Distribuidora do Campo', 6),
('21.212.121/0001-22', 'Campo Fértil Ltda', 7),
('32.323.232/0001-33', 'AgroTech Insumos', 8),
('43.434.343/0001-44', 'Sementes União', 9),
('54.545.454/0001-55', 'Ouro Verde Agronegócios', 10),
('65.656.565/0001-66', 'Distribuidora Sudoeste', 11),
('76.767.676/0001-77', 'Recursos Agro', 12),
('87.878.787/0001-88', 'Produtores do Nordeste', 13),
('98.989.898/0001-99', 'Geral de Grãos', 14),
('01.010.101/0001-02', 'Sementes Vita', 15),
('12.121.212/0001-23', 'Polo Agroindustrial', 16),
('23.232.323/0001-34', 'Distribuidora Leste', 17),
('34.343.434/0001-45', 'Agro Forte', 18),
('45.454.545/0001-56', 'Sementes Pura', 19),
('56.565.656/0001-67', 'Central Agronegócios', 20);


-- 9. Tabela Fornecedor_Endereço--  
INSERT INTO `mydb`.`Fornecedor_Endereco`
(cep, rua, numero, cidade, UF, pais, Fornecedor_idFornecedor) VALUES
('50010-000', 'Rua do Sol', '120', 'Recife', 'PE', 'Brasil', 1),
('50020-040', 'Avenida Guararapes', '450', 'Recife', 'PE', 'Brasil', 2),
('55002-970', 'Rua das Flores', '87', 'Caruaru', 'PE', 'Brasil', 3),
('55602-040', 'Rua Frei Caneca', '233', 'Vitória de Santo Antão', 'PE', 'Brasil', 4),
('55800-000', 'Avenida Miguel Arraes', '1020', 'Carpina', 'PE', 'Brasil', 5),
('56700-000', 'Rua São José', '55', 'Arcoverde', 'PE', 'Brasil', 6),
('56140-000', 'Rua Joaquim Nabuco', '301', 'Serra Talhada', 'PE', 'Brasil', 7),
('56200-000', 'Rua Padre Cícero', '98', 'Salgueiro', 'PE', 'Brasil', 8),
('55295-000', 'Avenida Portugal', '630', 'Garanhuns', 'PE', 'Brasil', 9),
('55296-200', 'Rua São Vicente', '19', 'Garanhuns', 'PE', 'Brasil', 10),
('56302-130', 'Rua Castro Alves', '217', 'Petrolina', 'PE', 'Brasil', 11),
('56304-230', 'Avenida da Integração', '401', 'Petrolina', 'PE', 'Brasil', 12),
('55200-000', 'Rua Santos Dumont', '71', 'Belo Jardim', 'PE', 'Brasil', 13),
('55380-000', 'Avenida João Cogumelo', '122', 'Lajedo', 'PE', 'Brasil', 14),
('55325-000', 'Rua Sete de Setembro', '289', 'Bom Conselho', 'PE', 'Brasil', 15),
('55560-000', 'Rua Barão do Rio Branco', '900', 'Palmares', 'PE', 'Brasil', 16),
('55590-000', 'Rua Silvino Macedo', '34', 'Ribeirão', 'PE', 'Brasil', 17),
('55640-000', 'Rua Dom João da Costa', '150', 'Gravatá', 'PE', 'Brasil', 18),
('55645-000', 'Avenida Cícero Batista', '600', 'Bezerros', 'PE', 'Brasil', 19),
('55900-000', 'Rua da Matriz', '12', 'Paudalho', 'PE', 'Brasil', 20);


-- 10. Tabela Agricultor --
INSERT INTO Agricultor (nome, CPF, telefone) VALUES 
('Antônio Ferreira Silva', '111.111.111-11', '8199991111'),
('Márcia Souza Lima', '222.222.222-22', '8188882222'),
('João Gomes Santos', '333.333.333-33', '8777773333'),
('Lúcia Pires da Cunha', '444.444.444-44', '8766664444'),
('Ricardo Matos Oliveira', '555.555.555-55', '8755555555'),
('Sandra Mendes Pereira', '666.666.666-66', '8144446666'),
('Pedro Alvares Rocha', '777.777.777-77', '8733337777'),
('Camila Rocha Alves', '888.888.888-88', '8122228888'),
('Gustavo Lima Neves', '999.999.999-99', '8711119999'),
('Heloísa Neves Costa', '000.000.000-00', '8155550000'),
('Ivanildo Costa Junior', '121.212.121-12', '8744441111'),
('Jéssica Soares Lopes', '232.323.232-23', '8133332222'),
('Kleber Nunes Filho', '343.434.343-34', '8722223333'),
('Lorena Xavier Gomes', '454.545.454-45', '8111114444'),
('Miguel Teles da Cruz', '565.565.565-56', '8700005555'),
('Nicole Oliveira Souza', '676.676.676-67', '8199996666'),
('Paulo Ricardo Alves', '787.787.787-78', '8788887777'),
('Quitéria Fontes Rocha', '898.898.898-89', '8177778888'),
('Rafael Vieira Santos', '909.909.909-90', '8766669999'),
('Sueli Borges da Paz', '010.010.010-01', '8155550000');


-- 11. Tabela Agricultor_Endereço --
INSERT INTO Agricultor_Endereco (cep, rua, numero, cidade, UF, pais, Agricultor_idAgricultor) VALUES 
('55000-001', 'Sítio Alto do Coqueiro', 'S/N', 'Caruaru', 'PE', 'Brasil', 1), 
('56300-002', 'Fazenda do Sol', '12', 'Petrolina', 'PE', 'Brasil', 2), 
('55290-003', 'Chácara das Flores', '1000', 'Garanhuns', 'PE', 'Brasil', 3), 
('56800-004', 'Sítio Tabuleiro', '20', 'Arcoverde', 'PE', 'Brasil', 4), 
('56900-005', 'Fazenda Mandacaru', '50', 'Serra Talhada', 'PE', 'Brasil', 5), 
('55190-006', 'Sítio do Artesão', '15', 'Santa Cruz do Capibaribe', 'PE', 'Brasil', 6), 
('56700-007', 'Chácara da Serra', '30', 'Pesqueira', 'PE', 'Brasil', 7), 
('56000-008', 'Fazenda do Vaqueiro', '101', 'Salgueiro', 'PE', 'Brasil', 8), 
('55300-009', 'Sítio da Banana', '20', 'Bezerros', 'PE', 'Brasil', 9), 
('56600-010', 'Fazenda Novo Horizonte', '30', 'Afogados da Ingazeira', 'PE', 'Brasil', 10),
('56850-011', 'Sítio de Baixo', '40', 'Custódia', 'PE', 'Brasil', 11), 
('55200-012', 'Chácara do Milho', '50', 'Belo Jardim', 'PE', 'Brasil', 12), 
('56180-013', 'Fazenda Rio Novo', '60', 'Cabrobó', 'PE', 'Brasil', 13), 
('55350-014', 'Sítio da Vaca', '70', 'Lajedo', 'PE', 'Brasil', 14), 
('56470-015', 'Chácara do Velho Chico', '80', 'Petrolândia', 'PE', 'Brasil', 15), 
('56280-016', 'Fazenda do Peixe', '90', 'Ouricuri', 'PE', 'Brasil', 16), 
('56300-017', 'Sítio do Manga', '100', 'Petrolina', 'PE', 'Brasil', 17), 
('55000-018', 'Chácara do Cangaço', '110', 'Caruaru', 'PE', 'Brasil', 18), 
('55290-019', 'Fazenda da Pedra', '120', 'Garanhuns', 'PE', 'Brasil', 19), 
('56900-020', 'Sítio da Cana Brava', '130', 'Serra Talhada', 'PE', 'Brasil', 20);              


-- 12. Tabela Lote --
INSERT INTO Lote 
(idLote, tipo_semente, data_recebimento, qtd_kg, Fornecedor_idFornecedor, CentroDistribuicao_idCentroDistribuicao) VALUES 
(1, 'Milho Híbrido IPA-1', '2023-02-10', 5000.00, 1, 1), 
(2, 'Feijão Carioca', '2023-04-20', 3500.50, 2, 2),
(3, 'Soja Convencional', '2023-06-01', 10000.00, 3, 3), 
(4, 'Arroz Agulhinha', '2023-08-10', 2000.75, 4, 4),
(5, 'Milho Varietal IPA-2', '2023-11-05', 4500.00, 5, 5), 
(6, 'Feijão Preto', '2023-11-10', 8000.00, 6, 6),
(7, 'Mandioca Semente', '2024-01-01', 1500.00, 7, 7), 
(8, 'Sorgo Granífero', '2024-03-01', 6000.00, 8, 8),
(9, 'Milho Pipoca IPA-3', '2024-05-15', 1000.00, 9, 9), 
(10, 'Soja Renda Alta', '2024-07-25', 12000.00, 10, 10),
(11, 'Arroz Vermelho', '2024-10-05', 3000.00, 11, 11), 
(12, 'Feijão Macassar', '2023-03-20', 2500.00, 12, 12),
(13, 'Milho Doce IPA-4', '2023-05-01', 500.00, 13, 13), 
(14, 'Soja Orgânica', '2023-07-05', 4000.00, 14, 14),
(15, 'Feijão Vigna', '2023-09-01', 7500.00, 15, 15), 
(16, 'Arroz Integral', '2023-11-15', 3200.00, 16, 16),
(17, 'Milheto IPA-5', '2024-02-05', 1800.00, 17, 17), 
(18, 'Girassol Semente', '2024-04-25', 9000.00, 18, 18),
(19, 'Soja Híbrida', '2024-06-30', 11000.00, 19, 19), 
(20, 'Feijão Fradinho', '2024-08-20', 5500.00, 20, 20);


-- 13. Tabela Saca --
INSERT INTO Saca (idSaca, peso_kg, data_fracionamento, qr_code, status, Lote_idLote) VALUES 
(1, 50.00, '2023-02-20', 'IPA-MCH-001', 'No Centro', 1), 
(2, 50.00, '2023-02-20', 'IPA-MCH-002', 'No Centro', 1),
(3, 25.00, '2023-02-20', 'IPA-MCH-003', 'Em Transito', 2), 
(4, 25.00, '2023-02-21', 'IPA-MCH-004', 'Em Transito', 2),
(5, 50.00, '2023-05-01', 'IPA-FCJ-005', 'Em Transito', 3), 
(6, 25.00, '2023-05-01', 'IPA-FCJ-006', 'No Centro', 3),
(7, 25.00, '2023-06-15', 'IPA-SOC-007', 'No Centro', 4), 
(8, 100.00, '2023-06-15', 'IPA-SOC-008', 'No Centro', 4),
(9, 100.00, '2023-08-20', 'IPA-ARA-009', 'No Centro', 5), 
(10, 10.00, '2023-08-20', 'IPA-ARA-010', 'No Centro', 5),
(11, 10.00, '2023-11-10', 'IPA-MCV-011', 'Em Transito', 6), 
(12, 50.00, '2023-11-10', 'IPA-MCV-012', 'No Centro', 6),
(13, 50.00, '2023-11-15', 'IPA-FPR-013', 'No Centro', 7), 
(14, 50.00, '2023-11-15', 'IPA-FPR-014', 'No Centro', 7),
(15, 100.00, '2024-01-08', 'IPA-MAN-015', 'No Centro', 8), 
(16, 100.00, '2024-03-10', 'IPA-SGR-016', 'No Centro', 9),
(17, 25.00, '2024-05-25', 'IPA-MPI-017', 'No Centro', 10), 
(18, 50.00, '2024-07-30', 'IPA-SRA-018', 'No Centro', 11),
(19, 10.00, '2024-09-05', 'IPA-ARV-019', 'No Centro', 12), 
(20, 100.00, '2024-09-05', 'IPA-ARV-020', 'No Centro', 13);


-- 14. Tabela Escritório Local --
INSERT INTO EscritorioLocal (idEscritorioLocal, nome_escritorio, Saca_idSaca) VALUES 
(1, 'Escritório IPA Sede Recife', 1), 
(2, 'Escritório IPA Petrolina', 2),
(3, 'Escritório IPA Garanhuns', 3), 
(4, 'Escritório IPA Arcoverde', 4), 
(5, 'Escritório IPA Serra Talhada', 5), 
(6, 'Escritório IPA Santa Cruz do Capibaribe', 6), 
(7, 'Escritório IPA Pesqueira', 7), 
(8, 'Escritório IPA Salgueiro', 8), 
(9, 'Escritório IPA Bezerros', 9),
(10, 'Escritório IPA Afogados da Ingazeira', 10), 
(11, 'Escritório IPA Custódia', 11), 
(12, 'Escritório IPA Belo Jardim', 12),
(13, 'Escritório IPA Cabrobó', 13), 
(14, 'Escritório IPA Lajedo', 14), 
(15, 'Escritório IPA Petrolândia', 15),
(16, 'Escritório IPA Ouricuri', 16), 
(17, 'Escritório IPA Palmares (Apoio Logístico)', 17), 
(18, 'Escritório IPA Limoeiro (Apoio Logístico)', 18),
(19, 'Escritório IPA Vitória de Santo Antão (Apoio Logístico)', 19), 
(20, 'Escritório IPA Caruaru', 20);


-- 15. Tabela Escritório Local_Endereço --
INSERT INTO EscritorioLocal_Endereco (cep, rua, numero, cidade, UF, pais, EscritorioLocal_idEscritorioLocal) VALUES 
('52070-000', 'Av. Conselheiro Rosa e Silva', '1340', 'Recife', 'PE', 'Brasil', 1), 
('56300-002', 'Av. da Colheita', '55', 'Petrolina', 'PE', 'Brasil', 2),
('55290-003', 'Rua dos Técnicos', '321', 'Garanhuns', 'PE', 'Brasil', 3), 
('56800-004', 'Av. Central do Agreste', '99', 'Arcoverde', 'PE', 'Brasil', 4), 
('56900-005', 'Rua do Sertão Produtivo', '110', 'Serra Talhada', 'PE', 'Brasil', 5), 
('55190-006', 'Rua da Pesquisa', '1', 'Santa Cruz do Capibaribe', 'PE', 'Brasil', 6), 
('56700-007', 'Av. Monte Castelo', '20', 'Pesqueira', 'PE', 'Brasil', 7), 
('56000-008', 'Rua Central de Salgueiro', '80', 'Salgueiro', 'PE', 'Brasil', 8), 
('55300-009', 'Av. do Sítio', '90', 'Bezerros', 'PE', 'Brasil', 9), 
('56600-010', 'Rua Pajeú Rural', '100', 'Afogados da Ingazeira', 'PE', 'Brasil', 10),
('56850-011', 'Av. Transertaneja', '11', 'Custódia', 'PE', 'Brasil', 11), 
('55200-012', 'Rua do Escritório', '12', 'Belo Jardim', 'PE', 'Brasil', 12), 
('56180-013', 'Rua das Fruteiras', '13', 'Cabrobó', 'PE', 'Brasil', 13), 
('55350-014', 'Av. Lajedo Central', '140', 'Lajedo', 'PE', 'Brasil', 14), 
('56470-015', 'Rua Velho Chico', '15', 'Petrolândia', 'PE', 'Brasil', 15), 
('56280-016', 'Rua de Ouricuri', '16', 'Ouricuri', 'PE', 'Brasil', 16), 
('55540-017', 'Av. Palmares Rural', '17', 'Palmares', 'PE', 'Brasil', 17), 
('55700-018', 'Rua da Fruticultura', '18', 'Limoeiro', 'PE', 'Brasil', 18), 
('55600-019', 'Rua do Apoio Logístico', '19', 'Vitória de Santo Antão', 'PE', 'Brasil', 19), 
('55000-020', 'Rua dos Agentes IPA', '10', 'Caruaru', 'PE', 'Brasil', 20);


-- 16. Tabela Acompanhamento técnico --
INSERT INTO AcompTecnico (idAcompTecnico, data_visita, condicao_plantio, observacoes, foto, Usuario_idUsuario) VALUES 
(1, '2023-03-15', 'Excelente', 'Plantio Milho Híbrido. Sem pragas.', 'antonio_1.jpg', 1),
(2, '2023-05-20', 'Boa', 'Controle biológico em dia. Feijão Carioca.', 'marcia_1.jpg', 2),
(3, '2023-07-10', 'Ótima', 'Qualidade da soja alta. Irrigação eficiente.', 'joao_1.jpg', 3),
(4, '2023-10-01', 'Regular', 'Sugerida correção do solo. Arroz.', 'lucia_1.jpg', 4),
(5, '2023-11-01', 'Excelente', 'Preparo do solo para Milho Varietal IPA-2.', 'ricardo_1.jpg', 5),
(6, '2023-11-15', 'Boa', 'Monitoramento preventivo de fungos. OK.', 'sandra_1.jpg', 6),
(7, '2024-01-20', 'Excelente', 'Colheita da Mandioca Semente. Ótimos resultados.', 'pedro_1.jpg', 7),
(8, '2024-03-01', 'Regular', 'Ajuste na adubação de cobertura. Sorgo.', 'camila_1.jpg', 8),
(9, '2024-05-10', 'Ótima', 'Plantio de Milho Pipoca IPA-3. Perfeito.', 'gustavo_1.jpg', 9),
(10, '2024-07-01', 'Boa', 'Uso de novos fertilizantes. Resultados positivos.', 'heloisa_1.jpg', 10),
(11, '2024-09-05', 'Excelente', 'Manejo de irrigação otimizado. Arroz Vermelho.', 'ivanildo_1.jpg', 11),
(12, '2024-11-01', 'Regular', 'Baixo desenvolvimento da cultura. Feijão Macassar.', 'jessica_1.jpg', 12),
(13, '2023-04-01', 'Ótima', 'Teste de solo Milho Doce aprovado.', 'kleber_1.jpg', 13),
(14, '2023-06-10', 'Excelente', 'Plantio de soja orgânica inicial.', 'lorena_1.jpg', 14),
(15, '2023-08-05', 'Boa', 'Monitoramento de seca no Agreste. Risco baixo.', 'miguel_1.jpg', 15),
(16, '2023-10-15', 'Regular', 'Necessidade de ajuste no PH do solo. Arroz Integral.', 'nicole_1.jpg', 16),
(17, '2024-03-10', 'Excelente', 'Colheita de Milheto IPA-5 bem sucedida.', 'paulo_1.jpg', 17),
(18, '2024-05-01', 'Boa', 'Uso de defensivos biológicos com sucesso. Girassol.', 'quiteria_1.jpg', 18),
(19, '2024-07-20', 'Ótima', 'Preparo para plantio de soja híbrida.', 'rafael_1.jpg', 19),
(20, '2024-09-10', 'Excelente', 'Início do ciclo de Feijão Fradinho.', 'sueli_1.jpg', 20);


-- 17. Tabela Movimentação da Saca --
INSERT INTO MovimentacaoSaca (idMovimentacaoSaca, data_hora, tipo_movimentacao, local_origem, local_destino, Usuario_idUsuario, Saca_idSaca, Transporte_idTransporte) VALUES 
(1, '2024-01-05 09:00:00', 'Saída', 'CD 1 - Recife', 1, 1, 1, 1),
(2, '2024-01-05 10:30:00', 'Entrada', 'CD 1 - Recife', 1, 2, 2, 1),
(3, '2024-01-10 14:00:00', 'Saída', 'CD 2 - Petrolina', 2, 3, 3, 2),
(4, '2024-01-10 16:30:00', 'Entrada', 'CD 2 - Petrolina', 2, 4, 4, 2),
(5, '2024-02-01 08:00:00', 'Saída', 'CD 3 - Garanhuns', 3, 5, 5, 3),
(6, '2024-02-01 11:00:00', 'Entrada', 'CD 3 - Garanhuns', 3, 6, 6, 3),
(7, '2024-03-15 13:00:00', 'Saída', 'CD 4 - Arcoverde', 4, 7, 7, 4),
(8, '2024-03-15 15:00:00', 'Entrada', 'CD 4 - Arcoverde', 4, 8, 8, 4),
(9, '2024-04-20 09:30:00', 'Saída', 'CD 5 - Serra Talhada', 5, 9, 9, 5),
(10, '2024-04-20 12:00:00', 'Entrada', 'CD 5 - Serra Talhada', 5, 10, 10, 5),
(11, '2024-05-01 11:00:00', 'Saída', 'CD 6 - Santa Cruz', 6, 11, 11, 6),
(12, '2024-05-01 14:00:00', 'Entrada', 'CD 6 - Santa Cruz', 6, 12, 12, 6),
(13, '2024-06-10 07:00:00', 'Saída', 'CD 7 - Pesqueira', 7, 13, 13, 7),
(14, '2024-06-10 09:00:00', 'Entrada', 'CD 7 - Pesqueira', 7, 14, 14, 7),
(15, '2024-07-05 10:00:00', 'Saída', 'CD 8 - Salgueiro', 8, 15, 15, 8),
(16, '2024-07-05 13:00:00', 'Entrada', 'CD 8 - Salgueiro', 8, 16, 16, 8),
(17, '2024-08-01 14:00:00', 'Saída', 'CD 9 - Bezerros', 9, 17, 17, 9),
(18, '2024-08-01 16:00:00', 'Entrada', 'CD 9 - Bezerros', 9, 18, 18, 9),
(19, '2024-09-15 08:30:00', 'Saída', 'CD 10 - Afogados', 10, 19, 19, 10),
(20, '2024-09-15 11:30:00', 'Entrada', 'CD 10 - Afogados', 10, 20, 20, 10);


-- 18. Tabela Notificação --
INSERT INTO Notificacao (idNotificacao, data_envio, mensagem, status, MovimentacaoSaca_idMovimentacaoSaca, Agricultor_idAgricultor, Saca_idSaca) VALUES 
(1, '2024-01-06', 'Semente de Milho Híbrido entregue no Escritório Recife.', 'Entregue', 2, 1, 1),
(2, '2024-01-06', 'Confirmação de recebimento da semente de Feijão Carioca.', 'Recebida', 4, 2, 2),
(3, '2024-01-11', 'Semente de Soja Convencional em trânsito para Garanhuns.', 'Em Trânsito', 6, 3, 3),
(4, '2024-01-11', 'Notificação de disponibilidade de Arroz Agulhinha.', 'Disponível', 8, 4, 4),
(5, '2024-02-02', 'Entrega de Milho Varietal IPA-2 confirmada. Assinado pelo Agricultor.', 'Entregue', 10, 5, 5),
(6, '2024-02-02', 'Aviso: Feijão Preto chegou ao seu Escritório Local.', 'Recebida', 12, 6, 6),
(7, '2024-03-16', 'Mandioca Semente pronta para retirada.', 'Disponível', 14, 7, 7),
(8, '2024-03-16', 'Status: Sorgo Granífero em fase de separação logística.', 'Em Separação', 16, 8, 8),
(9, '2024-04-21', 'Milho Pipoca IPA-3 entregue com sucesso.', 'Entregue', 18, 9, 9),
(10, '2024-04-21', 'Acompanhe a chegada da Soja Renda Alta no Escritório.', 'Em Trânsito', 20, 10, 10),
(11, '2024-05-02', 'Arroz Vermelho: Entrega finalizada.', 'Entregue', 1, 11, 11),
(12, '2024-05-02', 'Feijão Macassar disponível para Agricultor 12.', 'Disponível', 3, 12, 12),
(13, '2024-06-11', 'Milho Doce IPA-4: Saca recebida pelo Escritório Custódia.', 'Recebida', 5, 13, 13),
(14, '2024-06-11', 'Soja Orgânica: Previsão de entrega próxima semana.', 'Em Trânsito', 7, 14, 14),
(15, '2024-07-06', 'Feijão Vigna entregue.', 'Entregue', 9, 15, 15),
(16, '2024-07-06', 'Arroz Integral aguardando retirada.', 'Disponível', 11, 16, 16),
(17, '2024-08-02', 'Milheto IPA-5: Saca entregue na propriedade.', 'Entregue', 13, 17, 17),
(18, '2024-08-02', 'Girassol Semente: Confirmação de recebimento.', 'Recebida', 15, 18, 18),
(19, '2024-09-16', 'Soja Híbrida em viagem.', 'Em Trânsito', 17, 19, 19),
(20, '2024-09-16', 'Feijão Fradinho disponível no Escritório Afogados.', 'Disponível', 19, 20, 20);

-- 19. Tabela Testes Laboratoriais --
INSERT INTO TesteLaboratorial (data_teste, resultado, Lote_idLote) VALUES
('2023-02-20', 'Aprovado', 1),
('2023-02-22', 'Aprovado', 1),
('2023-03-01', 'Reprovado', 2),
('2023-03-05', 'Aprovado', 2),
('2023-05-03', 'Aprovado', 3),
('2023-05-05', 'Reprovado', 3),
('2023-06-16', 'Aprovado', 4),
('2023-06-18', 'Aprovado', 4),
('2023-08-22', 'Reprovado', 5),
('2023-08-23', 'Aprovado', 5),
('2023-11-12', 'Aprovado', 6),
('2023-11-14', 'Reprovado', 6),
('2023-11-16', 'Aprovado', 7),
('2023-11-18', 'Reprovado', 7),
('2024-01-10', 'Aprovado', 8),
('2024-01-12', 'Reprovado', 8),
('2024-03-12', 'Aprovado', 9),
('2024-03-15', 'Aprovado', 9),
('2024-05-27', 'Aprovado', 10),
('2024-05-29', 'Reprovado', 10);
