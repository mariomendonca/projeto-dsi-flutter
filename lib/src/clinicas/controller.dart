var confirmp;

String validarcnpj(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 11) {
    return "Preencha os digitos do seu CNPJ";
  } else {
    return null;
  }
}

String confirmarSenhaClinica(value) {
  if (value.isEmpty) {
    return "Este campo não pode estar vazio. *";
  } else if (value != confirmp) {
    return "As senhas devem ser iguais! *";
  }
  return null;
}

String validarcelularClinica(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 10) {
    return "Preencha os 11 digitos do seu telefone";
  } else {
    return null;
  }
}

String validarEspecialidades(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 2) {
    return "Insira um enredeço valido";
  } else {
    return null;
  }
}

String validaremailClinica(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (!(value.contains('@') && value.contains('.com'))) {
    return "Digite um email válido ";
  } else {
    return null;
  }
}

String validarsenhaClinica(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 8) {
    return "A senha deve conter no minimo 8 digitos";
  } else {
    confirmp = value;
    return null;
  }
}

String validarnomeClinica(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 2) {
    return "Insira um nome valido";
  } else {
    return null;
  }
}

String validarComplemento(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 2) {
    return "Insira um nome valido";
  } else {
    return null;
  }
}

String validarEndereco(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 2) {
    return "Insira um enredeço valido";
  } else {
    return null;
  }
}
