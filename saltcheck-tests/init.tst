
check_installed:
 module_and_function: pkg.version
 args:
  - salt
 assertion: assertNotEmpty
