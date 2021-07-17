String validaremail(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (!(value.contains('@') && value.contains('.com'))) {
    return "Digite um email válido ";
  } else {
    return null;
  }
}

String validarsenha(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 8) {
    return "A senha deve conter no minimo 8 digitos";
  } else {
    return null;
  }
}
