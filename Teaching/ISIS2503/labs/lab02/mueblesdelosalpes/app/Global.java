import com.avaje.ebean.Model;
import play.*;
import play.libs.*;
import com.avaje.ebean.Ebean;
import models.*;
import java.util.*;

/**
 * Created by scvalencia606 on 8/10/15.
 */

public class Global extends GlobalSettings {
    @Override
    public void onStart(Application app) {
        List<Usuario> usuarios = new Model.Finder(String.class, Usuario.class).all();
        if (usuarios.size() == 0) {
            Usuario nuevo = new Usuario();
            nuevo.setLogin("e.baez10");
            nuevo.setContraseña("adminadmin");
            nuevo.setTipoUsuario(TipoUsuario.Administrador);
            nuevo.setNombreCompleto("Ernesto Baez");
            nuevo.setDocumento(325254524);
            nuevo.setTipoDocumento(TipoDocumento.CC);
            nuevo.setTelefonoLocal(7345621);
            nuevo.setTelefonoCelular(5429065);
            nuevo.setCiudad(new Ciudad("Bogotá"));
            nuevo.setDireccion("Cll 170a Cr 40-d 45");
            nuevo.setProfesion(Profesion.Diseñador);
            nuevo.setCorreo("e.baez@gmail.com");
            nuevo.setSeleccion(false);
            nuevo.save();
        }
    }
}
