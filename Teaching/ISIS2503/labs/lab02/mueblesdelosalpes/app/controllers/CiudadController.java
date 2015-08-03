package controllers;

import com.avaje.ebean.Model;
import com.fasterxml.jackson.databind.JsonNode;
import models.Ciudad;
import play.libs.Json;
import play.mvc.BodyParser;
import play.mvc.Controller;
import play.mvc.Result;

import java.util.List;

/**
 * Created by scvalencia606 on 8/3/15.
 */

public class CiudadController extends Controller {

    @BodyParser.Of(BodyParser.Json.class)
    public Result create() {
        JsonNode j = Controller.request().body().asJson();
        Ciudad ciudad = Ciudad.bind(j);
        ciudad.save();
        return ok(Json.toJson(ciudad));
    }

    public Result read() {
        List<Ciudad> ciudades = new Model.Finder(String.class, Ciudad.class).all();
        return ok(Json.toJson(ciudades));
    }
}
