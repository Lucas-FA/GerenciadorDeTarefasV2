<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="service.ProdutoService" %>
<%@ page import="model.Produto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Resultado encontrado</title>
		<link rel="stylesheet" type="text/css" href="estilo.css">
	</head>
	<body>
		<% 
			int codigo = Integer.parseInt(request.getParameter("codigo"));
			ProdutoService ps = new ProdutoService();
			Produto p = ps.consultar(codigo);
		%>
		<p class="texto">
			C�digo: <input type="number" name="codigo" readonly value="<%= p.getCodigo() %>">
		</p>
		<p class="texto">
			Nome: <input type="text" name="nome" readonly value="<%= p.getNome() %>">
		</p>
		<p class="texto">
			Descri��o: <textarea name="descricao" rows="6" cols="60" readonly><%= p.getDescricao() %></textarea>
		</p>
		<p class="texto">
			Valor: <input type="number" step="0.01" name="valor" readonly value="<%= p.getValor() %>">
		</p>
		<p class="texto">
			Estoque: <input type="number" name="estoque" readonly value="<%= p.getEstoque() %>">
		</p>
		<br>
		<a class="botao" href='pesquisar.jsp'>Voltar</a>
	</body>
</html>