package controllers;

import com.avaje.ebean.Model;
import models.Usuario;
import play.libs.Json;
import play.mvc.Controller;
import play.mvc.Result;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by scvalencia606 on 8/10/15.
 */
public class UsuarioController extends Controller {

    public Result read() throws IOException {
        List<Usuario> usuarios = new Model.Finder(String.class, Usuario.class).all();

        try {

            String content = "This is the content to write into file";

            File file = new File("files/ughhh.txt");

            // if file doesnt exists, then create it
            if (!file.exists()) {
                file.createNewFile();
            }

            FileWriter fw = new FileWriter(file.getAbsoluteFile());
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(content);
            bw.close();

            System.out.println("Done");
            return ok(file);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return ok(Json.toJson(usuarios));

    }
}
