package models;
import com.avaje.ebean.Model;
import com.fasterxml.jackson.databind.JsonNode;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
/**
 * Created by scvalencia606 on 02/08/2015.
 */

@Entity
public class Ciudad extends Model{
    private String nombre;

    public Ciudad() {
    }

    public Ciudad(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public static Ciudad bind(JsonNode j) {
        String nombre = j.findPath("nombre").asText();
        Ciudad ciudad = new Ciudad(nombre);
        return ciudad;
    }
}
