public List getUsers() throws Excetion {
	List users = new ArrayList();
try{
	if(new File(persistencePath()).exists()==false)
	{
		throw new RutaInvalidaException e ("La ruta de este archivo no es valida");
	}

	else
		{
		File[] user = new File(persistencePath()).listFiles();
		
	for(File file : user) 
	{
		if(file.isDirectory()) 
		{
			users.add(new User(file.getName(), this));
		}
	}
		}
	Collections.sort(users, new User.compareAToZ());
	}

catch (RutaInvalidaException) e.log
	

	return users;
}