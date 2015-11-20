public List getUsers() {
	List users = new ArrayList();

	if(!new File(persistencePath()).exists())
		return users;

	File[] files = new File(persistencePath()).listFiles();
	for(File file : files) {
		if(file.isDirectory()) {
			users.add(new User(file.getName(), this));
		}
	}

	Collections.sort(users, new User.UserComparatorByDescendingRegistration());

	return users;
}