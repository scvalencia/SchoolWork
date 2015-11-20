//Original + análisis
public bool Login(string username, string password) {
    User user = userRepo.GetUserByUsername(username);
     //Se debería definir una variable boolean a retornar y devolverla al final. Por convención esto es más adecuad (no es deseable usar un return para interrumpir el método), aunque al hacer el return el método finalice.
    // Definiendo una veriable aumentan las líneas de código, pero se disminuye la cantidad de retornos en método
    if(user == null)
        return false;

    if (loginValidator.IsValid(user, password))
        return true;
    // No debería modificarse de esa manera el atributo, ni tener acceso a él de esa manera. Debería hacerse a través de un método.
    user.FailedLoginAttempts++;

    //Debería hacerse un método que haga la revisión y devuelva true o false según sea el caso, esto para hacer una estructura de else-if adecuada y 
    //posteriormente hacer esta verificación (si es necesaria), con un sólo llamado al método.
    if (user.FailedLoginAttempts >= 3)
        user.LockedOut = true;

    return false;
}

//Código Modificado
public bool Login(string username, string password) {
    User user = userRepo.GetUserByUsername(username);
   
    boolean respuesta;

    if(user == null)
        respuesta = false;

    else if (loginValidator.IsValid(user, password))
        respuesta = true;
    
    else
    {
    	 respuesta = user.increaseFailedLoginAttempts();
    }   

    return respuesta;
}


// métodos que deberían existir en usuario
public bool increaseFailedLoginAttempts() {
	FailedLoginAttempts++;
    if (FailedLoginAttempts()>=3)
    	User.lockOut();
    return false;
}

       	
  
}

