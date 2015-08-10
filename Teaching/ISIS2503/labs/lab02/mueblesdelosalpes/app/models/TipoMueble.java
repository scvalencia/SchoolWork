package models;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by scvalencia606 on 7/29/15.
 */

public enum TipoMueble {
    Interior,
    Exterior;

    private static Map<String, TipoMueble> namesMap = new HashMap<String, TipoMueble>(2);

    static {
        namesMap.put("interior", Interior);
        namesMap.put("exterior", Exterior);
    }

    @JsonCreator
    public static TipoMueble forValue(String value) {
        return namesMap.get(StringUtils.lowerCase(value));
    }

    @JsonValue
    public String toValue() {
        for (Map.Entry<String, TipoMueble> entry : namesMap.entrySet()) {
            if (entry.getValue() == this)
                return entry.getKey();
        }

        return null;
    }
}
