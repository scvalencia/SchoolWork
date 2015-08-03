package controllers;

import com.fasterxml.jackson.databind.JsonNode;
import models.Ciudad;
import play.*;
import play.libs.Json;
import play.mvc.*;

import views.html.*;

public class Application extends Controller {

    public Result index() {
        return ok(index.render("Your new application is ready."));
    }

}
