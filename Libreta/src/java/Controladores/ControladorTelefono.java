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
import modelos.TelefonoBean;

/**
 *
 * @author jsantamaria
 */
@WebServlet(name = "ControladorTelefono", urlPatterns = {"/ControladorTelefono"})
public class ControladorTelefono extends HttpServlet {

    IDAO contexto;

    public ControladorTelefono() {
        this.contexto = new DAO();
    }

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

        PersonaBean persona = (PersonaBean) request.getSession().getAttribute("myPersona");

        if (persona != null) {

            TelefonoBean nuevoTel = new TelefonoBean(
                    request.getParameter("telefonotxt"),
                    persona.getId(),
                    request.getParameter("ubicaciontxt"));

            contexto.AgregarTelefono(nuevoTel);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
            rd.forward(request, response);

        }

    }
}
