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

