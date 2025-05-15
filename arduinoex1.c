//piscar 3x o led rapido e depois 1 seg apagado.
int count;

void setup()
{
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop()
{
  for (count = 0; count < 3; ++count) {
    digitalWrite(LED_BUILTIN, HIGH);
    delay(200); // Wait for 1000 millisecond(s)
    digitalWrite(LED_BUILTIN, LOW);
    delay(200); // Wait for 1000 millisecond(s)
  }
  digitalWrite(LED_BUILTIN, LOW);
  delay(800); // Wait for 3000 millisecond(s)
}
