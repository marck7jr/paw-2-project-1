/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.DepartamentoDAO;
import dao.ProdutoDAO;
import entidades.Produto;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lucim
 */
@WebServlet(name = "ProdutoServlet", urlPatterns = {"/produto"})
public class ProdutoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Produto produto = new Produto();
        ProdutoDAO dao = new ProdutoDAO();

        if (request.getParameter("nome") != null && !request.getParameter("nome").isEmpty()) {
            produto.setNome(request.getParameter("nome"));
            produto.setDescricao(request.getParameter("descricao"));
            produto.setImagemUrl(request.getParameter("imagem_url"));
            produto.setValor(Float.parseFloat(request.getParameter("valor")));
            produto.setEstoque(Integer.parseInt(request.getParameter("estoque")));
            // Pegar Departamento
            if (request.getParameter("departamento") != null) {
                DepartamentoDAO departamentoDao = new DepartamentoDAO();                
                produto.setDepartamento(departamentoDao.find(Integer.parseInt(request.getParameter("departamento"))));
            }
            //dao.save(produto);
        } else if (request.getParameter("excluir") != null) {
            dao.delete(dao.find(Integer.parseInt(request.getParameter("excluir"))));
        } else if (request.getParameter("atualizar") != null) {
            request.setAttribute("usuario", dao.find(Integer.parseInt(request.getParameter("atualizar"))));
        }

        RequestDispatcher view = request.getRequestDispatcher("Produto.jsp");

        request.setAttribute("produtos", dao.list());

        view.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
