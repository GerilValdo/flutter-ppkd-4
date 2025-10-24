enum RouteScreen {
  home('/home'),
  confirmationScreen('/confirmation'),
  login('/signin'),
  register('/signup');
  const RouteScreen(this.path);

  final String path;
}