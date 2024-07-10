drop database aurora;
create database Aurora;
use aurora;

CREATE TABLE vendas (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente BIGINT UNSIGNED NOT NULL,
    data_venda VARCHAR(255) NOT NULL,
    total DECIMAL(8, 2) NOT NULL,
    D_E_L_E_T_ VARCHAR(255) NOT NULL
);

CREATE TABLE produtos (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    categoria VARCHAR(255) NOT NULL,
    marcas VARCHAR(255) NOT NULL,
    D_E_L_E_T_ VARCHAR(255) NOT NULL
);

CREATE TABLE venda_produtos (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_venda BIGINT UNSIGNED NOT NULL,
    id_produto BIGINT UNSIGNED NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(8, 2) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES vendas(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

CREATE TABLE empresas (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefone VARCHAR(255) NOT NULL,
    senha BIGINT NOT NULL
);

CREATE TABLE estoque (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_produto BIGINT UNSIGNED NOT NULL,
    data_validade VARCHAR(255) NOT NULL,
    quantidade BIGINT NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

CREATE TABLE clientes (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    sexo VARCHAR(255) NOT NULL,
    data_nascimento VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    D_E_L_E_T_ VARCHAR(255) NOT NULL
);

CREATE TABLE precos_compra (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_produto BIGINT UNSIGNED NOT NULL,
    preco DECIMAL(8, 2) NOT NULL,
    data_inicio VARCHAR(255) NOT NULL,
    data_fim VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

CREATE TABLE precos_venda (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_produto BIGINT UNSIGNED NOT NULL,
    preco DECIMAL(8, 2) NOT NULL,
    data_inicio VARCHAR(255) NOT NULL,
    data_fim VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

CREATE TABLE telefones (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente BIGINT UNSIGNED NOT NULL,
    numero VARCHAR(255) NOT NULL,
    id_empresa BIGINT UNSIGNED NOT NULL,
    D_E_L_E_T_ VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_empresa) REFERENCES empresas(id)
);



ALTER TABLE venda_produtos
ADD CONSTRAINT fk_venda_produtos_id_venda
FOREIGN KEY (id_venda) REFERENCES vendas (id);

ALTER TABLE venda_produtos
ADD CONSTRAINT fk_venda_produtos_id_produto
FOREIGN KEY (id_produto) REFERENCES produtos (id);

ALTER TABLE precos_compra
ADD CONSTRAINT fk_precos_compra_id_produto
FOREIGN KEY (id_produto) REFERENCES produtos (id);

ALTER TABLE precos_venda
ADD CONSTRAINT fk_precos_venda_id_produto
FOREIGN KEY (id_produto) REFERENCES produtos (id);

ALTER TABLE telefones
ADD CONSTRAINT fk_telefones_id_empresa
FOREIGN KEY (id_empresa) REFERENCES empresas (id);

ALTER TABLE telefones
ADD CONSTRAINT fk_telefones_id_cliente
FOREIGN KEY (id_cliente) REFERENCES clientes (id);

ALTER TABLE vendas
ADD CONSTRAINT fk_vendas_id_cliente
FOREIGN KEY (id_cliente) REFERENCES clientes (id);

ALTER TABLE estoque
ADD CONSTRAINT fk_estoque_id_produto
FOREIGN KEY (id_produto) REFERENCES produtos (id);