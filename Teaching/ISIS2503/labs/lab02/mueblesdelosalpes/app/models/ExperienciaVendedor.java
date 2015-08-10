package models;

import com.avaje.ebean.Model;
import com.fasterxml.jackson.databind.JsonNode;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Clase que modela un ìtem de experiencia de vendedor.
 * Created by scvalencia606 on 8/3/15.
 */

@Entity
public class ExperienciaVendedor extends Model {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    public Long id;

    private String nombreEmpesa;

    private String cargo;

    private String descripcion;

    private int ano;

    public ExperienciaVendedor() {
    }

    public ExperienciaVendedor(String nombreEmpesa, String cargo, String descripcion, int ano) {
        this.nombreEmpesa = nombreEmpesa;
        this.cargo = cargo;
        this.descripcion = descripcion;
        this.ano = ano;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombreEmpesa() {
        return nombreEmpesa;
    }

    public void setNombreEmpesa(String nombreEmpesa) {
        this.nombreEmpesa = nombreEmpesa;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public static ExperienciaVendedor bind(JsonNode j) {
        String nombreEmpesa = j.findPath("nombreEmpresa").asText();
        String cargo = j.findPath("cargo").asText();
        String descripcion = j.findPath("descripcion").asText();
        int ano = j.findPath("año").asInt();
        ExperienciaVendedor experienciaVendedor = new ExperienciaVendedor(nombreEmpesa, cargo, descripcion, ano);
        return experienciaVendedor;
    }

    public void update(ExperienciaVendedor nuevaExperiencia) {
        this.setNombreEmpesa((nuevaExperiencia.getNombreEmpesa()));
        this.setCargo(nuevaExperiencia.getCargo());
        this.setDescripcion(nuevaExperiencia.descripcion);
        this.setAno(nuevaExperiencia.ano);
    }
}

