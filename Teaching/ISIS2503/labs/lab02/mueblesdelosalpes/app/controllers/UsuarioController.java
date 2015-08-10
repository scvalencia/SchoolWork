package controllers;

import com.avaje.ebean.Model;
import models.Usuario;
import play.libs.Json;
import play.mvc.Controller;
import play.mvc.Result;

import java.util.List;

/**
 * Created by scvalencia606 on 8/10/15.
 */
public class UsuarioController extends Controller {

    public Result read() {
        List<Usuario> usuarios = new Model.Finder(String.class, Usuario.class).all();
        return ok(Json.toJson(usuarios));
    }
}
