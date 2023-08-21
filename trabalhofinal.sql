CREATE DATABASE IF NOT EXISTS db_banco
COLLATE utf8mb4_general_ci
CHARSET utf8mb4;

USE db_banco;


CREATE TABLE IF NOT EXISTS  tb_endereco (
    id INTEGER PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
    cep CHAR(8) NOT NULL,
    numero_residencia CHAR(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS Cliente_juridico (
    id INTEGER PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
    nome_fantasia VARCHAR(255) NOT NULL,
    razao_social VARCHAR(255) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    email VARCHAR(255) NOT NULL,
    status BOOL DEFAULT 1,
    id_endereco INT NOT NULL,
     CONSTRAINT fk_id_endereco1 FOREIGN KEY (id_endereco) REFERENCES tb_endereco(id)
);


CREATE TABLE IF NOT EXISTS  Cliente_fisico (
    id INTEGER PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    dt_nascimento DATE NOT NULL,
    cpf CHAR(14) NOT NULL,
    filiacao VARCHAR(255) NOT NULL,
    status BOOL DEFAULT 1,
    id_endereco INT NOT NULL,
    CONSTRAINT fk_id_endereco FOREIGN KEY (id_endereco) REFERENCES tb_endereco(id)
);


CREATE TABLE IF NOT EXISTS  tb_telefone (
    id INTEGER PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
    ddd CHAR(3) NOT NULL,
    numero CHAR(11)
);

CREATE TABLE IF NOT EXISTS  tb_conta (
    id INTEGER PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
    numero CHAR(20) NOT NULL,
    agencia CHAR(9) NOT NULL,
    saldo VARCHAR(255) NOT NULL,
    status CHAR(9) NOT NULL
);

CREATE TABLE IF NOT EXISTS  Tipo_transacao (
    id INTEGER PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
    
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS  Tipo_conta (
    id INTEGER PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS  Tipo_telefone (
    id INTEGER PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS  tb_transacao (
    id INTEGER PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
    conta_saida VARCHAR(255) NOT NULL,
    conta_destino VARCHAR(255) NOT NULL,
    valor VARCHAR(255) NOT NULL,
	id_tipo_transacao VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS  cliente_telefone (
    id INTEGER PRIMARY KEY AUTO_INCREMENT PRIMARY KEY
);
 
ALTER TABLE Cliente_fisico ADD CONSTRAINT FK_Cliente_fisico_2
    FOREIGN KEY (id)
    REFERENCES Endereco (id);
 
ALTER TABLE Tipo_Telefone ADD CONSTRAINT FK_Tipo_Telefone_2
    FOREIGN KEY (id)
    REFERENCES Telefone (id);
    
    SELECT * FROM Cliente_fisico;
    INSERT INTO  Cliente_fisico
    ( id,nome,sobrenome,email,dt_nascimento,cpf,filiacao,status,id_endereco)
    VALUES
   ("1","Fitzgerald","Vaughan","proin.sed@google.couk","01/07/1990","089.683.780-70","Walker Morrison",0,2),
  ("2","Jakeem","Rodgers","mauris.sapien@yahoo.edu","02/09/1997","437.330.100-00","Gregory Duncan",1,3),
  ("3","Victor","Horton","mauris.a@hotmail.org","12/07/1992","892.867.110-85","Alfreda Hoover",1,4),
  ("4","Bryar", "Hill","malesuada.fames@outlook.e du","03/08/1985","891.147.960-82","Rhona Castaneda",1,5),
  ("5","Nicholas", "Ward","justo.sit.amet@protonmail.org","01/07/1990","891.147.960-85","Frances Rhodes",1,8),
  ("6","Emma Nielsen","eu.enim.etiam@outlook.org","14/02/1960","027.492.590-70","Sharon French",1,1),
  ("7","Isaac Hubbard","nostra.per@icloud.net","12/02/1980","626.577.510-32","Mechelle Mccoy",1,7),
  ("8","Joshua Bates","lorem.sit.amet@outlook.couk","23/05/1995","492.988.630-98","Brenda Cooke",1,1),
  ("9","Amaya Massey","aliquam.tincidunt@icloud.ca","04/04/2001","417.008.250-89","Eaton James",1,6),
  ("10","Ivy Downs","ut.mi@icloud.couk","07/06/1970","266.698.290-43","Chancellor Herring",1,14);
  
   INSERT INTO  Cliente_juridico
    ( id,nome_fantasia,razao_social,cnpj,email)
    VALUES
    (11,"Mc Donalds","Arcos Dourados Comércio de Alimentos Ltda","07.776.127/0001-46","otmane4917@uorak.com"),
    (12,"estadia sonhar", "recanto dos sonhos tursmo Ltda","93.868.552/0001-05","mokhtar2413@uorak.com"),
    (13,"xerox home","a casa do xerox Ltda","90.542.626/0001-12","vanilda8812@uorak.com"),
    (14,"brainstorm filmes","brain multimidia Ltda","52.083.842/0001-58","lillia6542@uorak.com"),
    (15,"sal","sal comercios e resutarurantes Ltda","04.363.021/0001-22","ellan546@uorak.com"),
    (16,"pão dourado","Dourado´s panificadora Ltda","34.185.522/0001-27","karlheinz2051@uorak.com"),
    (17,"Chevrolet","General Motors do Brasil S.A","91.116.289/0001-64","argimira8653@uorak.com"),
    (18,"TV Globo","Globo Comunicação e Participações S/A ","21.807.309/0001-68","mecedes9339@uorak.com"),
    (19,"Natura","Natura Cosméticos S.A","38.847.107/0001-42","tommaso9477@uorak.com"),
    (20,"O Boticário","Botica Comercial Farmaceutica LTDA","20.121.839/0001-95","elfrieda5740@uorak.com");
    
    SELECT * FROM  tb_endereco;
    
	INSERT INTO  tb_endereco
    (id,cep,numero_residencia)
    VALUES
    ("1","94155-416",12),
    ("2","79840-020",05),
    ("3","84030-360",25),
    ("4","24210-327",22),
    ("5","79112-340",13),
    ("6","29141-747",07),
    ("7","82130-250",65),
    ("8","60761-215",33),
    ("9","76871-034",08),
    ("10","68903-785",77);
    
    
	INSERT INTO tb_telefone
    (id,ddd,numero)
    VALUES
    (1,"82","3174-5186"),
    (2,"64","2106-3847"),
    (3,"62","2630-0658"),
    (4,"66","2538-8885"),
    (5,"28","2981-4401"),
    (6,"82","3880-3758"),
    (7,"85","2412-3564"),
    (8,"68","3237-6645"),
    (9,"92","3833-7626"),
    (10,"89","3347-2634"),
    (11,"86","3277-3522"),
    (12,"49","2676-8861"),
    (13,"81","2537-1632"),
    (14,"95","3855-5382"),
    (15,"81","3550-4261"),
    (16,"84","3263-1217"),
    (16,"22","3397-1381"),
    (17,"68","3142-4166"),
    (18,"68","2551-3384"),
    (19,"88","2026-8526"),
    (20,"67","3255-5914");
    
    INSERT INTO tb_conta 
    (id,numero,agencia,saldo)
    VALUES
    (1,"69474-4","5406","20.000"),
    (2,"50852521-7","2175","17.000"),
    (4,"1292541-1","0328","07.00"),
    (5,"0470402-9","5762","10.000"),
    (6,"1313387-5","3069","70.000.000"),
    (7,"167539-7","4541","76.777.007"),
    (8,"40129-3","0501","05.00"),
    (9,"42591-4","0294","05.00"),
    (10,"08040-3","3835","17.000"),
    (11,"05924-8","8787","00.00"),
    (12,"1188464-9","6605","70.07"),
    (13,"1528868-P","6652","00.00"),
    (14,"05756-8","6514","76.767.070"),
    (15,"43061963-9","0010","00.00"),
    (16,"0989431-4","0314","00.00"),
    (17,"46233223-2","0964","07.700.00"),
    (18,"0642898-3","1399","58.00"),
    (19,"45140-4","6160","00.00"),
    (20,"1869768-8","0088","55.000.00");
    
	INSERT INTO Tipo_transacao
    (id,descricao)
    VALUES
    (1,"transferencia bancaria"),
    (2,"pix"),
    (3,"boleto"),
    (4,"credito"),
    (5,"debito"),
    (6,"doc");
    
    INSERT INTO Tipo_conta
    (id,descricao)
    VALUES
    (1,"Conta de pagamento"),
    (2,"Conta corrente"),
    (3,"Conta poupança"),
    (4,"Conta salário"),
    (5,"Conta universitária"),
    (6,"Internet banking"),
    (7,"Conta digital");
    
	INSERT INTO Tipo_telefone
    (id,descricao)
    VALUES
    (1,"fixo residencial"),
    (2,"movel pessoa fisica"),
    (3,"fixo empresarial"),
    (4,"movel pessoa juridica");
    
    INSERT INTO tb_transacao
	(id,conta_saida,conta_destino,valor)
    VALUES
    (2,"50852521-7","167539-7","70.00.00"),
    (6,"1313387-5","177777-7","76.00.00"),
    (7,"167539-7","05756-8","70.00.00.00");
    
   CREATE FUNCTION fn_remove_acento(texto VARCHAR (255))
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
SET texto = REPLACE(texto,'á', 'a'),
texto = REPLACE(texto,'Á', 'a'),
texto = REPLACE(texto,'à', 'a'),
texto = REPLACE(texto,'À', 'a'),
texto = REPLACE(texto,'ã', 'a'),
texto = REPLACE(texto,'Ã', 'a'),
texto = REPLACE(texto,'ä', 'a'),
texto = REPLACE(texto,'Ä', 'a'),
texto = REPLACE(texto,'â', 'a'),
texto = REPLACE(texto,'Â', 'a'),
texto = REPLACE(texto,'É', 'e'),
texto = REPLACE(texto,'È', 'e'),
texto = REPLACE(texto,'Ë', 'e'),
texto = REPLACE(texto,'Ê', 'e'),
texto = REPLACE(texto,'é', 'e'),
texto = REPLACE(texto,'è', 'e'),
texto = REPLACE(texto,'ë', 'e'),
texto = REPLACE(texto,'Ì', 'i'),
    texto = REPLACE(texto,'Í', 'i'),
    texto = REPLACE(texto,'Î', 'i'),
texto = REPLACE(texto,'Ï', 'i'),
texto = REPLACE(texto,'ì', 'i'),
texto = REPLACE(texto,'í', 'i'),    
texto = REPLACE(texto,'ï', 'i'),
    texto = REPLACE(texto,'î', 'i'),
texto = REPLACE(texto,'Ò', 'o'),
    texto = REPLACE(texto,'Ó', 'o'),
    texto = REPLACE(texto,'Ô', 'o'),
    texto = REPLACE(texto,'Õ', 'o'),
    texto = REPLACE(texto,'Ö', 'o'),
    texto = REPLACE(texto,'ò', 'o'),
    texto = REPLACE(texto,'ó', 'o'),
    texto = REPLACE(texto,'ô', 'o'),
    texto = REPLACE(texto,'õ', 'o'),
    texto = REPLACE(texto,'ö', 'o'),
    texto = REPLACE(texto,'Ù', 'u'),
    texto = REPLACE(texto,'Ú', 'u'),
    texto = REPLACE(texto,'Û', 'u'),
    texto = REPLACE(texto,'Ü', 'u'),
    texto = REPLACE(texto,'ù', 'u'),
texto = REPLACE(texto,'ú', 'u'),
    texto = REPLACE(texto,'û', 'u'),
    texto = REPLACE(texto,'ü', 'u'),
    texto = REPLACE(texto,'Ý', 'y'),
    texto = REPLACE(texto,'ý', 'y'),
    texto = REPLACE(texto,'ÿ', 'y');
RETURN texto;
END //
DELIMITER ;

	DELIMITER //
    CREATE TRIGGER tr_transacao
    AFTER INSERT
    ON tb_transacao
    FOR EACH ROW
    BEGIN
DECLARE conta_saida INT;
    DECLARE conta_destino INT;
    
    -- Obtém os IDs das contas envolvidas na transação
    SELECT id_conta INTO conta_saida FROM tb_conta WHERE numero = NEW.conta_saida;
    SELECT id_conta INTO conta_destino FROM tb_conta WHERE numero = NEW.conta_destino;
    
     -- Atualiza os saldos das contas
    UPDATE tb_conta SET saldo = saldo - NEW.valor WHERE id_conta = conta_saida;
    UPDATE tb_conta SET saldo = saldo + NEW.valor WHERE id_conta = conta_destino;
    
   -- Registra as transações nas contas
    INSERT INTO tb_transferencia (conta_saida, conta_destino, valor, id_tipo)
    VALUES (NEW.conta_destino, NEW.conta_saida, NEW.valor, NEW.id_tipo);
    
    END //
    
    DELIMITER ;


-- procedimento para bloquear contas do tipo poupança em contas juridicas
	DELIMITER //
    CREATE PROCEDURE sp_juridico_corrente (id_tipo_conta INT)
    
    BEGIN
    
   IF (id_tipo_conta) = 3 THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'tipo de conta invalida';
   
   END IF
   
   DELIMITER ;

    
  
   SELECT @saldo_medio;

DELIMITER //
CREATE PROCEDURE calcular_saldo_medio_cliente(IN client_id INT)
BEGIN
    DECLARE total_saldo DECIMAL(20, 2);
    DECLARE total_contas INT;

    SELECT SUM(CAST(REPLACE(saldo, 'R$', '') AS DECIMAL(20, 2))) INTO total_saldo
    FROM tb_conta
    WHERE status = 'ativo' AND (id_cliente_juridico = client_id OR id_cliente_fisico = client_id);

    SELECT COUNT(*) INTO total_contas
    FROM tb_conta
    WHERE status = 'ativo' AND (id_cliente_juridico = client_id OR id_cliente_fisico = client_id);

    IF total_contas > 0 THEN
        SET saldo_medio = total_saldo / total_contas;
    ELSE
        SET saldo_medio = 0.00;
    END IF;
END;
//
DELIMITER ;


  CREATE VIEW vw_detalhes_clientes AS
SELECT
    cf.id_cliente_fisico AS id_cliente,
    CONCAT(cf.nome, ' ', cf.sobrenome) AS nome_completo,
    'Pessoa Física' AS tipo_cliente,
    cf.email,
    cf.dt_nascimento AS data_nascimento,
    cf.CPF AS identificacao,
    e.CEP,
    e.numero_casa AS numero_endereco,
    t.numero AS telefone
FROM
    tb_cliente_fisico cf
JOIN
    tb_endereco e ON cf.id_endereco = e.id_endereco
LEFT JOIN
    tb_cliente_telefone ct ON cf.id_cliente_fisico = ct.id_cliente_fisico
LEFT JOIN
    tb_telefone t ON ct.id_telefone = t.id_telefone
UNION
SELECT
    cj.id_cliente_juridico AS id_cliente,
    CONCAT(cj.nome, ' ', cj.sobrenome) AS nome_completo,
    'Pessoa Jurídica' AS tipo_cliente,
    cj.email,
    cj.dt_nascimento AS data_nascimento,
    cj.CNPJ AS identificacao,
    e.CEP,
    e.numero_casa AS numero_endereco,
    t.numero AS telefone
FROM
    tb_cliente_juridico cj
JOIN
    tb_endereco e ON cj.id_endereco = e.id_endereco
LEFT JOIN
    tb_cliente_telefone ct ON cj.id_cliente_juridico = ct.id_cliente_juridico
LEFT JOIN
    tb_telefone t ON ct.id_telefone = t.id_telefone;



/*ver transacoes dos clientes*/



CREATE VIEW vw_transacoes_clientes AS
SELECT
    cf.id_cliente_fisico AS id_cliente,
    CONCAT(cf.nome, ' ', cf.sobrenome) AS nome_completo,
    cf.CPF AS identificador,
    'Pessoa Física' AS tipo_cliente,
    t.id_transferencia,
    t.conta_saida,
    t.conta_destino,
    t.valor,
    tt.descricao AS tipo_transacao
FROM
    tb_cliente_fisico cf
LEFT JOIN
    tb_conta c ON cf.id_cliente_fisico = c.id_cliente_fisico
LEFT JOIN
    tb_transferencia t ON c.id_transferencia = t.id_transferencia
LEFT JOIN
    tb_tipo_transferencia tt ON t.id_tipo = tt.id_tipo_transacao
UNION
SELECT
    cj.id_cliente_juridico AS id_cliente,
    CONCAT(cj.nome, ' ', cj.sobrenome) AS nome_completo,
    cj.CNPJ AS identificacao,
    'Pessoa Jurídica' AS tipo_cliente,
    t.id_transferencia,
    t.conta_saida,
    t.conta_destino,
    t.valor,
    tt.descricao AS tipo_transferencia
FROM
    tb_cliente_juridico cj
LEFT JOIN
    tb_conta c ON cj.id_cliente_juridico = c.id_cliente_juridico
LEFT JOIN
    tb_transferencia t ON c.id_transferencia = t.id_transferencia
LEFT JOIN
    tb_tipo_transferencia tt ON t.id_tipo = tt.id_tipo_transferencia;
  
  
SELECT * FROM tb_conta;
    
    
    
    