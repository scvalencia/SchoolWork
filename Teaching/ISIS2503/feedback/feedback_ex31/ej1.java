public bool Login(string username, string password) {
    var user = userRepo.GetUserByUsername(username);

    if(user == null)
        return false;

    if (loginValidator.IsValid(user, password))
        return true;

    user.FailedLoginAttempts++;

    if (user.FailedLoginAttempts >= 3)
        user.LockedOut = true;

    return false;
}