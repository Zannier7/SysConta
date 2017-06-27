/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.control;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.dao.PlanContableDAO;
import pe.edu.upeu.model.Modelo_plancontable;

/**
 *
 * @author SONY
 */
@WebServlet(name = "DiarioController", urlPatterns = {"/diario"})
public class DiarioController extends HttpServlet {

    Map<String, Object> mp = new HashMap<>();
    PlanContableDAO pro = new PlanContableDAO();

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
         HttpSession session = request.getSession(true);
          RequestDispatcher dispatcher;
        String url = "/view/diarybook.jsp";
       int idplancontable = Integer.parseInt(request.getParameter("id"));
       List<Modelo_plancontable> hola=pro.listarid(idplancontable);
      // session.setAttribute("listper", hola);
       dispatcher = getServletContext().getRequestDispatcher(url);
       dispatcher.forward(request, response);
       System.out.println(idplancontable);
      // System.out.println(hola);
     // session.setAttribute("login", login);
//request.getRequestDispatcher(url).forward(request, response); 
        //mp.put("hola", pro.listarid(idplan));
        //request.getSession().setAttribute("hola", idplan);
//  response.sendRedirect("/view/diarybook.jsp");
//  request.getRequestDispatcher("/view/diarybook.jsp").forward(request, response); 

//HttpSession sesion=request.getSession(true);
      // request.setAttribute("hola",idplan);
      // request.getRequestDispatcher(url).forward(request, response);

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
