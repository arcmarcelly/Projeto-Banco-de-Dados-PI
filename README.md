# Projeto de Banco de Dados – Programa de Aquisição e Distribuição de Sementes (IPA)

Este projeto faz parte dos requisitos finais da unidade curricular **Banco de Dados II**, ministrada pelo **Prof. Danilo Farias Soares da Silva**, no curso de **Análise e Desenvolvimento de Sistemas do Centro Universitário SENAC**.

O trabalho integra o **Projeto Integrador**, cujo objetivo é desenvolver uma solução tecnológica para apoiar o **Programa de Aquisição e Distribuição de Sementes do IPA**, contemplando todo o fluxo operacional: aquisição, testes laboratoriais, armazenamento, rastreabilidade por QR Code, distribuição e acompanhamento técnico.

---

# 1. Minimundo 

O Instituto Agronômico de Pernambuco (IPA) realiza anualmente um programa de aquisição, armazenamento e distribuição de sementes certificadas para agricultores familiares. Para garantir transparência, rastreabilidade e controle logístico, foi necessário desenvolver um **sistema de banco de dados** capaz de registrar e acompanhar todas as etapas do processo.

A seguir, o minimundo detalhado:

---

## 🌱 **Aquisição das Sementes**

* O IPA realiza **licitações** para adquirir sementes provenientes de diversos fornecedores.
* Cada fornecedor pode participar de várias licitações, mas cada licitação tem obrigatoriamente fornecedores vinculados.
* Os fornecedores possuem dados cadastrais e endereços registrados.

---

## 📦 **Recebimento e Armazenamento dos Lotes**

* Após a aquisição, os fornecedores entregam as sementes em forma de **lotes**.

* Cada lote possui:

  * tipo de semente
  * quantidade em kg
  * data de recebimento
  * centro de distribuição responsável

* Os Centros de Distribuição (CDs) armazenam os lotes e possuem endereços próprios.

---

## 🔬 **Testes Laboratoriais**

* Cada lote precisa passar por **testes laboratoriais**.

* O teste apresenta:

  * data da análise
  * resultado (Aprovado/Reprovado)

* Um lote pode ter vários testes realizados, mas cada teste pertence a um único lote.

---

## 🧺 **Fracionamento de Lotes em Sacas**

* Após aprovados, os lotes são fracionados em **sacas** individuais.

* Cada saca recebe:

  * QR Code único
  * peso
  * status
  * data de fracionamento

* Sacas podem ser armazenadas temporariamente em escritórios locais do IPA.

---

## 🚚 **Movimentação e Transporte**

* Toda movimentação de saca é registrada:

  * data e hora
  * tipo de movimentação (entrada/saída)
  * origem e destino
  * usuário responsável
  * transporte utilizado

* Transportes possuem:

  * placa
  * nome do motorista
  * datas de saída e chegada

Essa rastreabilidade permite identificar o **tempo de transporte** entre CDs, escritórios e agricultores.

---

## 👨‍🌾 **Distribuição aos Agricultores**

* O agricultor pertence a uma **associação**.

* Sacas são distribuídas diretamente aos agricultores e suas informações ficam registradas.

* Cada agricultor recebe notificações vinculadas ao processo de distribuição (ex.: retirada disponível, atrasos, avisos de vistoria, etc.).

---

## 🧑‍🌾 **Acompanhamento Técnico nas Propriedades**

* Técnicos do IPA visitam agricultores para:

  * avaliar condição de plantio
  * observar uso correto das sementes
  * registrar observações e fotos

* Cada visita fica registrada e é associada ao técnico e ao agricultor.

---

## 🔐 **Usuário do Sistema**

Usuários do sistema podem ser:

* Administrador
* Técnico
* Associação

O usuário é responsável por:

* Cadastro de agricultores
* Registro de recebimentos
* Movimentações
* Testes laboratoriais
* Notificações
* Distribuição das sacas

---

# 2. Modelo Conceitual (MER)
<img width="1395" height="851" alt="Image" src="https://github.com/user-attachments/assets/43a40018-bfd6-4a66-b062-49bb6d64588d" />

O MER representa:

* Entidades essenciais do programa (Fornecedor, Lote, Saca, Agricultor, Associação, Teste Laboratorial, Movimentação, Notificação, Transporte etc.)
* Suas propriedades
* Relacionamentos, como:

  * Fornecedor *fornece* Lote
  * Lote *é fracionado em* Saca
  * Saca *é movimentada por* MovimentacaoSaca
  * Acompanhamento Técnico *é realizado por* Usuário
  * Agricultor *pertence a* Associação
  * Notificação *é enviada para* Agricultor

O MER ajuda a compreender o domínio do sistema e fundamenta a criação do modelo lógico.

---

# 3. Modelo Lógico Relacional (MR)
<img width="1658" height="758" alt="Image" src="https://github.com/user-attachments/assets/1d3c9642-eb48-43f9-8d12-3f247d3b484a" />

O MR traduz o MER em:

* Estruturas de tabelas
* Tipos de dados
* Chaves primárias e estrangeiras
* Restrições de integridade
* Relacionamentos 1:N e N:N por meio de FKs

Este modelo é utilizado como base para o script SQL (DDL) que cria o banco de dados final.

---

# Desenvolvedores

* **Carolline Ferreira**
* **Jai Santos**
* **Maria Clara Moutinho**
* **Marcelly Arcanjo**

