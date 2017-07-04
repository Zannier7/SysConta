/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.control;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.upeu.dao.SettingsDao;

/**
 *
 * @author César
 */
public class SettingsController extends HttpServlet {
    SettingsDao sd = new SettingsDao();
    Map<String, Object> mp = new HashMap<>();

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
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String op = request.getParameter("op");
        switch (op) {
            case "getuit":
                mp=sd.getuit();
                System.out.println("uit: "+mp.get("uit"));
                break;
            case "modifyuit":
                String nuit=request.getParameter("nuit");
                mp.put("rpta",1);
                mp.put("status",sd.modifyuit(nuit));
                mp.put("uit",sd.getuit());
                break;
            case "createafp":
                String nombre=request.getParameter("nombre");
                String tipo=request.getParameter("tipo");
                String interes=request.getParameter("interes");
                mp.put("rpta", 1);
                mp.put("status", sd.createafp(nombre, tipo, interes));
                break;
            case "listafp":
                mp.put("rpta", 1);
                mp.put("list", sd.listafp());
                break;
            case "createpuesto":
                nombre=request.getParameter("ncargo");
                String comision=request.getParameter("ncomision");
                mp.put("rpta", 1);
                mp.put("status", sd.createcargo(nombre, comision));
        }
        Gson gson = new Gson();
        out.println(gson.toJson(mp));
        out.flush();
        out.close();
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
