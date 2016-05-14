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
        PersonaBean personaActual;
        int identidad = 0;
        
        
        String strUri = request.getRequestURL().toString();
        
        String strId = request.getParameter("personaidtxt");
        
        if (!strId.isEmpty()) {
            
            identidad = Integer.parseInt(request.getParameter("personaidtxt"));
            personaActual = contexto.BuscarPersona(identidad);
            if (personaActual != null) {
               
                personaActual.setId(identidad);
                personaActual.setNombre(request.getParameter("nombretxt"));
                personaActual.setDocumento(request.getParameter("cctxt"));
                personaActual.setEdad(request.getParameter("edadtxt"));
                personaActual.setSexo(request.getParameter("sexotxt").charAt(0));
                contexto.ActualizarPersona(personaActual);
            }
            
        } else {
            personaActual = new PersonaBean(request.getParameter("nombretxt"), request.getParameter("cctxt"), request.getParameter("edadtxt"), request.getParameter("sexotxt").charAt(0));
            identidad = contexto.AgregarPersona(personaActual);
        }
        request.getSession().setAttribute("myPersona", personaActual);        
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
        
        String idSeleccionado = request.getParameter("seleccionadotxt");
        PersonaBean seleccionadaPersona = contexto.BuscarPersona(Integer.parseInt(idSeleccionado));
        if (seleccionadaPersona != null) {
            
            request.getSession().setAttribute("myPersona", seleccionadaPersona);
            request.setAttribute("myResultado", contexto.ListarPersonas());
            
        }
        
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
