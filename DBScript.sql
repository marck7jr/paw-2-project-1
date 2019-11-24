create table usuario(
      id serial not null primary key
    , nome varchar(120)
    , email varchar(120)
    , senha varchar(120)
    , telefone varchar(60)
    , cpf varchar(30)
    , endereco varchar(240)
);

create table departamento(
      id serial not null primary key
    , nome varchar(120)
    , imagem_url varchar(240)
);

create table produto(
      id serial not null primary key
    , nome varchar(120)
    , descricao varchar(1160)
    , imagem_url varchar(120)
    , valor decimal
    , quantidade_estoque integer
    , departamento integer references departamento(id)
);

create table cupom(
      id serial not null primary key
    , nome varchar(120)
    , codigo varchar(30)
    , desconto decimal
    , tipo_percentual boolean
);

create table compra(
      id serial not null primary key
    , usuario integer references usuario(id)
    , cupom integer references cupom(id)
    , total decimal
);

create table compra_item(
      id serial not null primary key
    , compra integer references compra(id)
    , produto integer references produto(id)
    , quantidade integer
);