/**
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * $Id$ TipoDocumento.java
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
 * Enumeración con las posibles tipos de documento en el sistema
 * Created by scvalencia606 on 7/31/15.
 */

public enum TipoDocumento {
    CC,
    TarjetaIdentidad;

    private static Map<String, TipoDocumento> namesMap = new HashMap<String, TipoDocumento>(2);

    static {
        namesMap.put("cc", CC);
        namesMap.put("ti", TarjetaIdentidad);
    }

    @JsonCreator
    public static TipoDocumento forValue(String value) {
        return namesMap.get(StringUtils.lowerCase(value));
    }

    @JsonValue
    public String toValue() {
        for (Map.Entry<String, TipoDocumento> entry : namesMap.entrySet()) {
            if (entry.getValue() == this)
                return entry.getKey();
        }

        return null;
    }
}
