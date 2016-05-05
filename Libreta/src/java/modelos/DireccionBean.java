package modelos;

public class DireccionBean {

    private int _id;

    private String _direccion;

    private int _idpersona;

    private boolean _habilitada;

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public String getDireccion() {
        return _direccion;
    }

    public void setDireccion(String _direccion) {
        this._direccion = _direccion;
    }

    public int getIdpersona() {
        return _idpersona;
    }

    public void setIdpersona(int _idpersona) {
        this._idpersona = _idpersona;
    }

    public boolean isHabilitada() {
        return _habilitada;
    }

    public void setHabilitada(boolean _habilitada) {
        this._habilitada = _habilitada;
    }

    public DireccionBean( String _direccion, int _idpersona) {
        this._id = 0;
        this._direccion = _direccion;
        this._idpersona = _idpersona;
        this._habilitada = true;
    }
    
    
}
