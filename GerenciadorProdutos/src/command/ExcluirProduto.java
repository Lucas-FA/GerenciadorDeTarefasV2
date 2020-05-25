package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import service.ProdutoService;

public class ExcluirProduto implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String codigo = request.getParameter("codigo");
		
		if(codigo.equals("")) {
			request.setAttribute("mensagem", "Selecione um registro para excluir!");
			
			RequestDispatcher view = request.getRequestDispatcher("listar.jsp");
			view.forward(request, response);
		}
		else {
			int codigoInt = Integer.parseInt(codigo);
			ProdutoService ps = new ProdutoService();
			Produto p = ps.consultar(codigoInt);
			if(p.getCodigo() == 0) {
				request.setAttribute("mensagem", "Produto não encontrado! Selecione um registro para excluir!");
				
				RequestDispatcher view = request.getRequestDispatcher("listar.jsp");
				view.forward(request, response);
			}
			else {
				ps.excluir(p);
				request.setAttribute("mensagem", "Produto deletado!");
				
				RequestDispatcher view = request.getRequestDispatcher("listar.jsp");
				view.forward(request, response);
			}
		}
	}
}
