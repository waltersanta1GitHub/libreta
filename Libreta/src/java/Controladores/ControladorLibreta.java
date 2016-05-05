package Controladores;

import DAO.DAO;
import DAO.IDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.PersonaBean;

/**
 *
 * @author Developer
 */
@WebServlet(name = "ControladorLibreta", urlPatterns = {"/ControladorLibreta"})
public class ControladorLibreta extends HttpServlet {

    IDAO contexto;

    public ControladorLibreta() {
        this.contexto = new DAO();
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

        request.setAttribute("listaPersonas", contexto.ListarPersonas());
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
        rd.forward(request, response);

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
        String idSeleccionado = request.getParameter("seleccionadotxt");
        if (idSeleccionado != null) {

            PersonaBean seleccionadaPersona = contexto.BuscarPersona(Integer.parseInt(idSeleccionado));
            if (seleccionadaPersona != null) {
                request.getSession().setAttribute("myPersona", seleccionadaPersona);

            }
        }
        request.setAttribute("listaPersonas", contexto.ListarPersonas());
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
        rd.forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
