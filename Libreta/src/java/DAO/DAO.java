package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.CorreoElectronicoBean;
import modelos.DireccionBean;
import modelos.PersonaBean;
import modelos.TelefonoBean;

public class DAO implements IDAO {

    /**
     * conecta a la base de datos
     *
     * @return
     */
    private Connection conectar() throws ClassNotFoundException {

        Connection conexion = null;
        try {

            Class.forName("com.mysql.jdbc.Driver");
            String cadenaconexion = "jdbc:mysql://localhost:3306/listacontactosdb?user=root&password=root";
            conexion = DriverManager.getConnection(cadenaconexion);

        } catch (SQLException exepcion) {

            // handle any errors
            System.out.println("SQLException: " + exepcion.getMessage());
            System.out.println("SQLState: " + exepcion.getSQLState());
            System.out.println("VendorError: " + exepcion.getErrorCode());
        }

        return conexion;

    }

    // Personas
    @Override
    public int AgregarPersona(PersonaBean nueva) {

        int returnedId = 0;

        try {
            String insertPersona = "INSERT INTO `listacontactosdb`.`persona` (`Nombre`, `Edad`, `Sexo`, `Documento`, `Habilitado`) VALUES (?,?,?,?,?);";

            PreparedStatement insercion = conectar().prepareStatement(insertPersona, Statement.RETURN_GENERATED_KEYS);
            insercion.setString(1, nueva.getNombre());
            insercion.setString(2, nueva.getEdad());
            insercion.setString(3, String.valueOf(nueva.getSexo()));
            insercion.setString(4, nueva.getDocumento());
            insercion.setBoolean(5, nueva.isHabilitada());
            int executeUpdate = insercion.executeUpdate();

            ResultSet rs = insercion.getGeneratedKeys();
            if (rs.next()) {
                returnedId = rs.getInt(1);
            }

            return returnedId;

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return returnedId;
    }

    @Override
    public void ActualizarPersona(PersonaBean actualiza) {

        try {

            String actualizaPersona = "UPDATE `listacontactosdb`.`persona` SET "
                    + "`Nombre` = ? ,`Edad` = ?, `Sexo` = ?,`Documento` = ? , `Habilitado`=?"
                    + " WHERE `idPersona` =?";

            PreparedStatement actua = conectar().prepareStatement(actualizaPersona);
            actua.setString(1, actualiza.getNombre());
            actua.setString(2, actualiza.getEdad());
            actua.setString(3, String.valueOf(actualiza.getSexo()));
            actua.setString(4, actualiza.getDocumento());
            actua.setBoolean(5, actualiza.isHabilitada());
            actua.setInt(6, actualiza.getId());
            actua.executeUpdate();

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public boolean EliminarPersona(int idpersona) {

        PersonaBean eliminaPersona = BuscarPersona(idpersona);
        eliminaPersona.setHabilitada(false);
        ActualizarPersona(eliminaPersona);
        return true;

    }

    @Override
    public PersonaBean BuscarPersona(int idpersona) {

        PersonaBean retornaPersona;
        retornaPersona = new PersonaBean(null, null, null, '?');
        try {

            String selectPersona = " SELECT `idPersona`,`Nombre`,`Edad`,`Sexo`,`Documento`,`Habilitado` FROM"
                    + " `listacontactosdb`.`persona` "
                    + "WHERE `idPersona` =" + idpersona + ";";
            Statement smtp = conectar().createStatement();
            ResultSet resultado = smtp.executeQuery(selectPersona);
            while (resultado.next()) {

                retornaPersona.setId(resultado.getInt("idPersona"));
                retornaPersona.setNombre(resultado.getString("Nombre"));
                retornaPersona.setEdad(resultado.getString("Edad"));
                retornaPersona.setSexo(resultado.getString("Sexo").charAt(0));
                retornaPersona.setDocumento(resultado.getString("Documento"));
                retornaPersona.setHabilitada(resultado.getBoolean("Habilitado"));

            }
            smtp.close();

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return retornaPersona;
    }

    @Override
    public List<PersonaBean> ListarPersonas() {

        List<PersonaBean> retornaLista = new ArrayList<>();
        PersonaBean itemPersona;
        itemPersona = new PersonaBean(null, null, null, '?');

        try {

            String selectPersona = "SELECT idPersona,Nombre,Edad,Sexo,Documento,Habilitado"
                    + " FROM listacontactosdb.persona";

            Statement smtp = conectar().createStatement();
            ResultSet resultado = smtp.executeQuery(selectPersona);

            while (resultado.next()) {

                itemPersona.setId(resultado.getInt("idPersona"));
                itemPersona.setNombre(resultado.getString("Nombre"));
                itemPersona.setEdad(resultado.getString("Edad"));
                itemPersona.setSexo(resultado.getString("Sexo").charAt(0));
                itemPersona.setDocumento(resultado.getString("Documento"));
                itemPersona.setHabilitada(resultado.getBoolean("Habilitado"));

                retornaLista.add(itemPersona);
                itemPersona = new PersonaBean(null, null, null, '?');

            }

            smtp.close();

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return retornaLista;

    }

    // Telefonos
    @Override
    public boolean AgregarTelefono(TelefonoBean nuevotel) {
        try {
            String insertTelefono = "INSERT INTO `listacontactosdb`.`telefonos`"
                    + " (`Telefono`, `Ubicacion`, `Persona_idPersona`,`Habilitado`) VALUES (?,?,?,?);";

            PreparedStatement insercion = conectar().prepareStatement(insertTelefono);
            insercion.setString(1, nuevotel.getTelefono());
            insercion.setString(2, nuevotel.getUbicacion());
            insercion.setInt(3, nuevotel.getIdPersona());
            insercion.setBoolean(4, nuevotel.isHabilitada());
            insercion.executeUpdate();

            return true;

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    @Override
    public void ActualizarTelefono(TelefonoBean actualizatel) {
        try {
            String actualizaTelefono = "UPDATE `listacontactosdb`.`telefonos` SET "
                    + "`Telefono` = ? ,`Ubicacion` = ?, `Persona_idPersona` = ?, `Habilitado`=?"
                    + "WHERE `idTelefonos` =?";

            PreparedStatement actua = conectar().prepareStatement(actualizaTelefono);
            actua.setString(1, actualizatel.getTelefono());
            actua.setString(2, actualizatel.getUbicacion());
            actua.setInt(3, actualizatel.getIdPersona());
            actua.setBoolean(4, actualizatel.isHabilitada());
            actua.setInt(5, actualizatel.getId());
            actua.executeUpdate();

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public boolean EliminarTelefono(int idtelefono, int idpersona) {

        TelefonoBean tel = BuscarTelefono(idtelefono, idpersona);
        tel.setHabilitada(false);
        ActualizarTelefono(tel);
        return true;
    }

    @Override
    public TelefonoBean BuscarTelefono(int idpersona, int telefono) {
        TelefonoBean retornaTelefono;
        retornaTelefono = new TelefonoBean(null, 0, null);
        try {
            String selectTelefono = " SELECT `idTelefonos`,`Telefono`,`Ubicacion`,`Persona_idPersona`,`Habilitado`"
                    + " FROM `listacontactosdb`.`telefonos` "
                    + " WHERE `idPersona` =" + idpersona
                    + " AND `idTelefonos` = " + telefono + ";";
            Statement smtp = conectar().createStatement();
            ResultSet resultado = smtp.executeQuery(selectTelefono);
            while (resultado.next()) {

                retornaTelefono.setId(resultado.getInt("idTelefonos"));
                retornaTelefono.setTelefono(resultado.getString("Telefono"));
                retornaTelefono.setUbicacion(resultado.getString("Ubicacion"));
                retornaTelefono.setIdPersona(resultado.getInt("Persona_idPersona"));
                retornaTelefono.setHabilitada(resultado.getBoolean("Habilitado"));

            }
            smtp.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return retornaTelefono;
    }

    @Override
    public boolean AgregarDireccion(DireccionBean direccionnueva) {

        try {
            String insertDireccion = "INSERT INTO `listacontactosdb`.`direcciones` "
                    + " (`Direccion`,`Persona_idPersona`,`Habilitado`) VALUES (?,?,?);";

            PreparedStatement insercion = conectar().prepareStatement(insertDireccion);
            insercion.setString(1, direccionnueva.getDireccion());
            insercion.setInt(2, direccionnueva.getIdpersona());
            insercion.setBoolean(3, direccionnueva.isHabilitada());
            insercion.executeUpdate();

            return true;

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    @Override
    public boolean EliminarDireccion(int iddirecciones, int idpersona) {

        DireccionBean dir = BuscarDireccion(iddirecciones, idpersona);
        dir.setHabilitada(false);
        ActualizarDireccion(dir);
        return true;
    }

    @Override
    public void ActualizarDireccion(DireccionBean actuaizadir) {

        try {
            String actualizaDireccion = "UPDATE `listacontactosdb`.`direcciones` SET "
                    + " `Direccion` = ? , `Persona_idPersona` = ?, `Habilitado`=?"
                    + " WHERE `idDirecciones` =?";

            PreparedStatement actua = conectar().prepareStatement(actualizaDireccion);
            actua.setString(1, actuaizadir.getDireccion());
            actua.setInt(2, actuaizadir.getIdpersona());
            actua.setBoolean(3, actuaizadir.isHabilitada());
            actua.setInt(5, actuaizadir.getId());
            actua.executeUpdate();

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public DireccionBean BuscarDireccion(int iddirecciones, int idpersona) {

        DireccionBean retornaDireccion;
        retornaDireccion = new DireccionBean(null, 0);
        try {
            String selectDireccion = " SELECT `idDirecciones`,`Direccion`,`Persona_idPersona`,`Habilitado`"
                    + " FROM `listacontactosdb`.`telefonos` "
                    + " WHERE `idPersona` =" + idpersona
                    + " AND `idDirecciones` = " + iddirecciones + ";";
            Statement smtp = conectar().createStatement();
            ResultSet resultado = smtp.executeQuery(selectDireccion);
            while (resultado.next()) {

                retornaDireccion.setId(resultado.getInt("idDirecciones"));
                retornaDireccion.setDireccion(resultado.getString("Direccion"));
                retornaDireccion.setIdpersona(resultado.getInt("Persona_idPersona"));
                retornaDireccion.setHabilitada(resultado.getBoolean("Habilitado"));

            }
            smtp.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return retornaDireccion;

    }

    @Override
    public boolean AgregarDireccionElectronica(CorreoElectronicoBean correoenuevo) {

        try {
            String insertDireccionEE = "INSERT INTO `listacontactosdb`.`correoselectronicos` "
                    + " (`CorreoElectronico`,`Persona_idPersona`,`Habilitado`) VALUES (?,?,?);";

            PreparedStatement insercion = conectar().prepareStatement(insertDireccionEE);
            insercion.setString(1, correoenuevo.getCorreoElectronico());
            insercion.setInt(2, correoenuevo.getIdpersona());
            insercion.setBoolean(3, correoenuevo.isHabilitada());
            insercion.executeUpdate();

            return true;

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;

    }

    @Override
    public boolean EliminarDireccionElectronica(int iddireccionee, int idpersona) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void ActualizarDireccionElectronica(CorreoElectronicoBean actuaizadiree) {

        try {
            String actualizaDireccion = "UPDATE `listacontactosdb`.`direcciones` SET "
                    + "`CorreoElectronico` = ? , `Persona_idPersona` = ?, `Habilitado`=?"
                    + " WHERE `idDirecciones` =?";

            PreparedStatement actua = conectar().prepareStatement(actualizaDireccion);
            actua.setString(1, actuaizadiree.getCorreoElectronico());
            actua.setInt(2, actuaizadiree.getIdpersona());
            actua.setBoolean(3, actuaizadiree.isHabilitada());
            actua.setInt(5, actuaizadiree.getId());
            actua.executeUpdate();

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public CorreoElectronicoBean BuscarDireccionElectronica(int iddireccionee, int idpersona) {

        CorreoElectronicoBean retornaCorreoElectronico;
        retornaCorreoElectronico = new CorreoElectronicoBean(null, 0);
        try {
            String selectDireccion = " SELECT `idCorreosElectronicos`,`CorreoElectronico`,`Persona_idPersona`,`Habilitado`"
                    + " FROM `listacontactosdb`.`correoselectronicos` "
                    + " WHERE `idPersona` =" + idpersona
                    + " AND `idCorreosElectronicos` = " + iddireccionee + ";";

            Statement smtp = conectar().createStatement();
            ResultSet resultado = smtp.executeQuery(selectDireccion);
            while (resultado.next()) {

                retornaCorreoElectronico.setId(resultado.getInt("idCorreosElectronicos"));
                retornaCorreoElectronico.setCorreoElectronico(resultado.getString("CorreoElectronico"));
                retornaCorreoElectronico.setIdpersona(resultado.getInt("Persona_idPersona"));
                retornaCorreoElectronico.setHabilitada(resultado.getBoolean("Habilitado"));

            }
            smtp.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return retornaCorreoElectronico;

    }

}
