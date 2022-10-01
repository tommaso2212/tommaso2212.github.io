class UserData {
  RoleEnum? _role;

  RoleEnum get role => _role ?? RoleEnum.public;
  set role(RoleEnum role) => _role = role;
}

enum RoleEnum{
  admin, public
}