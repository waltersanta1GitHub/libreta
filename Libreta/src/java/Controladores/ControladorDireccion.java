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
import modelos.DireccionBean;
import modelos.PersonaBean;

/**
 *
 * @author jsantamaria
 */
@WebServlet(name = "ControladorDireccion", urlPatterns = {"/ControladorDireccion"})
public class ControladorDireccion extends HttpServlet {

    IDAO contexto;

    public ControladorDireccion() {
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

            DireccionBean nuevaDir = new DireccionBean(request.getParameter("direcciontxt"),  persona.getId());
            contexto.AgregarDireccion(nuevaDir);

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        }
        

    }
}
