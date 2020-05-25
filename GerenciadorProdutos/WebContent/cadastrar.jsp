<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Cadastrar Produto</title>
		<link rel="stylesheet" type="text/css" href="estilo.css">
	</head>
	<body>
		${ requestScope.mensagem }
		
		<form method="post" action="controller.do">
			<p class="texto">
				Código: <input type="number" name="codigo">
			</p>
			<p class="texto">
				Nome: <input type="text" name="nome">
			</p>
			<p class="texto">
				Descrição: <textarea name="descricao" rows="6" cols="60"></textarea>
			</p>
			<p class="texto">
				Valor: <input type="number" step="0.01" name="valor">
			</p>
			<p class="texto">
				Estoque: <input type="number" name="estoque">
			</p>
			<input type="hidden" name="command" value="CadastrarProduto">
			<input class="botao" type="submit" value="Cadastrar">
			<a class="botao" href='index.jsp'>Voltar</a>
		</form>
	</body>
</html>