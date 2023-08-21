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