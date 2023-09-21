import 'state.dart';

class StateMachine {
  final List<State> _states = [
    State(
      text: 'Paciente com glicemia capilar > 250mg/dL?',
      choice1: 'Sim',
      choice2: 'Não',
    ),
    State(
      text:
          'Há sinais/sintomas de cetoacidose diabética ou estado hiperosmolar?',
      choice1: 'Sim',
      choice2: 'Não',
    ),
    State(
      text:
          'Encaminhar para emergência imediatamente. Monitorar sinais vitais. Realizar hidratação EV com SF 0,9%, enquanto aguarda o transporte.',
      choice1: 'Reiniciar',
    ),
    State(
      text: 'Há suspeita de doença intercorrente (excluindo emergências)?',
      choice1: 'Sim',
      choice2: 'Não',
    ),
    State(
      text:
          'Provável descompensação crônica. Ajustar tratamento (considerar insulina). Solicitar controle de glicemia capilar. Orientar sinais de alarme e reavaliação breve.',
      choice1: 'Reiniciar',
    ),
    State(
      text: 'Cetonúria disponível? (se indisponível, considerar negativa)',
      choice1: 'Positiva',
      choice2: 'Negativa',
    ),
    State(
      text:
          'Encaminhar para emergência imediatamente. Monitorar sinais vitais. Realizar hidratação EV com SF 0,9%, enquanto aguarda o transporte.',
      choice1: 'Reiniciar',
    ),
    State(
      text:
          'Aplicar insulina regular e reavaliar glicemia capilar em 2 horas. Glicemia abaixo de 250mg/dL?',
      choice1: 'Sim',
      choice2: 'Não',
    ),
    State(
      text:
          'Encaminhar para emergência imediatamente. Monitorar sinais vitais. Realizar hidratação EV com SF 0,9%, enquanto aguarda o transporte.',
      choice1: 'Reiniciar',
    ),
    State(
      text:
          'Tratar complicações agudas. Aumentar transitoriamente dose total de insulina até resolução do quadro.',
      choice1: 'Reiniciar',
    ),
  ];

  int _currentIndex = 0;

  State get currentState => _states[_currentIndex];

  State nextStep(String choice) {
    if (_currentIndex < _states.length - 1) {
      if (choice == 'Sim' && _currentIndex % 2 == 0) {
        _currentIndex += 2;
      } else {
        _currentIndex++;
      }
      return _states[_currentIndex];
    } else {
      return State(text: 'Fim', choice1: 'Reiniciar');
    }
  }

  void reset() {
    _currentIndex = 0;
  }

  bool get isLastStep => _currentIndex == _states.length - 1;
}
