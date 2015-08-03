/**
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * $Id$ IServicioRegistroMockRemote.java
 * Universidad de los Andes (Bogotá - Colombia)
 * Departamento de Ingeniería de Sistemas y Computación
 * Licenciado bajo el esquema Academic Free License version 3.0
 *
 * Ejercicio: Muebles de los Alpes
 * Autor: Juan Sebastián Urrego
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

package co.edu.uniandes.csw.mueblesdelosalpes.logica.interfaces;


import co.edu.uniandes.csw.mueblesdelosalpes.dto.Usuario;
import co.edu.uniandes.csw.mueblesdelosalpes.excepciones.OperacionInvalidaException;
import java.util.List;

/**
 * Contrato funcional de los servicios de autenticación en el sistema
 * @author Juan Sebastián Urrego
 */
public interface IServicioRegistroMockRemote
{
    /**
     * Verifica y registra un usuario en el sistema
     * @param u Usuario a persistir
     */
    public void registrar(Usuario u)throws OperacionInvalidaException;

    /**
     * Elimina un cliente del sistema dado su login
     * @param login Login único del usuario
     * @throws OperacionInvalidaException Excepción en caso de error operacional
     */
    public void eliminarCliente(String login) throws OperacionInvalidaException;

    /**
     * Devuelve todos los clientes del sistema
     * @return usuarios Lista con todos los usuarios del sistema
     */
    public List<Usuario> darClientes();
}
