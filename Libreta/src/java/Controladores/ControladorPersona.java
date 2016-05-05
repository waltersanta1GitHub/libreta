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
 * @author jsantamaria
 */
@WebServlet(name = "ControladorPersona", urlPatterns = {"/ControladorPersona"})
public class ControladorPersona extends HttpServlet {

    IDAO contexto;

    public ControladorPersona() {
        this.contexto = new DAO();
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
       
        PersonaBean nuevaPersona = new PersonaBean(request.getParameter("nombretxt"), request.getParameter("cctxt"), request.getParameter("edadtxt"), request.getParameter("sexotxt").charAt(0) );
        int identidad= contexto.AgregarPersona(nuevaPersona);        
        nuevaPersona.setId(identidad);
        
        request.getSession().setAttribute("myPersona", nuevaPersona);
        request.setAttribute("listaPersonas", contexto.ListarPersonas());
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
        rd.forward(request, response);

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
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    } 

}
