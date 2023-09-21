import 'package:flutter/material.dart';
import 'state_machine.dart';

void main() {
  runApp(const DiabetesHelper());
}

class DiabetesHelper extends StatelessWidget {
  const DiabetesHelper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: DiabetesHelperPage(),
          ),
        ),
      ),
    );
  }
}

class DiabetesHelperPage extends StatefulWidget {
  const DiabetesHelperPage({Key? key}) : super(key: key);

  @override
  State<DiabetesHelperPage> createState() => _DiabetesHelperPageState();
}

class _DiabetesHelperPageState extends State<DiabetesHelperPage> {
  StateMachine stateMachine = StateMachine();

  String get currentStepText => stateMachine.currentState.text;
  String get choice1Text => stateMachine.currentState.choice1;
  String? get choice2Text => stateMachine.currentState.choice2;

  void resetStateMachine() {
    setState(() {
      stateMachine.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                currentStepText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  if (!stateMachine.isLastStep) {
                    stateMachine.nextStep('Sim');
                  }
                });
              },
              child: Text(
                choice1Text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Visibility(
            visible: choice2Text != null,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    if (!stateMachine.isLastStep) {
                      stateMachine.nextStep('Não');
                    }
                  });
                },
                child: Text(
                  choice2Text ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: resetStateMachine,
              child: const Text(
                'Reiniciar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
