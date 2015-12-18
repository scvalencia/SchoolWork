/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniandes.isis2503.competitors.service;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

/**
 *
 * @author Jj.alarcon10
 */
@Path("/administration")
@Produces("text/html")
public class AdminService {

    @GET
    public Response getPageAdmin() {
        int status = 200;
        String html = "<html lang=\\\"en\\\"><body><h1>Acceso a cuentas solo Administrador!</body></h1></html>";
        return Response.status(status).header("Access-Control-Allow-Origin", "*").entity(html).build();
    }
}


