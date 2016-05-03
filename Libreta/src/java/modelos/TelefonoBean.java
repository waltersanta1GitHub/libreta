package modelos;

public class TelefonoBean {

    private int _id;

    private String _telefono;
    
    private String _ubicacion;

    public String getUbicacion() {
        return _ubicacion;
    }

    public void setUbicacion(String _ubicacion) {
        this._ubicacion = _ubicacion;
    }

     private int _idPersona;
    
    private boolean _habilitada;

    public TelefonoBean( String _telefono, int _idpresona, String _ubicacion) {
        this._id = 0;
        this._telefono = _telefono;
        this._idPersona = _idpresona;
        this._ubicacion = _ubicacion;
        this._habilitada = true;
    }

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public String getTelefono() {
        return _telefono;
    }

    public void setTelefono(String _telefono) {
        this._telefono = _telefono;
    }

    public int getIdPersona() {
        return _idPersona;
    }

    public void setIdPersona(int _idPersona) {
        this._idPersona = _idPersona;
    }

    public boolean isHabilitada() {
        return _habilitada;
    }

    public void setHabilitada(boolean _habilitada) {
        this._habilitada = _habilitada;
    }
    
    
    
}
