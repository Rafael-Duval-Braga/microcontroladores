

int sensorPina = A0;   // select the input pin for the potentiometer
int sensorPinb = A1;
int sensorPinc = A2;

uint16_t A = 0;  // variable to store the value coming from the sensor
uint16_t B = 0;  // variable to store the value coming from the sensor
uint16_t C = 0;  // variable to store the value coming from the sensor

float valorA, valorB, valorC;
void setup() {
  // declare the ledPin as an OUTPUT:
  pinMode(pinoaquecedor, OUTPUT);
  pinMode(pinorefrigerador, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  // read the value from the sensor:
  A = (uint16_t)analogRead(sensorPina);
  B = (uint16_t)analogRead(sensorPinb);
  C = (uint16_t)analogRead(sensorPinc);

  // turn the ledPin on
  //  digitalWrite(ledPin, HIGH);
  // stop the program for <sensorValue> milliseconds:
  //delay(sensorValue);
  // turn the ledPin off:
  //digitalWrite(ledPin, LOW);
  // stop the program for <sensorValue> milliseconds:
  //delay(1000);
  //Serial.print("Vin : "); 
  //                        
  
  valorA = map(A, 0, 1023, 100, 500);
  //valorA = (float)A / 1024;
  //valorA = valorA * ;
  
  valorB = map(B, 0, 1023, -50, -1);
  
  //valorB = (float)B / 1024;5
  //valorB = valorB * 5;
  
  valorC = map(B, 0, 1023, 5800, 25000);
  

  if((valorA > 300) && (valorB < -20)){

    digitalWrite(pinoaquecedor, HIGH);
//    digitalWrite(pinorefrigerador, LOW);

  }

  if((valorC > 15000) || (valorA < 200 && valorB -10)){

    digitalWrite(pinorefrigerador, HIGH);
//    digitalWrite(pinoaquecedor, LOW);

  }

  else{

    digitalWrite(pinoaquecedor, LOW);
    digitalWrite(pinorefrigerador, LOW);

  }

  //Serial.println("tensão Vout gnd:");
  //Serial.println(valor);

}
