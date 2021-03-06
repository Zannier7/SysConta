/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.upeu.dao.UsuarioDAO;

/**
 *
 * @author Leandro Burgos
 */
public class MainController extends HttpServlet {

    Map<String, Object> mp = new HashMap<>();
    UsuarioDAO uO = new UsuarioDAO();

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
        RequestDispatcher dispatcher;
        String pagina = "";
        int opc = Integer.parseInt(request.getParameter("opc"));

        switch (opc) {
            case 1:
                pagina = "/view/prueba.jsp";
                dispatcher = getServletContext().getRequestDispatcher(pagina);
                dispatcher.forward(request, response);
                break;

            case 2:
                pagina = "/index.jsp";
                dispatcher = getServletContext().getRequestDispatcher(pagina);
                dispatcher.forward(request, response);
                break;

            case 3:
                pagina = "/view/configuraciones.jsp";
                dispatcher = getServletContext().getRequestDispatcher(pagina);
                dispatcher.forward(request, response);
                break;
            case 4:
                pagina = "/view/payroll.jsp";
                dispatcher = getServletContext().getRequestDispatcher(pagina);
                dispatcher.forward(request, response);
                break;
            case 5:
                pagina = "/view/contract.jsp";
                dispatcher = getServletContext().getRequestDispatcher(pagina);
                dispatcher.forward(request, response);
                break;
            case 6:
                dispatcher = getServletContext().getRequestDispatcher("/view/main.jsp");
                dispatcher.forward(request, response);
                break;
            case 7:
                dispatcher = getServletContext().getRequestDispatcher("/view/extra.jsp");
                dispatcher.forward(request, response);
                break;
        }

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
