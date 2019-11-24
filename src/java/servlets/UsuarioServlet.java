/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.UsuarioDAO;
import entidades.Usuario;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UsuarioServlet", urlPatterns = {"/usuario"})
public class UsuarioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Usuario usuario = new Usuario();
        UsuarioDAO dao = new UsuarioDAO();

        if (request.getParameter("nome") != null && !request.getParameter("nome").isEmpty()) {
            usuario.setId(Integer.parseInt(request.getParameter("id")));
            usuario.setNome(request.getParameter("nome"));
            usuario.setEmail(request.getParameter("email"));
            usuario.setCpf(request.getParameter("cpf"));
            usuario.setTelefone(request.getParameter("telefone"));
            // criptografar
            usuario.setSenha(request.getParameter("senha"));
            usuario.setEndereco(request.getParameter("endereco"));

            dao.save(usuario);
        } else if (request.getParameter("excluir") != null) {
            dao.delete(dao.find(Integer.parseInt(request.getParameter("excluir"))));
        } else if (request.getParameter("atualizar") != null) {
            request.setAttribute("usuario", dao.find(Integer.parseInt(request.getParameter("atualizar"))));
        }

        request.setAttribute("usuarios", dao.list());

        RequestDispatcher view = request.getRequestDispatcher("Usuario.jsp");
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
