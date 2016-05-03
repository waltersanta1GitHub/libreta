package modelos;

public class PersonaBean {

    private int _id;

    private String _nombre;
    
    private String _documento;

    private String _edad;

    private char _sexo;

    private boolean _habilitada;

    public PersonaBean( String _nombre, String documento, String _edad, char _sexo) {
        this._id = 0;
        this._nombre = _nombre;
        this._documento=documento;
        this._edad = _edad;
        this._sexo = _sexo;
        this._habilitada = true;
    }

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public String getNombre() {
        return _nombre;
    }

    public void setNombre(String _nombre) {
        this._nombre = _nombre;
    }

    public String getEdad() {
        return _edad;
    }

    public void setEdad(String _edad) {
        this._edad = _edad;
    }

    public char getSexo() {
        return _sexo;
    }

    public void setSexo(char _sexo) {
        this._sexo = _sexo;
    }

    public boolean isHabilitada() {
        return _habilitada;
    }

    public void setHabilitada(boolean _habilitada) {
        this._habilitada = _habilitada;
    }

    public String getDocumento() {
        return _documento;
    }

    public void setDocumento(String _documento) {
        this._documento = _documento;
    }

    @Override
    public String toString() {
        return  _id + "," + _nombre + "," + _documento + "," + _edad + "," + _sexo ;
    }
    
    
    
    
}
