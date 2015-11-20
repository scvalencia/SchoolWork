	/**
	 * Método encargado de realizar el login de un usuario. Retorna true  si el login fue exitoso, false de lo contrario.
	 * El usuario se bloquea si se realizan 3  intentos fallidos de login. 
	 *
	 */
	public bool Login(string username, string password) 
	{
	     // Retorna false por defecto. Si el usuario logra conectarse   devuelve true.
		bool respuesta = false;

		var user = userRepo.GetUserByUsername(username);

	    
	    if(user != null) // si el usuario existe	
	    {
	    		
			if (loginValidator.IsValid(user, password)) // El usuario es valido
				respuesta = true;
			
			else // El usuario no es valido
			{
				user.FailedLoginAttempts++;
	
		    	if (user.FailedLoginAttempts >= 3) // si es el tercer intento fallido de conectarse
		    		user.LockedOut = true;
			}
	    }
		
		return respuesta;
	}

    

