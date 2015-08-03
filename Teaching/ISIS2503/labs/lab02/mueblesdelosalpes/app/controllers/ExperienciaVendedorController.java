package controllers;

import com.avaje.ebean.Model;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import models.Ciudad;
import models.ExperienciaVendedor;
import play.libs.Json;
import play.mvc.BodyParser;
import play.mvc.Controller;
import play.mvc.Result;

import java.util.List;

/**
 * Created by scvalencia606 on 8/3/15.
 */

public class ExperienciaVendedorController extends Controller {

    @BodyParser.Of(BodyParser.Json.class)
    public Result create() {
        JsonNode j = Controller.request().body().asJson();
        ExperienciaVendedor experienciaVendedor = ExperienciaVendedor.bind(j);
        experienciaVendedor.save();
        return ok(Json.toJson(experienciaVendedor));
    }

    public Result read() {
        List<ExperienciaVendedor> experiencias = new Model.Finder(String.class, ExperienciaVendedor.class).all();
        return ok(Json.toJson(experiencias));
    }

    public Result get(Long id) {
        ExperienciaVendedor experienciaVendedor = (ExperienciaVendedor) new Model.Finder(Long.class, ExperienciaVendedor.class).byId(id);
        ObjectNode result = Json.newObject();
        if(experienciaVendedor == null)
            return ok(Json.toJson(result));
        else {
            return ok(Json.toJson(experienciaVendedor));
        }
    }

    @BodyParser.Of(BodyParser.Json.class)
    public Result update(Long id) {
        JsonNode j = Controller.request().body().asJson();
        ExperienciaVendedor experienciaVendedorVieja = (ExperienciaVendedor) new Model.Finder(Long.class, ExperienciaVendedor.class).byId(id);
        ObjectNode result = Json.newObject();
        if(experienciaVendedorVieja == null)
            return ok(Json.toJson(result));
        else {
            ExperienciaVendedor experienciaVendedorNueva;
            experienciaVendedorNueva = ExperienciaVendedor.bind(j);
            experienciaVendedorVieja.update(experienciaVendedorNueva);
            experienciaVendedorVieja.save();
            return ok(Json.toJson(experienciaVendedorVieja));
        }
    }
}
