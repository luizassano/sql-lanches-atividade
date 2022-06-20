-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1) Consulte por todos os pedidos juntamente com todas as informações dos produtos que estão em cada um dos pedidos.
SELECT
  p.*, 
  s.* 
FROM
  pedidos p
  INNER JOIN produtos_pedidos c ON p.id = c.pedido_id
  INNER JOIN produtos s ON s.id = c.produto_id
ORDER BY
  pts_de_lealdade DESC;

-- 2)Consulte pelo ID de todos os pedidos que incluam 'Fritas'.
SELECT
  p.id AS pedidos_com_fritas
FROM
  pedidos p
  INNER JOIN produtos_pedidos c ON p.id = c.pedido_id
  INNER JOIN produtos s ON s.id = c.produto_id
WHERE s.nome ILIKE '%fritas';

-- 3)Consulte novamente por pedidos que incluam 'Fritas', porém agora, retorne apenas uma coluna (gostam_de_fritas) com o nome dos Clientes que fizeram os pedidos.
SELECT
  l.nome AS gostam_de_fritas
FROM
  pedidos p
  INNER JOIN produtos_pedidos c ON p.id = c.pedido_id
  INNER JOIN produtos s ON s.id = c.produto_id
  INNER JOIN clientes l ON l.id = p.cliente_id
WHERE s.nome ILIKE '%fritas';

-- 4) Crie uma query que retorne o custo total dos pedidos da 'Laura'.
SELECT
  SUM(preco) AS gastos_totais_Laura
FROM
  pedidos p
  INNER JOIN produtos_pedidos c ON p.id = c.pedido_id
  INNER JOIN produtos s ON s.id = c.produto_id
WHERE
  p.cliente_id = 5

-- 5) Crie uma query que retorne em uma coluna o nome do produto, e na outra, o número de vezes que ele foi pedido. Dica: a função built-in COUNT pode somar o número de ocorrências de um id em uma coluna
 SELECT
  s.nome AS nome_do_pedido,
  COUNT(*) AS quantidade_de_vezes_pedidos
FROM
  pedidos p
  INNER JOIN produtos_pedidos c ON p.id = c.pedido_id
  INNER JOIN produtos s ON s.id = c.produto_id
  GROUP BY
  s.nome
  ORDER BY
  s.nome ASC;