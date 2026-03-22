CREATE DATABASE db_adocaogatos

USE db_adocaogatos

CREATE TABLE Gatos (
    id_gato INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(55) NOT NULL,
    data_nasc DATE,
    raca VARCHAR(50) DEFAULT 'SRD',
    vacinacao TEXT, 
    sexo ENUM('Macho', 'Fêmea') NOT NULL,
    disponibilidade BOOLEAN DEFAULT TRUE, 
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id_gato),
);



CREATE table Adotantes (
DROP TABLE IF EXISTS Adotantes;

USE db_adocaogatos


CREATE TABLE Adotantes (
    id_adotante INT NOT NULL AUTO_INCREMENT,
    nome_completo VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    rg VARCHAR(20) NOT NULL,
    cpf CHAR(11) NOT NULL, 
    endereco_completo TEXT NOT NULL,
    celular VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_adotante),
    UNIQUE (cpf),
    UNIQUE (email)
    )
    ENGINE=InnoDB;
    
    Alter table Adotantes
    ADD CONSTRAINT chk_maioridade 
CHECK (DATEDIFF(CURRENT_DATE, data_nascimento) / 365.25 >= 18);


CREATE TABLE Adocoes (
    id_adocao INT NOT NULL AUTO_INCREMENT,
    id_gato INT NOT NULL,
    id_adotante INT NOT NULL,
    data_adocao DATETIME DEFAULT CURRENT_TIMESTAMP,
    observacoes TEXT,
    
    PRIMARY KEY (id_adocao),
    
    CONSTRAINT fk_gato_adocao 
        FOREIGN KEY (id_gato) 
        REFERENCES Gatos(id_gato)
        ON DELETE CASCADE,
        
    -- Criando o vínculo com a tabela Adotantes
    CONSTRAINT fk_adotante_adocao 
        FOREIGN KEY (id_adotante) 
        REFERENCES Adotantes(id_adotante)
        ON DELETE CASCADE
) ENGINE=InnoDB;

ALTER TABLE Adocoes 
ADD COLUMN data_inicio DATE,
ADD COLUMN data_fim DATE,
ADD COLUMN tipo_adocao ENUM('Definitiva', 'Temporária') DEFAULT 'Definitiva';