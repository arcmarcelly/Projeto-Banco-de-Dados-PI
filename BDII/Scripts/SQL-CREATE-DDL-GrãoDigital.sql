-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Licitacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Licitacao` (
  `idLicitacao` INT NOT NULL AUTO_INCREMENT,
  `numero_processo` INT NOT NULL,
  `data_abertura` DATE NOT NULL,
  `data_fechamento` DATE NOT NULL,
  PRIMARY KEY (`idLicitacao`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `CNPJ` VARCHAR(18) NOT NULL,
  `nome_fornecedor` VARCHAR(120) NOT NULL,
  `Licitacao_idLicitacao` INT NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  INDEX `idx_Fornecedor_Licitacao` (`Licitacao_idLicitacao`),
  CONSTRAINT `fk_Fornecedor_Licitacao`
    FOREIGN KEY (`Licitacao_idLicitacao`)
    REFERENCES `mydb`.`Licitacao` (`idLicitacao`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor_Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor_Endereco` (
  `idEnderecoFornecedor` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(9) NOT NULL,
  `rua` VARCHAR(150) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `cidade` VARCHAR(120) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `pais` VARCHAR(50) NOT NULL,
  `Fornecedor_idFornecedor` INT NOT NULL,
  PRIMARY KEY (`idEnderecoFornecedor`),
  INDEX `idx_FornecedorEndereco_Fornecedor` (`Fornecedor_idFornecedor`),
  CONSTRAINT `fk_Fornecedor_Endereco_Fornecedor`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `mydb`.`Fornecedor` (`idFornecedor`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`CentroDistribuicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CentroDistribuicao` (
  `idCentroDistribuicao` INT NOT NULL AUTO_INCREMENT,
  `nome_centroDistribuicao` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`idCentroDistribuicao`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Lote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lote` (
  `idLote` INT NOT NULL AUTO_INCREMENT,
  `tipo_semente` VARCHAR(45) NOT NULL,
  `data_recebimento` DATE NOT NULL,
  `qtd_kg` DECIMAL(10,2) NOT NULL,
  `Fornecedor_idFornecedor` INT NULL,
  `CentroDistribuicao_idCentroDistribuicao` INT NULL,
  PRIMARY KEY (`idLote`),
  INDEX `idx_Lote_Fornecedor` (`Fornecedor_idFornecedor`),
  INDEX `idx_Lote_CentroDistribuicao` (`CentroDistribuicao_idCentroDistribuicao`),
  CONSTRAINT `fk_Lote_Fornecedor`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `mydb`.`Fornecedor` (`idFornecedor`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Lote_CentroDistribuicao`
    FOREIGN KEY (`CentroDistribuicao_idCentroDistribuicao`)
    REFERENCES `mydb`.`CentroDistribuicao` (`idCentroDistribuicao`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`TesteLaboratorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TesteLaboratorial` (
  `idTesteLaboratorial` INT NOT NULL AUTO_INCREMENT,
  `data_teste` DATE NOT NULL,
  `resultado` VARCHAR(45) NOT NULL,
  `Lote_idLote` INT NOT NULL,
  PRIMARY KEY (`idTesteLaboratorial`),
  INDEX `idx_TesteLaboratorial_Lote` (`Lote_idLote`),
  CONSTRAINT `fk_TesteLaboratorial_Lote`
    FOREIGN KEY (`Lote_idLote`)
    REFERENCES `mydb`.`Lote` (`idLote`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Saca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Saca` (
  `idSaca` INT NOT NULL AUTO_INCREMENT,
  `peso_kg` DECIMAL(10,2) NOT NULL,
  `data_fracionamento` DATE NOT NULL,
  `qr_code` VARCHAR(45) NOT NULL,
  `status` ENUM ('No Centro', 'Em Transito', 'No Escritorio', 'Na Associacao', 'Retirada'),
  `Lote_idLote` INT NULL,
  PRIMARY KEY (`idSaca`),
  INDEX `idx_Saca_Lote` (`Lote_idLote`),
  CONSTRAINT `fk_Saca_Lote`
    FOREIGN KEY (`Lote_idLote`)
    REFERENCES `mydb`.`Lote` (`idLote`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`EscritorioLocal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EscritorioLocal` (
  `idEscritorioLocal` INT NOT NULL AUTO_INCREMENT,
  `nome_escritorio` VARCHAR(120) NOT NULL,
  `Saca_idSaca` INT NOT NULL,
  PRIMARY KEY (`idEscritorioLocal`),
  INDEX `idx_EscritorioLocal_Saca` (`Saca_idSaca`),
  CONSTRAINT `fk_EscritorioLocal_Saca`
    FOREIGN KEY (`Saca_idSaca`)
    REFERENCES `mydb`.`Saca` (`idSaca`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`EscritorioLocal_Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EscritorioLocal_Endereco` (
  `idEnderecoEscritorio` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(9) NOT NULL,
  `rua` VARCHAR(150) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `cidade` VARCHAR(120) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `pais` VARCHAR(50) NOT NULL,
  `EscritorioLocal_idEscritorioLocal` INT NOT NULL,
  PRIMARY KEY (`idEnderecoEscritorio`),
  INDEX `idx_EscritorioLocalEndereco_Escritorio` (`EscritorioLocal_idEscritorioLocal`),
  CONSTRAINT `fk_EscritorioLocal_Endereco_EscritorioLocal`
    FOREIGN KEY (`EscritorioLocal_idEscritorioLocal`)
    REFERENCES `mydb`.`EscritorioLocal` (`idEscritorioLocal`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Transporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Transporte` (
  `idTransporte` INT NOT NULL AUTO_INCREMENT,
  `placa_veiculo` VARCHAR(10) NOT NULL,
  `data_chegada` DATETIME NOT NULL,
  `data_saida` DATETIME NOT NULL,
  PRIMARY KEY (`idTransporte`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(120) NOT NULL,
  `email` VARCHAR(120) NOT NULL,
  `senha` VARCHAR(255) NOT NULL, -- aumentei tamanho por segurança (hash)
  `tipo_usuario` ENUM('Administrativo', 'Técnico', 'Associação') NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Associacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Associacao` (
  `idAssociacao` INT NOT NULL AUTO_INCREMENT,
  `nome_associacao` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`idAssociacao`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Agricultor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Agricultor` (
  `idAgricultor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(120) NOT NULL,
  `CPF` VARCHAR(14) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `Usuario_idUsuario` INT NULL,
  `Associacao_idAssociacao` INT NULL,
  PRIMARY KEY (`idAgricultor`),
  INDEX `idx_Agricultor_Usuario` (`Usuario_idUsuario`),
  INDEX `idx_Agricultor_Associacao` (`Associacao_idAssociacao`),
  CONSTRAINT `fk_Agricultor_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Agricultor_Associacao`
    FOREIGN KEY (`Associacao_idAssociacao`)
    REFERENCES `mydb`.`Associacao` (`idAssociacao`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Agricultor_Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Agricultor_Endereco` (
  `idEnderecoAgricultor` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(9) NOT NULL,
  `rua` VARCHAR(150) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `cidade` VARCHAR(120) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `pais` VARCHAR(50) NOT NULL,
  `Agricultor_idAgricultor` INT NOT NULL,
  PRIMARY KEY (`idEnderecoAgricultor`),
  INDEX `idx_AgricultorEndereco_Agricultor` (`Agricultor_idAgricultor`),
  CONSTRAINT `fk_Agricultor_Endereco_Agricultor`
    FOREIGN KEY (`Agricultor_idAgricultor`)
    REFERENCES `mydb`.`Agricultor` (`idAgricultor`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`AcompTecnico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AcompTecnico` (
  `idAcompTecnico` INT NOT NULL AUTO_INCREMENT,
  `data_visita` DATE NOT NULL,
  `condicao_plantio` VARCHAR(45) NOT NULL,
  `observacoes` VARCHAR(200) NULL,
  `foto` VARCHAR(255) NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idAcompTecnico`),
  INDEX `idx_AcompTecnico_Usuario` (`Usuario_idUsuario`),
  CONSTRAINT `fk_AcompTecnico_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Associacao_Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Associacao_Endereco` (
  `idEnderecoAssociacao` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(9) NOT NULL,
  `rua` VARCHAR(150) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `cidade` VARCHAR(120) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `pais` VARCHAR(50) NOT NULL,
  `Associacao_idAssociacao` INT NOT NULL,
  PRIMARY KEY (`idEnderecoAssociacao`),
  INDEX `idx_AssociacaoEndereco_Associacao` (`Associacao_idAssociacao`),
  CONSTRAINT `fk_Associacao_Endereco_Associacao`
    FOREIGN KEY (`Associacao_idAssociacao`)
    REFERENCES `mydb`.`Associacao` (`idAssociacao`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`MovimentacaoSaca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MovimentacaoSaca` (
  `idMovimentacaoSaca` INT NOT NULL AUTO_INCREMENT,
  `data_hora` DATETIME NOT NULL,
  `tipo_movimentacao` ENUM ('Entrada', 'Saída'),
  `local_origem` VARCHAR(45) NOT NULL,
  `local_destino` VARCHAR(45) NOT NULL,
  `Usuario_idUsuario` INT  NULL,
  `Saca_idSaca` INT  NULL,
  `Transporte_idTransporte` INT NULL,
  PRIMARY KEY (`idMovimentacaoSaca`),
  INDEX `idx_MovimentacaoSaca_Usuario` (`Usuario_idUsuario`),
  INDEX `idx_MovimentacaoSaca_Saca` (`Saca_idSaca`),
  INDEX `idx_MovimentacaoSaca_Transporte` (`Transporte_idTransporte`),
  CONSTRAINT `fk_MovimentacaoSaca_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_MovimentacaoSaca_Saca`
    FOREIGN KEY (`Saca_idSaca`)
    REFERENCES `mydb`.`Saca` (`idSaca`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_MovimentacaoSaca_Transporte`
    FOREIGN KEY (`Transporte_idTransporte`)
    REFERENCES `mydb`.`Transporte` (`idTransporte`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Notificacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Notificacao` (
  `idNotificacao` INT NOT NULL AUTO_INCREMENT,
  `data_envio` DATE NOT NULL,
  `mensagem` VARCHAR(200) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `MovimentacaoSaca_idMovimentacaoSaca` INT NULL,
  `Agricultor_idAgricultor` INT NULL,
  `Saca_idSaca` INT NULL,
  PRIMARY KEY (`idNotificacao`),
  INDEX `idx_Notificacao_MovimentacaoSaca` (`MovimentacaoSaca_idMovimentacaoSaca`),
  INDEX `idx_Notificacao_Agricultor` (`Agricultor_idAgricultor`),
  INDEX `idx_Notificacao_Saca` (`Saca_idSaca`),
  CONSTRAINT `fk_Notificacao_MovimentacaoSaca`
    FOREIGN KEY (`MovimentacaoSaca_idMovimentacaoSaca`)
    REFERENCES `mydb`.`MovimentacaoSaca` (`idMovimentacaoSaca`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Notificacao_Agricultor`
    FOREIGN KEY (`Agricultor_idAgricultor`)
    REFERENCES `mydb`.`Agricultor` (`idAgricultor`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Notificacao_Saca`
    FOREIGN KEY (`Saca_idSaca`)
    REFERENCES `mydb`.`Saca` (`idSaca`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`CentroDistribuicao_Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CentroDistribuicao_Endereco` (
  `idEnderecoCentro` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(9) NOT NULL,
  `rua` VARCHAR(150) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `cidade` VARCHAR(120) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `pais` VARCHAR(50) NOT NULL,
  `CentroDistribuicao_idCentroDistribuicao` INT NOT NULL,
  PRIMARY KEY (`idEnderecoCentro`),
  INDEX `idx_CentroDistribuicaoEndereco_Centro` (`CentroDistribuicao_idCentroDistribuicao`),
  CONSTRAINT `fk_CentroDistribuicao_Endereco_CentroDistribuicao`
    FOREIGN KEY (`CentroDistribuicao_idCentroDistribuicao`)
    REFERENCES `mydb`.`CentroDistribuicao` (`idCentroDistribuicao`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Restore modes
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
