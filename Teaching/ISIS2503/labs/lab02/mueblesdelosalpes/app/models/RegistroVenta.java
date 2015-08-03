package models;

import com.avaje.ebean.Model;
import javax.persistence.Entity;
import java.util.Date;

/**
 * Created by scvalencia606 on 7/31/15.
 */

@Entity
public class RegistroVenta extends Model {

    private Date fechaVenta;

    private Mueble producto;

    private int cantidad;

    private String ciudad;

    private Usuario comprador;

    public RegistroVenta() {
    }

    public RegistroVenta(Date fechaVenta, Mueble producto, int cantidad, String ciudad, Usuario comprador) {
        this.fechaVenta = fechaVenta;
        this.producto = producto;
        this.cantidad = cantidad;
        this.ciudad = ciudad;
        this.comprador = comprador;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public Mueble getProducto() {
        return producto;
    }

    public void setProducto(Mueble producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public Usuario getComprador() {
        return comprador;
    }

    public void setComprador(Usuario comprador) {
        this.comprador = comprador;
    }
}
