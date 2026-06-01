// Inclui a biblioteca necessária para controlar os servomotores.
#include <Servo.h>

// Cria dois objetos do tipo Servo, uma para o braço e outro para a garra.

Servo servoBraco;
Servo servoGarra;

// Define o pino 13 como o pino do LED de status e define a posição inicial do braço e garra para 90 graus.
const int ledStatus = 13;
int posBraco = 90;
int posGarra = 90;

void setup() {
  // Inicia a comunicação serial.
  Serial.begin(9600);

  // Conecta o servo do braço ao pino digital 9.
  servoBraco.attach(9);

  // Conecta o servo da garra ao pino digital 10.
  servoGarra.attach(10);

  // Define o pino do LED como saída.
  pinMode(ledStatus, OUTPUT);

  // Posiciona o servo do braço na posição inicial de 90 graus.
  servoBraco.write(posBraco);

  // Posiciona o servo da garra na posição inicial de 90 graus.
  servoGarra.write(posGarra);

  // Mostra no Monitor Serial quais comandos podem ser usados.
  Serial.println("Comandos:");
  Serial.println("U = Up");
  Serial.println("D = Down");
  Serial.println("O = Open");
  Serial.println("C = Close");
}

void loop() {

  // Verifica se algum comando foi enviado pelo Monitor Serial.
  if (Serial.available()) {

    // Lê o caractere digitado pelo usuário.
    char cmd = Serial.read();

    // Acende o LED de status indicando que um comando foi recebido.
    digitalWrite(ledStatus, HIGH);

    // Analisa qual comando foi recebido.
    switch(cmd) {

      // Caso o usuário digite U ou u
      case 'U':
      case 'u':
        // Move o servo do braço 15 graus pra cima.
        posBraco += 15;

        if(posBraco > 180)
           	posBraco = 180;

        servoBraco.write(posBraco);

        // Exibe mensagem no Monitor Serial.
        Serial.println("Braco subiu");
        break;

      // Caso o usuário digite D ou d
      case 'D':
      case 'd':
        // Move o servo do braço para 15 graus pra baixo.
        posBraco -= 15;

        if(posBraco < 0)
            posBraco = 0;

        servoBraco.write(posBraco);

        // Exibe mensagem no Monitor Serial.
        Serial.println("Braco desceu");
        break;

      // Caso o usuário digite O ou o
      case 'O':
      case 'o':
        // Move o servo da garra de volta para 90 graus, simulando abertura.
        servoGarra.write(90);

        // Exibe mensagem no Monitor Serial.
        Serial.println("Garra aberta");
        break;

      // Caso o usuário digite C ou c
      case 'C':
      case 'c':
        // Move o servo da garra 15 graus, simulando fechamento.
        posGarra -= 15;

        if(posGarra < 0)
            posGarra = 0;

        servoGarra.write(posGarra);

        // Exibe mensagem no Monitor Serial.
        Serial.println("Garra fechando");
        break;
    }

    // Mantém o LED aceso por 2 segundos para sinalizar a execução do comando.
    delay(2000);

    // Apaga o LED após a execução do comando.
    digitalWrite(ledStatus, LOW);
  }
}