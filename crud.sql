-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
  INSERT INTO 
	clientes(nome, lealdade)
   VALUES('Georgia', 0);

-- 2)
INSERT INTO 
	pedidos(status, cliente_id)
   VALUES('Recebido', 6 );


-- 3)
INSERT INTO
   produtos_pedidos (pedido_id, produto_id)
   VALUES
   (6, (SELECT id FROM produtos WHERE nome ='Big Serial')),
  (6, (SELECT id FROM produtos WHERE nome ='Varchapa')),
  (6, (SELECT id FROM produtos WHERE nome ='Fritas')),
  (6, (SELECT id FROM produtos WHERE nome ='Coca-Cola')),
  (6, (SELECT id FROM produtos WHERE nome ='Coca-Cola'));


-- Leitura

-- 1)
SELECT
  l.*,
  p.*,
  s.*
FROM
  pedidos p
  INNER JOIN produtos_pedidos c ON p.id = c.pedido_id
  INNER JOIN produtos s ON s.id = c.produto_id
  INNER JOIN clientes l ON l.id = p.cliente_id
ORDER BY
  l.nome ASC;


-- Atualização

-- 1)
SELECT
  SUM(pts_de_lealdade) AS pts_lealdade_Georgia
FROM
  pedidos p
  INNER JOIN produtos_pedidos c ON p.id = c.pedido_id
  INNER JOIN produtos s ON s.id = c.produto_id
  INNER JOIN clientes l ON l.id = p.cliente_id
WHERE
  l.nome = 'Georgia'

UPDATE
  clientes
SET
  lealdade = (
    SELECT
      SUM(pts_de_lealdade) AS pts_lealdade_Georgia
    FROM
      pedidos p
      INNER JOIN produtos_pedidos c ON p.id = c.pedido_id
      INNER JOIN produtos pr ON pr.id = c.produto_id
      INNER JOIN clientes l ON l.id = p.cliente_id
    WHERE
      l.nome = 'Georgia'
  )
WHERE
  nome = 'Georgia'

-- Deleção

-- 1)

DELETE FROM clientes p 
  WHERE p.nome='Marcelo';
  
 