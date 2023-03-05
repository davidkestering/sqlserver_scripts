drop table seg_categoria_tipo_transacao;
CREATE TABLE seg_categoria_tipo_transacao (
  id			INT IDENTITY(1,1) PRIMARY KEY,
  descricao		VARCHAR(255) NOT NULL,
  dt_cadastro	DATETIME DEFAULT GETDATE() NOT NULL,
  publicado		TINYINT CHECK(publicado >= 0) NOT NULL DEFAULT 0,
  ativo			TINYINT  CHECK(ativo >= 0) NOT NULL DEFAULT 1
);

INSERT INTO seg_categoria_tipo_transacao (descricao) VALUES
('Permissao'),
('Acesso'),
('Grupos'),
('Usuario'),
('Transacao');

select * from seg_categoria_tipo_transacao;

update seg_categoria_tipo_transacao set publicado = 1;


CREATE TABLE seg_erros_mysql (
  id			INT IDENTITY(1,1) PRIMARY KEY,
  erro			NVARCHAR(MAX) NOT NULL,
  id_usuario	INT CHECK(id_usuario >= 0) DEFAULT NULL,
  ip			NVARCHAR(MAX) DEFAULT NULL,
  dt_cadastro	DATETIME DEFAULT GETDATE() NOT NULL,
  publicado		TINYINT CHECK(publicado >= 0) NOT NULL DEFAULT 0,
  ativo			TINYINT  CHECK(ativo >= 0) NOT NULL DEFAULT 1
);

CREATE TABLE seg_grupo_usuario (
  id				INT IDENTITY(1,1) PRIMARY KEY,
  nm_grupo_usuario	NVARCHAR(MAX) NOT NULL,
  dt_cadastro		DATETIME DEFAULT GETDATE() NOT NULL,
  publicado		TINYINT CHECK(publicado >= 0) NOT NULL DEFAULT 0,
  ativo			TINYINT  CHECK(ativo >= 0) NOT NULL DEFAULT 1
);

INSERT INTO seg_grupo_usuario (nm_grupo_usuario) VALUES
('Administrador');


CREATE TABLE seg_permissao (
  id_tipo_transacao INT CHECK(id_tipo_transacao >= 0) NOT NULL DEFAULT 0,
  id_grupo_usuario	INT CHECK(id_grupo_usuario >= 0) NOT NULL DEFAULT 0,
  dt_cadastro		DATETIME DEFAULT GETDATE() NOT NULL,
  publicado		TINYINT CHECK(publicado >= 0) NOT NULL DEFAULT 0,
  ativo			TINYINT  CHECK(ativo >= 0) NOT NULL DEFAULT 1
);


CREATE TABLE seg_tipo_transacao (
  id							INT IDENTITY(1,1) PRIMARY KEY,
  id_categoria_tipo_transacao	INT CHECK(id_categoria_tipo_transacao >= 0) NOT NULL DEFAULT 0,
  transacao						NVARCHAR(MAX) NOT NULL,
  dt_cadastro		DATETIME DEFAULT GETDATE() NOT NULL,
  publicado		TINYINT CHECK(publicado >= 0) NOT NULL DEFAULT 0,
  ativo			TINYINT  CHECK(ativo >= 0) NOT NULL DEFAULT 1
);


INSERT INTO seg_tipo_transacao (id_categoria_tipo_transacao, transacao) VALUES
(1, 'Alterar'),
(2, 'Login'),
(2, 'Logout'),
(3, 'Visualizar'),
(3, 'Alterar'),
(3, 'Cadastrar'),
(3, 'Excluir'),
(3, 'Desativar'),
(4, 'Visualizar'),
( 4, 'Alterar'),
( 4, 'AlterarSenha'),
( 4, 'Cadastrar'),
( 4, 'Excluir'),
( 4, 'Desativar'),
( 5, 'Visualizar'),
( 5, 'Alterar'),
( 5, 'Cadastrar'),
( 5, 'Excluir'),
( 5, 'Desativar'),
( 5, 'VerLog'),
( 5, 'VerErro'),
( 5, 'VerErrosMySQL');

select * from seg_tipo_transacao;


INSERT INTO seg_permissao (id_tipo_transacao, id_grupo_usuario) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1);


CREATE TABLE seg_transacao (
  id				INT IDENTITY(1,1) PRIMARY KEY,
  id_tipo_transacao INT CHECK(id_tipo_transacao >= 0) NOT NULL DEFAULT 0,
  id_usuario		INT CHECK(id_usuario >= 0) NOT NULL DEFAULT 0,
  objeto			NVARCHAR(MAX) NOT NULL,
  ip				NVARCHAR(MAX) DEFAULT NULL,
  dt_cadastro		DATETIME DEFAULT GETDATE() NOT NULL,
  publicado		TINYINT CHECK(publicado >= 0) NOT NULL DEFAULT 0,
  ativo			TINYINT  CHECK(ativo >= 0) NOT NULL DEFAULT 1
);


CREATE TABLE seg_transacao_acesso (
  id				INT IDENTITY(1,1) PRIMARY KEY,
  id_tipo_transacao INT CHECK(id_tipo_transacao >= 0) NOT NULL DEFAULT 0,
  id_usuario		INT CHECK(id_usuario >= 0) NOT NULL DEFAULT 0,
  objeto			NVARCHAR(MAX) NOT NULL,
  ip				NVARCHAR(MAX) DEFAULT NULL,
  dt_cadastro		DATETIME DEFAULT GETDATE() NOT NULL,
  publicado		TINYINT CHECK(publicado >= 0) NOT NULL DEFAULT 0,
  ativo			TINYINT  CHECK(ativo >= 0) NOT NULL DEFAULT 1
);

--drop table seg_usuario;
CREATE TABLE seg_usuario (
  id				INT IDENTITY(1,1) PRIMARY KEY,
  id_grupo_usuario	INT CHECK(id_grupo_usuario >= 0) NOT NULL DEFAULT 0,
  nm_usuario		NVARCHAR(MAX) NOT NULL,
  login				NVARCHAR(MAX) NOT NULL,
  senha				VARBINARY(MAX) NOT NULL,
  email				NVARCHAR(MAX) DEFAULT NULL,
  logado			TINYINT CHECK(logado >= 0) NOT NULL DEFAULT 0,
  dt_cadastro		DATETIME DEFAULT GETDATE() NOT NULL,
  publicado		TINYINT CHECK(publicado >= 0) NOT NULL DEFAULT 0,
  ativo			TINYINT  CHECK(ativo >= 0) NOT NULL DEFAULT 1
);

DECLARE @senha NVARCHAR(MAX) = 'tudobem';
DECLARE @senhaCriptografada VARBINARY(MAX);
SET @senhaCriptografada = HASHBYTES('SHA2_256', @senha);

INSERT INTO seg_usuario (id_grupo_usuario, nm_usuario, login, senha, email) VALUES
(1, 'Dávìd Këstêrîng', 'david', @senhaCriptografada, 'davidkestering@gmail.com');

select * from seg_usuario;

update seg_categoria_tipo_transacao set publicado = 1;
update seg_erros_mysql set publicado = 1;
update seg_grupo_usuario set publicado = 1;
update seg_permissao set publicado = 1;
update seg_tipo_transacao set publicado = 1;
update seg_transacao set publicado = 1;
update seg_transacao_acesso set publicado = 1;