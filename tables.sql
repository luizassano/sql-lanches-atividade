-- Aqui você deve colocar os códigos SQL referentes à

-- Criação das tabelas

-- Tabela clientes
CREATE TABLE
  IF NOT EXISTS clientes (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    lealdade INTEGER NOT NULL
  );

-- Tabela endereços
CREATE TABLE
  IF NOT EXISTS enderecos(
    id BIGSERIAL PRIMARY KEY,
    rua VARCHAR (20) NOT NULL,
    cep VARCHAR(12) NOT NULL,
    numero INTEGER NOT NULL,
    complemento VARCHAR(100),
    bairro VARCHAR(50) NOT NULL,
    cliente_id INTEGER UNIQUE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes (id) ON DELETE CASCADE  
  );
-- Tabela pedidos
CREATE TABLE
  IF NOT EXISTS pedidos (
    id BIGSERIAL PRIMARY KEY,
    status VARCHAR(50) NOT NULL,
    cliente_id INTEGER NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes (id) ON DELETE CASCADE
  );
-- Tabela produtos
CREATE TABLE
  IF NOT EXISTS produtos (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    preco FLOAT NOT NULL,
    pts_de_lealdade INTEGER NOT NULL
  );
-- Tabela produtos_pedidos
CREATE TABLE
  IF NOT EXISTS produtos_pedidos (
    id BIGSERIAL PRIMARY KEY,
    pedido_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos (id) ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
  );
  
-- INSERTS

 INSERT INTO clientes
          (nome, lealdade)
        VALUES
          ('Paula', 64),
          ('Francisco', 168),
          ('Elise', 24),
          ('Marcelo', 48),
          ('Laura', 36);
        
        INSERT INTO enderecos
          (rua, cep, numero, complemento, bairro,  cliente_id)
        VALUES
          ('Rua 1','09092-909',  121, 'apto. 302','Bairro 1',  1),
          ('Rua 2','12345-995',  254, null,'Bairro 2',  2),
          ('Rua 3','54625-845',  1050, null,'Bairro 3',  3),
          ( 'Rua 4','65655-321', 79, 'APTO. 505','Bairro 4',  4),
          ('Rua 5','15484-565',  32, null,'Bairro 5',  5);
            
        INSERT INTO produtos
          (nome, tipo, preco, pts_de_lealdade)
        VALUES
          ('Big Serial', 'Burguer', 24.99, 12),
          ('Varchapa', 'Burguer', 32.99, 16),
          ('Update sem WHERE', 'Burguer', 42.99, 20), 
          ('Um pra Dois', 'Burguer', 49.99, 24),
          ('DELETE sem WHERE', 'Burguer', 54.99, 32), 
          ('Fritas', 'Acompanhamento', 14.99, 8), 
          ('Cebola', 'Acompanhamento', 19.99, 12),
          ('Coca-Cola', 'Bebida', 5.99, 6), 
          ('Fanta', 'Bebida', 5.99, 6), 
          ('Guaraná', 'Bebida', 5.99, 6);
            
        
        INSERT INTO pedidos 
            (status, cliente_id)
        VALUES
          ('Em preparo', 1),
          ('Finalizado', 2),
          ('Recebido', 3),
          ('Entregue', 4),
          ('Recebido', 5);
            
        INSERT INTO produtos_pedidos
          (pedido_id, produto_id)
        VALUES
          (1, 4),
          (1, 2),
          (1, 6),
          (2, 2),
          (2, 4),
          (2, 7),
          (2, 9),
          (3, 5),
          (3, 6),
          (3, 9),
          (4, 1),
          (4, 1),
          (4, 6),
          (4, 10),
          (5, 3),
          (5, 2),
          (5, 7),
          (5, 8);