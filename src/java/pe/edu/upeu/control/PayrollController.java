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
import pe.edu.upeu.dao.PayrollDAO;

/**
 *
 * @author Leandro Burgos
 */
public class PayrollController extends HttpServlet {

    Map<String, Object> mp = new HashMap<>();
    PayrollDAO pd = new PayrollDAO();

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
        int idplanilla, codigo, tipo, asiento;
        double monto;
        String denominacion;
        try {
            switch (opc) {
                case 1://validar
                    mp.put("lista", pd.validarPayroll());
                    break;
                case 2://listar un trabajador
                    int id = Integer.parseInt(request.getParameter("id"));
                    mp.put("trabajador", pd.listWorker(id));
                    break;
                case 3://add Planilla
                    mp.put("idplanilla", pd.Reg_planilla());
                    break;
                case 4://REGISTRO EN DET_PLANILLA -- ASIENTOS DEL DIARIO
                    idplanilla = Integer.parseInt(request.getParameter("idplanilla"));
                    asiento = Integer.parseInt(request.getParameter("ntotal"));
                    codigo = Integer.parseInt(request.getParameter("codigo"));
                    denominacion = request.getParameter("denominacion");
                    monto = Double.parseDouble(request.getParameter("monto"));
                    tipo = Integer.parseInt(request.getParameter("movimiento"));
                    Map<String, Object> s = new HashMap<>();
                    s.put("id", idplanilla);
                    s.put("asiento", asiento);
                    s.put("codigo", codigo);
                    s.put("denominacion", denominacion);
                    s.put("monto", monto);
                    s.put("tipo", tipo);
                    System.out.println(s);
                    pd.add(s);
                    break;
                case 5:
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
