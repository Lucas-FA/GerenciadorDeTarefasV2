package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import service.ProdutoService;

public class AlterarProduto implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String codigo = request.getParameter("codigo");
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		String valor = request.getParameter("valor");
		String estoque = request.getParameter("estoque");
		
		if(nome.equals("") || descricao.equals("") || valor.equals("") || estoque.equals("")) {
			request.setAttribute("mensagem", "Informe todos os dados!");
			
			RequestDispatcher view = request.getRequestDispatcher("alterar.jsp?codigo=" + codigo);
			view.forward(request, response);
		}
		else {
			int codigoInt = Integer.parseInt(codigo);
			double valorDouble = Double.parseDouble(valor);
			int estoqueInt = Integer.parseInt(estoque);
			
			ProdutoService ps = new ProdutoService();
			Produto p = new Produto(codigoInt, nome, descricao, valorDouble, estoqueInt);
			if(valorDouble < 0.01 || estoqueInt < 0 || nome.length() > 256) {
				request.setAttribute("mensagem", "Informe um número válido código/valor/estoque e um nome com menos de 256 caracteres!");
				
				RequestDispatcher view = request.getRequestDispatcher("alterar.jsp?codigo=" + codigo);
				view.forward(request, response);
			}
			else {
				ps.alterar(p);
				request.setAttribute("mensagem", "Dados alterados!");
				
				RequestDispatcher view = request.getRequestDispatcher("listar.jsp");
				view.forward(request, response);
			}
		}
	}
}
