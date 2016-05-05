package modelos;

public class CorreoElectronicoBean {

    private int _id;

    private String _correoElectronico;

    private int _idpersona;

    private boolean _habilitada;

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public String getCorreoElectronico() {
        return _correoElectronico;
    }

    public void setCorreoElectronico(String _correoElectronico) {
        this._correoElectronico = _correoElectronico;
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

    public CorreoElectronicoBean(String _correoElectronico, int _idpersona) {
        this._id = 0;
        this._correoElectronico = _correoElectronico;
        this._idpersona = _idpersona;
        this._habilitada = true;
    }
    
}
