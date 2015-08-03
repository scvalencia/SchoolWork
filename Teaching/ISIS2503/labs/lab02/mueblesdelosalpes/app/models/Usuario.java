package models;

import com.avaje.ebean.Model;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.ArrayList;

/**
 * Created by scvalencia606 on 7/31/15.
 */

@Entity
public class Usuario extends Model {

    private String login;

    private String contraseña;

    private TipoUsuario tipoUsuario;

    private String nombreCompleto;

    @Id
    private long documento;

    private TipoDocumento tipoDocumento;

    private long telefonoLocal;

    private long telefonoCelular;

    private Ciudad ciudad;

    private String direccion;

    private Profesion profesion;

    private String correo;

    private boolean seleccion;

    private ArrayList<RegistroVenta> compras;

    public Usuario() {
    }

    public Usuario(String login, String contraseña, TipoUsuario tipoUsuario, String nombreCompleto, long documento,
                   TipoDocumento tipoDocumento, long telefonoLocal, long telefonoCelular, Ciudad ciudad, String direccion,
                   Profesion profesion, String correo, boolean seleccion, ArrayList<RegistroVenta> compras) {
        this.login = login;
        this.contraseña = contraseña;
        this.tipoUsuario = tipoUsuario;
        this.nombreCompleto = nombreCompleto;
        this.documento = documento;
        this.tipoDocumento = tipoDocumento;
        this.telefonoLocal = telefonoLocal;
        this.telefonoCelular = telefonoCelular;
        this.ciudad = ciudad;
        this.direccion = direccion;
        this.profesion = profesion;
        this.correo = correo;
        this.seleccion = seleccion;
        this.compras = compras;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public TipoUsuario getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(TipoUsuario tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public long getDocumento() {
        return documento;
    }

    public void setDocumento(long documento) {
        this.documento = documento;
    }

    public TipoDocumento getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(TipoDocumento tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public long getTelefonoLocal() {
        return telefonoLocal;
    }

    public void setTelefonoLocal(long telefonoLocal) {
        this.telefonoLocal = telefonoLocal;
    }

    public long getTelefonoCelular() {
        return telefonoCelular;
    }

    public void setTelefonoCelular(long telefonoCelular) {
        this.telefonoCelular = telefonoCelular;
    }

    public Ciudad getCiudad() {
        return ciudad;
    }

    public void setCiudad(Ciudad ciudad) {
        this.ciudad = ciudad;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Profesion getProfesion() {
        return profesion;
    }

    public void setProfesion(Profesion profesion) {
        this.profesion = profesion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public boolean isSeleccion() {
        return seleccion;
    }

    public void setSeleccion(boolean seleccion) {
        this.seleccion = seleccion;
    }

    public ArrayList<RegistroVenta> getCompras() {
        return compras;
    }

    public void setCompras(ArrayList<RegistroVenta> compras) {
        this.compras = compras;
    }
}
