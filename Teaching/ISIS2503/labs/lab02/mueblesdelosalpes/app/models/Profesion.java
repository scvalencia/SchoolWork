/**
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * $Id$ Profesion.java
 * Universidad de los Andes (Bogotá - Colombia)
 * Departamento de Ingeniería de Sistemas y Computación
 * Licenciado bajo el esquema Academic Free License version 3.0
 *
 * Ejercicio: Muebles de los Alpes
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

package models;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * Enumeración con las posibles profesiones en el sistema
 * Created by scvalencia606 on 7/31/15.
 */

public enum Profesion {
    Abogado,
    Arquitecto,
    Administrador,
    Diseñador,
    Economista,
    Estudiante,
    Médico,
    Ingeniero;

    private static Map<String, Profesion> namesMap = new HashMap<String, Profesion>(8);

    static {
        namesMap.put("abogado", Abogado);
        namesMap.put("arquitecto", Arquitecto);
        namesMap.put("administrador", Administrador);
        namesMap.put("diseñador", Diseñador);
        namesMap.put("economista", Economista);
        namesMap.put("estudiante", Estudiante);
        namesMap.put("médico", Médico);
        namesMap.put("ingeniero", Ingeniero);
    }

    @JsonCreator
    public static Profesion forValue(String value) {
        return namesMap.get(StringUtils.lowerCase(value));
    }

    @JsonValue
    public String toValue() {
        for (Map.Entry<String, Profesion> entry : namesMap.entrySet()) {
            if (entry.getValue() == this)
                return entry.getKey();
        }

        return null;
    }
}
