<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="service.ProdutoService" %>
<%@ page import="model.Produto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Pesquisar produto</title>
		<link rel="stylesheet" type="text/css" href="estilo.css">
	</head>
	<body>
		${ requestScope.mensagem }
		<form method="post" action="controller.do">
			<p class="texto">
				Código: <input type="number" name="codigo">
			</p>
			<input type="hidden" name="command" value="PesquisarProduto">
			<input class="botao" type="submit" value="Pesquisar">
			<a class="botao" href='index.html'>Voltar</a>
		</form>
	</body>
</html>