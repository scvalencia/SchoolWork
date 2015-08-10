package models;

import com.avaje.ebean.Model;
import com.fasterxml.jackson.databind.JsonNode;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by scvalencia606 on 7/29/15.
 */

@Entity
public class Mueble extends Model {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long referencia;

    private String nombre;

    private String descripcion;

    private TipoMueble tipo;

    private double precio;

    private String imagen;

    private int cantidad;

    private boolean seleccion;

    public Mueble() {
    }

    public Mueble(String nombre, String descripcion, TipoMueble tipo, double precio, String imagen, int cantidad, boolean seleccion) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.tipo = tipo;
        this.precio = precio;
        this.imagen = imagen;
        this.cantidad = cantidad;
        this.seleccion = seleccion;
    }

    public Long getReferencia() {
        return referencia;
    }

    public void setReferencia(Long referencia) {
        this.referencia = referencia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public TipoMueble getTipo() {
        return tipo;
    }

    public void setTipo(TipoMueble tipo) {
        this.tipo = tipo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public boolean isSeleccion() {
        return seleccion;
    }

    public void setSeleccion(boolean seleccion) {
        this.seleccion = seleccion;
    }

    public void incrementarCantidad() {
        cantidad++;
    }

    public void reducirCantidad() {
        cantidad--;
    }

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
