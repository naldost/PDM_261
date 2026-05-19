// 14-agregacao.dart
// Agregação e Composição

import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    _nome = nome;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    _nome = nome;
    _dependentes = dependentes;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes': _dependentes,
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeProjeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeProjeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios,
    };
  }
}

void main() {

  // 1. Criar varios objetos Dependentes
  Dependente dep1 = Dependente("Carlos");
  Dependente dep2 = Dependente("Marina");
  Dependente dep3 = Dependente("Lucas");
  Dependente dep4 = Dependente("Fernanda");

  // 2. Criar varios objetos Funcionario
  Funcionario func1 = Funcionario(
    "João",
    [dep1, dep2],
  );

  Funcionario func2 = Funcionario(
    "Maria",
    [dep3],
  );

  Funcionario func3 = Funcionario(
    "Pedro",
    [dep4],
  );

  // 3. Associar os Dependentes criados aos respectivos funcionarios
  // (já realizado no construtor acima)

  // 4. Criar uma lista de Funcionarios
  List<Funcionario> funcionarios = [
    func1,
    func2,
    func3,
  ];

  // 5. Criar um objeto EquipeProjeto
  EquipeProjeto equipe = EquipeProjeto(
    "Sistema de Gestão Empresarial",
    funcionarios,
  );

  // 6. Printar no formato JSON o objeto EquipeProjeto
  String jsonEquipe = jsonEncode(equipe);

  print(jsonEquipe);
}