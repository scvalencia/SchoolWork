/**
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * $Id$ ExperienciaVendedor.java
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
 * Clase que modela un ìtem de experiencia de vendedor.
 * Created by scvalencia606 on 8/3/15.
 */

@Entity
public class ExperienciaVendedor extends Model {

    //-----------------------------------------------------------
    // Atributos
    //-----------------------------------------------------------

    /**
     * Identificador del item de experiencia.
     */
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    public Long id;


    /**
     * Nombre de la empresa que ceritifica la experiencia laboral.
     */
    private String nombreEmpesa;

    /**
     * Cargo que el empleado ocupó en la empresa.
     */
    private String cargo;

    /**
     * Descripción de las funciones del cargo.
     */
    private String descripcion;

    /**
     * Año de terminación del vínculo laboral.
     */
    private int ano;

    //-----------------------------------------------------------
    // Constructores
    //-----------------------------------------------------------

    /**
     * Constructor de la clase sin argumentos
     */
    public ExperienciaVendedor() {
    }

    /**
     * Constructor de la clase con argumentos
     * @param nombreEmpesa Nombre de la empresa
     * @param cargo Cargo ocupado
     * @param descripcion Descripción de las funcionaes del cargo
     * @param ano Año de terminación del vínculo laboral
     */
    public ExperienciaVendedor(String nombreEmpesa, String cargo, String descripcion, int ano) {
        this.nombreEmpesa = nombreEmpesa;
        this.cargo = cargo;
        this.descripcion = descripcion;
        this.ano = ano;
    }

    //-----------------------------------------------------------
    // Getters y setters
    //-----------------------------------------------------------

    /**
     * Devuelve el identificador único del vendedor
     * @return id Identificador del vendedor
     */
    public Long getId() {
        return id;
    }

    /**
     * Modifica el identificador único del jugador
     * @param id Nuevo identificador del vendedor
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * Devuelve el nombre de la empresa que certifica la experiencia laboral
     * del vendedor
     * @return nombreEmpresa Nombre de la empresa certificadora
     */
    public String getNombreEmpesa() {
        return nombreEmpesa;
    }

    /**
     * Modifica el nombre de la empresa que certifica la experiencia laboral
     * del vendedor
     * @param nombreEmpesa Nuevo nombre de la empresa certificadora
     */
    public void setNombreEmpesa(String nombreEmpesa) {
        this.nombreEmpesa = nombreEmpesa;
    }

    /**
     * Devuelve el cargo del vendedor
     * @return cargo Cargo del vendedor
     */
    public String getCargo() {
        return cargo;
    }

    /**
     * Modifica el cargo de un vendedor
     * @param cargo Nuevo cargo
     */
    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    /**
     * Devuelve la descripción del vendedor
     * @return descripcion Descripción del vendedor
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * Modifica la descripción del vendedor
     * @param descripcion Nueva descripción del vendedor
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * Devuelve el año de terminación del vínculo laboral
     * @return ano Año de terminación del vínculo laboral
     */
    public int getAno() {
        return ano;
    }

    /**
     * Modifica el año de terminación del vínculo laboral
     * @param ano Nuevo año de terminación de vínculo
     */
    public void setAno(int ano) {
        this.ano = ano;
    }

    //-----------------------------------------------------------
    // Métodos auxiliares
    //-----------------------------------------------------------

    /**
     * Crea un objeto ExperienciaVendedor apartir de un nodo Json
     * @param j Nodo Json con atributos y valores de un objeto ExperienciaVendedor
     */
    public static ExperienciaVendedor bind(JsonNode j) {
        String nombreEmpesa = j.findPath("nombreEmpresa").asText();
        String cargo = j.findPath("cargo").asText();
        String descripcion = j.findPath("descripcion").asText();
        int ano = j.findPath("año").asInt();
        ExperienciaVendedor experienciaVendedor = new ExperienciaVendedor(nombreEmpesa, cargo, descripcion, ano);
        return experienciaVendedor;
    }

    /**
     * Actualiza el objeto actual con la información del objeto pasado por parámetro
     * @param nuevaExperiencia un objeto ExperienciaVendedor, para actualizar this
     */
    public void update(ExperienciaVendedor nuevaExperiencia) {
        this.setNombreEmpesa((nuevaExperiencia.getNombreEmpesa()));
        this.setCargo(nuevaExperiencia.getCargo());
        this.setDescripcion(nuevaExperiencia.descripcion);
        this.setAno(nuevaExperiencia.ano);
    }
}

