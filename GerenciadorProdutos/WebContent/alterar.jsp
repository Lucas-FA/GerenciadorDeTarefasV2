<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="service.ProdutoService" %>
<%@ page import="model.Produto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Alterar produto</title>
		<link rel="stylesheet" type="text/css" href="estilo.css">
	</head>
	<body>
		<% 
			int codigo = Integer.parseInt(request.getParameter("codigo"));
			ProdutoService ps = new ProdutoService();
			Produto p = ps.consultar(codigo);
		%>
		
		${ requestScope.mensagem }
		
		<form method="post" action="controller.do">
			<p class="texto">
				Código: <input type="number" name="codigo" readonly value="<%= p.getCodigo() %>">
			</p>
			<p class="texto">
				Nome: <input type="text" name="nome" value="<%= p.getNome() %>">
			</p>
			<p class="texto">
				Descrição: <textarea name="descricao" rows="6" cols="60"><%= p.getDescricao() %></textarea>
			</p>
			<p class="texto">
				Valor: <input type="number" step="0.01" name="valor" value="<%= p.getValor() %>">
			</p>
			<p class="texto">
				Estoque: <input type="number" name="estoque" value="<%= p.getEstoque() %>">
			</p>
			<input type="hidden" name="command" value="AlterarProduto">
			<input class="botao" type="submit" value="Alterar">
			<a class="botao" href='listar.jsp'>Voltar</a>
		</form>
	</body>
</html>