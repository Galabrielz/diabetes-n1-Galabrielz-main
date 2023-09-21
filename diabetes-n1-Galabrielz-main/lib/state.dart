class State {
  final String text;
  final String choice1;
  final String? choice2; // O segundo botão é opcional

  State({
    required this.text,
    required this.choice1,
    this.choice2,
  });
}
