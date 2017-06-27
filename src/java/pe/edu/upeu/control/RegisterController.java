/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.control;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.upeu.dao.ContratoDAO;
import pe.edu.upeu.dao.RegistroDAO;

/**
 *
 * @author Leandro Burgos
 */
public class RegisterController extends HttpServlet {

    Map<String, Object> mp = new HashMap<>();
    RegistroDAO rD = new RegistroDAO();
    ContratoDAO cd=new ContratoDAO();

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
        int opc = Integer.parseInt(request.getParameter("opc"));
        String tipe = request.getParameter("tipe");
        String name, ape, dni, user, pass, emp;
        try {
            switch (opc) {
                case 1:
                    switch (tipe) {//REGISTRO DE ROOT
                        case "userRoot":
                            emp = request.getParameter("emp");
                            name = request.getParameter("name");
                            ape = request.getParameter("ape");
                            dni = request.getParameter("dni");
                            user = request.getParameter("user");
                            pass = request.getParameter("pass");
                            System.out.println(emp+" "+name+" "+ape+" "+dni+" "+user+" "+pass);
                            mp.put("rpta", rD.UserROOT(name, ape, dni, user, pass, emp));
                            break;
                    }
                    break;
                case 2:
                    switch (tipe){//CONTRATOS
                        case "registrar":
                            String nombre=request.getParameter("nombre");
                            String regdni=request.getParameter("dni");
                            String ap=request.getParameter("apellidos");
                            String cargo=request.getParameter("idcargo");
                            String fini=request.getParameter("fini");
                            String ffin=request.getParameter("ffin");
                            String hrlab=request.getParameter("hrlab");
                            String dlab=request.getParameter("dlab");
                            String asignf=request.getParameter("asignf");
                            String sbase=request.getParameter("sbase");
                            String pension=request.getParameter("pension");
                            System.out.println("hola: "+asignf+", "+nombre+" "+regdni+" "+ap+" "+cargo+" "+fini+" "+ffin+" "+hrlab+" "+dlab+" "+sbase);
                            mp.put("rpta",cd.gethired(nombre, regdni, ap, cargo, fini, ffin, hrlab, dlab, asignf, sbase,pension));
                            break;
                        case "getcargo":
                            mp.put("lista", cd.getcargo());
                            break;
                            
                    }
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            mp.put("error", e.getMessage());
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
