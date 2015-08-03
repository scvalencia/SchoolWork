package models;

import com.avaje.ebean.Model;
import javax.persistence.Entity;
import java.util.List;

/**
 * Created by scvalencia606 on 7/31/15.
 */

@Entity
public class Pais extends Model {

    private String nombre;

    private List<Ciudad> ciudades;

    public Pais() {
    }

    public Pais(String nombre, List<Ciudad> ciudades) {
        this.nombre = nombre;
        this.ciudades = ciudades;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public List<Ciudad> getCiudades() {
        return ciudades;
    }

    public void setCiudades(List<Ciudad> ciudades) {
        this.ciudades = ciudades;
    }
}
