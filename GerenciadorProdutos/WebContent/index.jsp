<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Gerenciador de Produtos</title>
		<link rel="stylesheet" type="text/css" href="estilo.css">
	</head>
	<body>
		${ requestScope.mensagem }
		<p class="texto">
			Boas Vindas! Qual operação deseja realizar?
		</p>	
		<a class="botao" href="cadastrar.jsp">Cadastrar</a>
		<a class="botao" href="listar.jsp">Consultar</a>
		<a class="botao" href="pesquisar.jsp">Pesquisar</a>
	</body>
</html>