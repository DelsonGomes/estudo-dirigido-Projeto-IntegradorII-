-- Tabela de Categorias
CREATE TABLE categorias (
    categoria_id INT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT
);

-- Tabela de Produtos
CREATE TABLE produtos (
    produto_id INT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT,
    preco DECIMAL(10, 2),
    quantidade_estoque INT,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);

-- Tabela de Fornecedores
CREATE TABLE fornecedores (
    fornecedor_id INT PRIMARY KEY,
    nome VARCHAR(255),
    contato VARCHAR(255)
);

-- Tabela de Pedidos
CREATE TABLE pedidos (
    pedido_id INT PRIMARY KEY,
    data_pedido DATE,
    total DECIMAL(10, 2),
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(fornecedor_id)
);

-- Tabela de Itens do Pedido
CREATE TABLE itens_pedido (
    item_id INT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    total_item DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

-- Tabela de Movimentações de Estoque
CREATE TABLE movimentacoes_estoque (
    movimentacao_id INT PRIMARY KEY,
    produto_id INT,
    quantidade INT,
    tipo_movimentacao ENUM('entrada', 'saida'),
    data_movimentacao DATE,
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);
