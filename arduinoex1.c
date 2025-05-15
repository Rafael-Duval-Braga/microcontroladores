//piscar 3x o led rapido e depois 1 seg apagado:
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

//Cada click no botão incrementa cont & desliga led do arduino, mostrar cont no serial:

// constants won't change. They're used here to set pin numbers:
const int buttonPin = 2;  // the number of the pushbutton pin
const int ledPin = 13;    // the number of the LED pin

// variables will change:
int buttonState = 0;  // variable for reading the pushbutton status
int cont=0;
void setup() {
  Serial.begin(9600);
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin, INPUT);
  digitalWrite (buttonPin,1);
}

void loop() {

  buttonState = digitalRead(buttonPin);
  digitalWrite (ledPin,buttonState);
  if (buttonState == HIGH) {  
    digitalWrite(ledPin, HIGH);
  } else {
    cont++;

    Serial.print("Variavel i:");
    Serial.println(cont);
    delay(150);
    digitalWrite(ledPin, LOW);
  } 
}
