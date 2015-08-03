/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniandes.csw.mueblesdelosalpes.logica.ejb;

import co.edu.uniandes.csw.mueblesdelosalpes.dto.Usuario;
import co.edu.uniandes.csw.mueblesdelosalpes.excepciones.OperacionInvalidaException;
import co.edu.uniandes.csw.mueblesdelosalpes.logica.interfaces.IServicioPersistenciaMockLocal;
import co.edu.uniandes.csw.mueblesdelosalpes.logica.interfaces.IServicioUsuarioMockLocal;
import co.edu.uniandes.csw.mueblesdelosalpes.logica.interfaces.IServicioUsuarioMockRemote;
import co.edu.uniandes.csw.mueblesdelosalpes.persistencia.mock.ServicioPersistenciaMock;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;

/**
 *
 * @author scvalencia606
 */
@Stateless
public class ServicioUsuarioMock implements IServicioUsuarioMockLocal{
    private IServicioPersistenciaMockLocal persistencia;

    public ServicioUsuarioMock()
    {
        persistencia=new ServicioPersistenciaMock();
  
    }
 
    public void agregarUsuario(Usuario usuario)
    {
        
        try
        {
            persistencia.create(usuario);
        }
        catch (OperacionInvalidaException ex)
        {
            Logger.getLogger(ServicioCatalogoMock.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }
   
    public List<Usuario> darUsuarios()
    {
        return persistencia.findAll(Usuario.class);
    }

    
}
