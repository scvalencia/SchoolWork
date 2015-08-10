/**
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * $Id$ Mueble.java
 * Universidad de los Andes (Bogotá - Colombia)
 * Departamento de Ingeniería de Sistemas y Computación
 * Licenciado bajo el esquema Academic Free License version 3.0
 *
 * Ejercicio: Muebles de los Alpes
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

package models;

import com.avaje.ebean.Model;
import com.fasterxml.jackson.databind.JsonNode;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Clase que representa la información de un mueble en el sistema
 * Created by scvalencia606 on 7/29/15.
 */

@Entity
public class Mueble extends Model {

    //-----------------------------------------------------------
    // Atributos
    //-----------------------------------------------------------

    /**
     * Referencia que identifica el modelo del mueble en el sistema.
     */
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long referencia;

    /**
     * Nombre del mueble.
     */
    private String nombre;

    /**
     * Descripción del mueble.
     */
    private String descripcion;

    /**
     * Tipo de mueble.
     */
    private TipoMueble tipo;

    /**
     * Precio del mueble
     */
    private double precio;

    /**
     * Nombre de la imágen
     */
    private String imagen;

    /**
     * Cantidad de items
     */
    private int cantidad;

    /**
     * Indica si el mueble fue seleccionado
     */
    private boolean seleccion;

    //-----------------------------------------------------------
    // Constructores
    //-----------------------------------------------------------

    /**
     * Constructor sin argumentos de la clase
     */
    public Mueble() {
    }

    /**
     * Constructor de la clase. Inicializa los atributos con los valores que ingresan por parametro.
     * @param nombre Nombre del mueble
     * @param descripcion Descripión del mueble
     * @param tipo Tipo de mueble
     * @param cantidad Cantidad de ejemplares
     */
    public Mueble(String nombre, String descripcion, TipoMueble tipo, double precio, String imagen, int cantidad, boolean seleccion) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.tipo = tipo;
        this.precio = precio;
        this.imagen = imagen;
        this.cantidad = cantidad;
        this.seleccion = seleccion;
    }

    //-----------------------------------------------------------
    // Getters y setters
    //-----------------------------------------------------------

    /**
     * Devuelve la referencia del mueble
     * @return referencia Referencia del mueble
     */
    public Long getReferencia() {
        return referencia;
    }

    /**
     * Modifica la referencia del mueble
     * @param referencia Nueva referencia del mueble
     */
    public void setReferencia(Long referencia) {
        this.referencia = referencia;
    }

    /**
     * Devuelve el nombre del mueble
     * @return nombre Nombre del mueble
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Modifica el nombre del mueble
     * @param nombre Nuevo nombre del mueble
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Devuelve la descripción del mueble
     * @return descripcion Descripción del mueble
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * Modifica la descripción del mueble
     * @param descripcion Nueva descripción del mueble
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * Devuelve el tipo de mueble
     * @return tipo Tipo de mueble
     */
    public TipoMueble getTipo() {
        return tipo;
    }

    /**
     * Modifica el tipo de mueble
     * @param tipo Nuevo tipo de mueble
     */
    public void setTipo(TipoMueble tipo) {
        this.tipo = tipo;
    }

    /**
     * Devuelve el precio del mueble
     * @return precio Precio del mueble
     */
    public double getPrecio() {
        return precio;
    }

    /**
     * Modifica el precio del mueble
     * @param precio Nuevo precio del mueble
     */
    public void setPrecio(double precio) {
        this.precio = precio;
    }

    /**
     * Nombre de la imagen
     * @return imagen Nombre de la imagen
     */
    public String getImagen() {
        return imagen;
    }

    /**
     * Modifica el nombre de la imagen
     * @param imagen Nuevo nombre de imagen
     */
    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    /**
     * Devuelve la cantidad de ejemplares de un mueble
     * @return cantidad Cantidad de muebles
     */
    public int getCantidad() {
        return cantidad;
    }

    /**
     * Modifica la cantidad de ejemplares de un mueble
     * @param cantidad Nueva cantidad de muebles
     */
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    /**
     * Devuelve el estado de selección del mueble
     * @return seleccion Verdadero o falso
     */
    public boolean isSeleccion() {
        return seleccion;
    }

    /**
     * Cambia el estado de selección de un mueble
     * @param seleccion Nuevo estado de selección
     */
    public void setSeleccion(boolean seleccion) {
        this.seleccion = seleccion;
    }

    //-----------------------------------------------------------
    // Métodos auxiliares
    //-----------------------------------------------------------

    /**
     * Aumenta la cantidad de muebles
     */
    public void incrementarCantidad() {
        cantidad++;
    }

    /**
     * Reduce la cantidad de muebles
     */
    public void reducirCantidad() {
        cantidad--;
    }

    /**
     * Crea un objeto Mueble apartir de un nodo Json
     * @param j Nodo Json con atributos y valores de un objeto Mueble
     */
    public static Mueble bind(JsonNode j) {
        String nombre = j.findPath("nombre").asText();
        String descripcion = j.findPath("descripcion").asText();
        TipoMueble tipo = TipoMueble.valueOf(j.findPath("tipo").asText());
        double precio = j.findPath("precio").asDouble();
        String imagen = j.findPath("imagen").asText();
        int cantidad = j.findPath("cantidad").asInt();
        boolean seleccion = j.findPath("seleccion").asBoolean();
        Mueble mueble = new Mueble(nombre, descripcion, tipo, precio, imagen, cantidad, seleccion);
        return mueble;
    }
}
