/**
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * $Id$ Vendedor.java
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
import java.util.List;

/**
 * Created by scvalencia606 on 7/31/15.
 */

@Entity
public class Vendedor extends Model {

    //-----------------------------------------------------------
    // Atributos
    //-----------------------------------------------------------

    @Id
    private Long id;

    private String nombres;

    private String apellidos;

    private List<ExperienciaVendedor> experiencia;

    private double salario;

    private double comisionVentas;

    private String perfil;

    private String foto;

    //-----------------------------------------------------------
    // Constructores
    //-----------------------------------------------------------

    public Vendedor() {
        experiencia = new ArrayList<ExperienciaVendedor>();
    }

    public Vendedor(long id, String nombres, String apellidos, List<ExperienciaVendedor> experiencia, double salario, double comisionVentas, String perfil, String foto) {
        this.id = id;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.experiencia = experiencia;
        this.salario = salario;
        this.comisionVentas = comisionVentas;
        this.perfil = perfil;
        this.foto = foto;
    }

    //-----------------------------------------------------------
    // Getters y setters
    //-----------------------------------------------------------

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public List<ExperienciaVendedor> getExperiencia() {
        return experiencia;
    }

    public void setExperiencia(List<ExperienciaVendedor> experiencia) {
        this.experiencia = experiencia;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public double getComisionVentas() {
        return comisionVentas;
    }

    public void setComisionVentas(double comisionVentas) {
        this.comisionVentas = comisionVentas;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
}
