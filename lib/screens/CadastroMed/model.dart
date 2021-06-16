class Medicos {
  String nome;
  String sobrenome;
  String telefone;
  String cpf;
  String senha;
  String email;
  String endereco;
  String numero;
  String inicioExpediente;
  String fimExpediente;
  String descricao;

  Medicos(
      this.nome,
      this.sobrenome,
      this.telefone,
      this.cpf,
      this.email,
      this.senha,
      this.descricao,
      this.endereco,
      this.fimExpediente,
      this.inicioExpediente,
      this.numero);

  Map<String, dynamic> toMap() {
    return {
      "nome": nome,
      "sobrenome": sobrenome,
      "telefone": telefone,
      "cpf": cpf,
      "senha": senha,
      "email": email,
      "endereco": endereco,
      "numero": numero,
      "inicioExpediente": inicioExpediente,
      "fimExpediente": fimExpediente,
      "descricao": descricao,
    };
  }
}
