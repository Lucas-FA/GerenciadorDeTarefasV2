package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import service.ProdutoService;

public class PesquisarProduto implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String codigo = request.getParameter("codigo");
		
		if(codigo.equals("")) {
			request.setAttribute("mensagem", "Informe a matrícula!");
			
			RequestDispatcher view = request.getRequestDispatcher("pesquisar.jsp");
			view.forward(request, response);
		}
		else {
			int codigoInt = Integer.parseInt(codigo);
			ProdutoService ps = new ProdutoService();
			Produto p = new Produto();
			p = ps.consultar(codigoInt);
			if(p.getCodigo() == 0) {
				request.setAttribute("mensagem", "Produto não encontrado!");
				
				RequestDispatcher view = request.getRequestDispatcher("pesquisar.jsp");
				view.forward(request, response);
			}
			else {
				request.setAttribute("codigo", p.getCodigo());
				
				RequestDispatcher view = request.getRequestDispatcher("encontrado.jsp");
				view.forward(request, response);
			}
		}
	}
}