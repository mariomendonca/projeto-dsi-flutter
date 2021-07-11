//cadastro pt.1
var confirmp;
String confirmarSenha(value) {
  if (value.isEmpty) {
    return "Este campo não pode estar vazio. *";
  } else if (value != confirmp) {
    return "As senhas devem ser iguais! *";
  }
  return null;
}

String validarCpf(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 10) {
    return "Preencha os 11 digitos do seu Cpf";
  } else {
    return null;
  }
}

String validarCell(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 10) {
    return "Preencha os 11 digitos do seu telefone";
  } else {
    return null;
  }
}

String validarEmailmed(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (!(value.contains('@') && value.contains('.com'))) {
    return "Digite um email válido ";
  } else {
    return null;
  }
}

String validarSenhamed(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 8) {
    return "A senha deve conter no minimo 8 digitos";
  } else {
    confirmp = value;
    return null;
  }
}

String validarNomemed(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 2) {
    return "Insira um nome valido";
  } else {
    return null;
  }
}

String validarSobrenomemed(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 2) {
    return "Insira um sobrenome valido";
  } else {
    return null;
  }
}

// cadastro pt2

String validarend(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 2) {
    return "Insira um endereço valido";
  } else {
    return null;
  }
}

String validarnum(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 2) {
    return "Insira um numero de enreço valido";
  } else {
    return null;
  }
}

String validarinicio(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 2) {
    return "Insira o horario de inicio do seu expediente";
  } else {
    return null;
  }
}

String validarfim(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 2) {
    return "Insira o horario final do seu expediente";
  } else {
    return null;
  }
}

String validardesc(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length < 2) {
    return "Faça uma breve descrição sobre você";
  } else {
    return null;
  }
}
