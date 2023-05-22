int button1Pin = 2; // Pin for button 1
int button2Pin = 3; // Pin for button 2
const int joyXPin = A0;  // Joystick X-axis analog pin
const int joyYPin = A1;  // Joystick Y-axis analog pin
byte val; // stores data received from serial port
const int LED1 = 5; // created a variable called LED and assigned it the value of 13

void setup() {
  pinMode(LED1, OUTPUT);
  Serial.begin(9600); // Initialize Serial communication
  pinMode(button1Pin, INPUT_PULLUP); // Configure button 1 pin as input with internal pull-up resistor
  pinMode(button2Pin, INPUT_PULLUP); // Configure button 2 pin as input with internal pull-up resistor
}

void loop() {
  // Read the state of button 1 and button 2
  int button1State = digitalRead(button1Pin);
  int button2State = digitalRead(button2Pin);
  int xVal = analogRead(joyXPin);  // Read X-axis value
  int yVal = analogRead(joyYPin);  // Read Y-axis value
  Serial.print(xVal);
  Serial.print(",");
  Serial.println(yVal);
  

  delay(100);
  // Check if button 1 is pressed
  if (button1State == LOW) {
    Serial.write('L'); // Send 'L' character indicating button 1 press
    delay(800); // Delay to debounce the button
  }

  // Check if button 2 is pressed
  if (button2State == LOW) {
    Serial.write('R'); // Send 'R' character indicating button 2 press
    delay(800); // Delay to debounce the button
  }

if (Serial.available()) { // If data is available to read
    val = Serial.read(); // read it and store it in val
  }
   if (val == 0) { // If 0 received
    digitalWrite(LED1, LOW); // turn LEDs off

  }
  else if (val == 1) { // If 1 received
    digitalWrite(LED1, HIGH);
    
     delay(850); // turn the LED at pin 1 on
    
  }
  else if (val == 2) { // If 2 received
    
    digitalWrite(LED1, LOW); //other LED off
  }
  delay(10); // Wait 10 milliseconds
}
