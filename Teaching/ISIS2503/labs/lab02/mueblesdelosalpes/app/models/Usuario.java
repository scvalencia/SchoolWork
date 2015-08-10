/**
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * $Id$ Usuario.java
 * Universidad de los Andes (Bogotá - Colombia)
 * Departamento de Ingeniería de Sistemas y Computación
 * Licenciado bajo el esquema Academic Free License version 3.0
 *
 * Ejercicio: Muebles de los Alpes
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

package models;

import com.avaje.ebean.Model;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.ArrayList;

/**
 * Clase que representa un usuario del sistema
 * Created by scvalencia606 on 7/31/15.
 */

@Entity
public class Usuario extends Model {

    //-----------------------------------------------------------
    // Atributos
    //-----------------------------------------------------------

    /**
     * Nombre del usuario
     */
    private String login;

    /**
     * Contraseña del usuario
     */
    private String contraseña;

    /**
     * Tipo de usuario
     */
    private TipoUsuario tipoUsuario;

    /**
     * Nombres y apellidos del usuario
     */
    private String nombreCompleto;

    /**
     * Número de documento de identidad
     */
    @Id
    private long documento;

    /**
     * Tipo de documento
     */
    private TipoDocumento tipoDocumento;

    /**
     * Número del teléfono local
     */
    private long telefonoLocal;

    /**
     * Número del teléfono celular
     */
    private long telefonoCelular;

    /**
     * Ciudad de residencia del usuario
     */
    private Ciudad ciudad;

    /**
     * Dirección de residencia del usuario
     */
    private String direccion;

    /**
     * Profesión del usuario
     */
    private Profesion profesion;

    /**
     * Correo electrónico del usuario
     */
    private String correo;

    /**
     * Indica si el mueble fue seleccionado
     */
    private boolean seleccion;

    /**
     * Devuelve un lista con todos las compras del usuario
     */
    private ArrayList<RegistroVenta> compras;

    //-----------------------------------------------------------
    // Constructores
    //-----------------------------------------------------------

    /**
     * Constructor de la clase sin argumentos
     */
    public Usuario() {
    }

    /**
     * Constructor de la clase con argumentos
     * @param login Nombre del usuario
     * @param contraseña Constraseña del usuario
     * @param tipoUsuario Tipo de usuario
     */
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

    //-----------------------------------------------------------
    // Getters y setters
    //-----------------------------------------------------------

    /**
     * Devuelve el nombre de usuario
     * @return nombre Nombre del usuario
     */
    public String getLogin() {
        return login;
    }

    /**
     * Modifica el nombre del usuario
     * @param login Nuevo nombre de usuario
     */
    public void setLogin(String login) {
        this.login = login;
    }

    /**
     * Devuelve la contraseña del usuario
     * @return contraseña Contraseña del usuario
     */
    public String getContraseña() {
        return contraseña;
    }

    /**
     * Modifica la contraseña del usuario
     * @param contraseña Nueva contraseña
     */
    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    /**
     * Devuelve el tipo de usuario
     * @return tipo Tipo de usuario
     */
    public TipoUsuario getTipoUsuario() {
        return tipoUsuario;
    }

    /**
     * Modifica el tipo de usuario
     * @param tipoUsuario Nuevo tipo de usuario
     */
    public void setTipoUsuario(TipoUsuario tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    /**
     * Devuelve el nombre completo del usuario
     * @return nombreCompleto Nombre completo del usuario
     */
    public String getNombreCompleto() {
        return nombreCompleto;
    }

    /**
     * Modifica el nombre de un usuario
     * @param nombreCompleto Nuevo nombre del usuario
     */
    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    /**
     * Devuelve el número de identificación del usuario
     * @return documento Número de identificación del usuario
     */
    public long getDocumento() {
        return documento;
    }

    /**
     * Modifica el número de identificación del usuario
     * @param documento Número de identificación
     */
    public void setDocumento(long documento) {
        this.documento = documento;
    }

    /**
     * Devuelve el tipo de documento que tiene un usuario
     * @return tipoDocumento Tipo de documento del usuario
     */
    public TipoDocumento getTipoDocumento() {
        return tipoDocumento;
    }

    /**
     * Modifica el tipo de documento del usuario
     * @param tipoDocumento Nuevo tipo de documento
     */
    public void setTipoDocumento(TipoDocumento tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    /**
     * Devuelve el número de teléfono local
     * @return telefonoLocal Número de teléfono local
     */
    public long getTelefonoLocal() {
        return telefonoLocal;
    }

    /**
     * Modifica el número del teléfono local del usuario
     * @param telefonoLocal Nuevo número de teléfono
     */
    public void setTelefonoLocal(long telefonoLocal) {
        this.telefonoLocal = telefonoLocal;
    }

    /**
     * Devuelve el número teléfono celular del usuario
     * @return telefonoCelular Número de teléfono celular del cliente
     */
    public long getTelefonoCelular() {
        return telefonoCelular;
    }

    /**
     * Modifica el número de teléfono celular del usuario
     * @param telefonoCelular Nuevo número de teléfono
     */
    public void setTelefonoCelular(long telefonoCelular) {
        this.telefonoCelular = telefonoCelular;
    }

    /**
     * Devuelve la ciudad de residencia del usuario
     * @return ciudad Ciudad de residencia del cliente
     */
    public Ciudad getCiudad() {
        return ciudad;
    }

    /**
     * Modifica la ciudad de residencia del usuario
     * @param ciudad Nueva ciudad de residencia
     */
    public void setCiudad(Ciudad ciudad) {
        this.ciudad = ciudad;
    }

    /**
     * Devuelve la dirección de residencia del usuario
     * @return direccion Dirección de residencia del usuario
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * Modifica la dirección del usuario
     * @param direccion Nueva dirección del usuario
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    /**
     * Devuelve la profesión del usuario
     * @return profesion Profesión del usuario
     */
    public Profesion getProfesion() {
        return profesion;
    }

    /**
     * Modifica la profesión del usuario
     * @param profesion Nueva profesión
     */
    public void setProfesion(Profesion profesion) {
        this.profesion = profesion;
    }

    /**
     * Devuelve el correo electrónico del usuario
     * @return correo Correo electrónico del usuario
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * Modifica el correo electrónico del usuario
     * @param correo Nuevo correo electrónico
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * El usuario se encuentra seleccionado
     * @return selección Estado del usuario
     */
    public boolean isSeleccion() {
        return seleccion;
    }

    /**
     * Modifica el estado de selección del usuario
     * @param seleccion Nuevo estado
     */
    public void setSeleccion(boolean seleccion) {
        this.seleccion = seleccion;
    }

    /**
     * Devuelve las compras realizadas por un cliente
     * @return compras Lista con las compras realizadas por el cliente
     */
    public ArrayList<RegistroVenta> getCompras() {
        return compras;
    }

    /**
     * Modifica las compras realizadas por un cliente
     * @param compras Nueva lista de compras
     */
    public void setCompras(ArrayList<RegistroVenta> compras) {
        this.compras = compras;
    }

    //-----------------------------------------------------------
    // Métodos auxiliares
    //-----------------------------------------------------------

    /**
     * Agrega un registro de venta al usuario
     * @param registro Nuevo registro de venta
     */
    public void agregarRegistro(RegistroVenta registro)
    {
        compras.add(registro);
    }
}
