/**
* Metodo para tomar todos los usuarios en el sistema
* <b>Pre</b>: Los usuarios existen en persistencia 
* <b>post</b>: Se lleno la lista de usuarios a partir de los directorios en sistema
* @return List la lista con los usuarios
*/
public List<String> getUsers() {
	List<String> users = new ArrayList<String>();
	
	if(verifaPath())
		return users;

	File[] files = new File(persistencePath()).listFiles();
	for(File file : files) {
		if(file.isDirectory()) {
			users.add(new User(file.getName(), this));
		}
	}
	
	return ordenarLista(users);
}

/**
* Verifica que exista algo en la ruta de persistencia
* <b>Pre</b>: Hay una referencia al path
* <b>post</b>: Se verifico su extistencia
* @return boolean true si existe el path, false en caso contrario
*/
public boolean verificaPath(){
	if(!new File(persistencePath()).exists())
		return true;
	else
		return false;
}

/**
* Ordena de manera descendente la coleccion que entra por parametro
* @param users - lista con los usarios 
* @return List<String> la lista ordenada
*/
public List<String> ordenarLista(List<String> users){
	Collections.sort(users, new User.UserComparatorByDescendingRegistration());

	return users;

}