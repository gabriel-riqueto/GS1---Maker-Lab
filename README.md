**PROJETO: Space Claw**

**Integrantes:**
Gabriel Riqueto Reis RM98685 <br>
Sabrina Flores Varela de Morais RM550781 <br>
Leonardo Nicastro Mansur Castillo RM551659 <br>

**Acesso ao Simulador**
Link público do projeto:
[Garra GS](https://www.tinkercad.com/things/4yDiJmI0gBz/editel?returnTo=%2Fdashboard&sharecode=RyzENWaPa-VFus7JQpVouIHOLRcXjUS-ytGV2DACVhs)

**Software de Modelagem**
As peças mecânicas do braço robótico foram desenvolvidas utilizando o software OpenSCAD. 

**Especificações Técnicas**
    Alimentação:
        • Fonte de alimentação configurada para 5 V.
    Pinagem Utilizada:
        • Servo do braço (movimento de subida e descida): pino digital 9.
        • Servo da garra (abertura e fechamento): pino digital 10.
        • LED de status: pino digital 13.
        • GND comum compartilhado entre Arduino, servomotores e fonte de alimentação.

**Descrição de Funcionamento:**
O sistema é controlado por meio do Monitor Serial do Arduino. Os comandos enviados pelo usuário acionam os servomotores responsáveis pelos movimentos do braço robótico e da garra. Um LED de status indica visualmente a execução dos comandos recebidos.

**Tutorial de Uso do Braço Robótico**
    1. Iniciar a Simulação
        a)	Abra o projeto no Tinkercad. 
        b)	Clique em Iniciar Simulação. 
    2. Abrir o Monitor Serial
        a)	Clique em Monitor Serial na parte inferior da tela. 
        b)	Verifique se a velocidade está configurada para 9600 baud. 
    3. Comandos de Controle
        Digite um comando dos comandos a seguir no Monitor Serial e pressione Enter.
        Comandos:
        U – Subir o braço (O braço vai subir 15 graus para cada vez que o comando for inserido.);
        D – Descer o braço (O braço vai descer 15 graus para cada vez que o comando for inserido.);
        O – Abrir a garra;
        C – Fechar a garra (A garra vai fechar 15 graus para cada vez que o comando for inserido.).
    4. Exemplo de Utilização
        Para simular a captura de um objeto:
        I.	Digite U para levantar o braço. 
        II. Digite C para fechar a garra e capturar o objeto. 
        III. Digite D para abaixar o braço. 
        IV. Digite O para abrir a garra e soltar o objeto.
    5. LED de Status
    Sempre que um comando for executado:
    •	O LED acenderá. 
    •	O movimento será realizado pelo servomotor correspondente. 
    •	Após alguns segundos, o LED apagará. 
    Assim, o LED indica que o Arduino recebeu e executou um comando com sucesso.

