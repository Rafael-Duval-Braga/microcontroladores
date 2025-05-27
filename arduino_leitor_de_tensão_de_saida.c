int sensorPin = A0;   // select the input pin for the potentiometer
int ledPin = 13;      // select the pin for the LED
uint16_t sensorValue = 0;  // variable to store the value coming from the sensor
float valor;
void setup() {
  // declare the ledPin as an OUTPUT:
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  // read the value from the sensor:
  sensorValue = (uint16_t)analogRead(sensorPin);
  // turn the ledPin on
  digitalWrite(ledPin, HIGH);
  // stop the program for <sensorValue> milliseconds:
  //delay(sensorValue);
  // turn the ledPin off:
  digitalWrite(ledPin, LOW);
  // stop the program for <sensorValue> milliseconds:
  delay(1000);
  
  //Serial.print("Vin : ");
  valor = (float)sensorValue / 1024;
  
  Serial.println("tensão Vout gnd:");
  Serial.println(valor);

}
