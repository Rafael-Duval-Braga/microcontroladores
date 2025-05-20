#include <Keypad.h> // Inclusão da biblioteca

const byte qtdLinhas = 4;    // Quantidade de linhas do teclado
const byte qtdColunas = 3;   // Quantidade de colunas do teclado

// Matriz que representa o layout do teclado
char matriz_teclas[qtdLinhas][qtdColunas] = {
  {'1','2','3'},
  {'4','5','6'},
  {'7','8','9'},
  {'*','0','#'}
};

// Definição dos pinos conectados às linhas e colunas
// Aqui usamos pinos digitais disponíveis no Mega 2560
byte PinosqtdLinhas[qtdLinhas] = {41, 43, 45, 47};  
byte PinosqtdColunas[qtdColunas] = {49, 51, 53};    

// Inicializa o teclado
Keypad meuteclado = Keypad(makeKeymap(matriz_teclas), PinosqtdLinhas, PinosqtdColunas, qtdLinhas, qtdColunas);

void setup(){
  Serial.begin(9600); // Inicializa comunicação serial
  Serial.println("Aperte uma tecla...");
  Serial.println();
}

void loop(){
  char tecla_pressionada = meuteclado.getKey(); // Lê se alguma tecla foi pressionada

  if (tecla_pressionada) { // Se houver tecla pressionada
    Serial.print("Tecla pressionada : ");
    Serial.println(tecla_pressionada);
  }
}
