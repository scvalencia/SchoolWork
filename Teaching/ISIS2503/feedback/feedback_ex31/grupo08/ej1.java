
/**
 *Metodo que retorna un valor booleano diciendo si fue posible acceder o no con los credenciales dados
 *Si no fue posible se devuelve false
 *Si fue posible se devuelve true
 *Se lleva un contador (FailedLoginAttempts)
 *Si el contador es mayor o igual a 3, el usuario se bloquea. 
 */
public bool Login(string username, string password) 
{

	//Variable usuario. Busca en la base de datos el usuario que entra.
    var user = userRepo.GetUserByUsername(username);
    //Si el usuario existe
    if(user != null)
    {
    	if (loginValidator.IsValid(user, password))
    	{
    		return true;
    	}
    	else
    	{
    		user.FailedLoginAttempts++;
    	    if (user.FailedLoginAttempts >= 3)
    	    	user.LockedOut = true;
    	}
    }
    //cualquier otro caso.
    return false;
}