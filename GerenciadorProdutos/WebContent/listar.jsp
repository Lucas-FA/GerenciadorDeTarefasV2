<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="service.ProdutoService" %>
<%@ page import="java.util.ArrayList, model.Produto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Lista de Produtos</title>
		<link rel="stylesheet" type="text/css" href="estilo.css">
	</head>
	<body>
		${ requestScope.mensagem }
		<table border="2">
			<tr>
				<th>Código</th>
				<th>Nome</th>
				<th>Descrição</th>
				<th>Valor</th>
				<th>Estoque</th>
			</tr>
			<%
				ArrayList<Produto> lista;
				ProdutoService ps = new ProdutoService();
		 		lista = ps.listar();
		 	
		 		for (Produto p : lista) {
			%>
				<tr>
					<td><%= p.getCodigo() %></td>
					<td><%= p.getNome() %></td>
					<td><%= p.getDescricao() %></td>
					<td>R$<%= String.format("%.02f", p.getValor()) %></td>
					<td><%= p.getEstoque() %></td>
					<td> <a href="alterar.jsp?codigo=<%=p.getCodigo()%>">Alterar</a> </td>
					<td> <a href="excluir.jsp?codigo=<%=p.getCodigo()%>">Excluir</a> </td>
				</tr>
			<% } %>
		</table>
		<br>
		<a class="botao" href="index.jsp">Voltar</a>
	</body>
</html>