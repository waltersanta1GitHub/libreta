package DAO;

import java.util.List;
import modelos.CorreoElectronicoBean;
import modelos.DireccionBean;
import modelos.PersonaBean;
import modelos.TelefonoBean;

public interface IDAO {

    public boolean AgregarPersona(PersonaBean nueva);

    public boolean EliminarPersona(int idpersona);

    public void ActualizarPersona(PersonaBean nueva);

    public PersonaBean BuscarPersona(int idpersona);

    public List<PersonaBean> ListarPersonas();

    public boolean AgregarTelefono(TelefonoBean nuevotel);

    public boolean EliminarTelefono(int idtelefono, int idpersona);

    public void ActualizarTelefono(TelefonoBean nuevotel);

    public TelefonoBean BuscarTelefono(int idpersona, int telefono);

    public boolean AgregarDireccion(DireccionBean direccionnueva);

    public boolean EliminarDireccion(int iddirecciones, int idpersona);

    public void ActualizarDireccion(DireccionBean actuaizadir);

    public DireccionBean BuscarDireccion(int iddirecciones, int idpersona);
   
        
    
}
