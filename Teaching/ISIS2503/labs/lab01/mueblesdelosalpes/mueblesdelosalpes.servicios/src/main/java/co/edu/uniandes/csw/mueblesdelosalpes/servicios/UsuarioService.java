/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniandes.csw.mueblesdelosalpes.servicios;
import co.edu.uniandes.csw.mueblesdelosalpes.dto.Usuario;
import co.edu.uniandes.csw.mueblesdelosalpes.logica.interfaces.IServicioUsuarioMockLocal;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author scvalencia606
 */
@Path("/Usuario")
@Stateless
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class UsuarioService {
    
    @EJB
    private IServicioUsuarioMockLocal usuarioEjb;
    
    @GET
    @Path("usuarios/")
    public List<Usuario> getTodosLosUsuarios() {
        return usuarioEjb.darUsuarios();
 
    }
    
    @POST
    @Path("agregar/") 
    public List<Usuario> agregarUsuarios(List<Usuario> us) {
        for (Usuario usuario : us) {
            usuarioEjb.agregarUsuario(usuario);
        }        
        return us;
    }
 
}

