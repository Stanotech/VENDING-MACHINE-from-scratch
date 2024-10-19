# VENDING-MACHINE-from-scratch
Vending machine for switching on lights on football and basketball court after payment.
This machine is entirely designed and created by me.


![1](https://user-images.githubusercontent.com/48159338/215746896-6e312e87-8baf-4af5-8eaf-87793d23bbf0.jpg)

This vending machine is projected for switching lights on two courts. Those courts have different pricing. 
Vending machine is very simple in use. 
1. Select the court on which you want to switch on lights
2. Display show rectangle which indicates selected court
3. Put the money in. Coin and bill are accepted
4. Machine will automatically calculate time proportionally to money puted in
5. Lights turns on
6. Display shows remaining time

This vending machine is connected to existing electrical switchboard with manual switches. Vending machine relays are connected in parallel with the relays of the manual switches in the electrical switchboard.
Bill acceptor accept 10, 20, 50, 100 nominals giving 1, 2, 5, 10 sharp high impulses 100ms lenght.
Coin acceptor accept 1, 2, 5 nominals giving 1, 2, 5 sharp high impulses 100ms lenght.
Signals are filtered, counted and recalculated to time.

Vending machine has been working flawlessly for a year giving allot of evening entertainment :)
Location- Poland, Poznań, Golęcińska 9

What you need to build this vending machine ?
- Arduino UNO
- simple display like TM1637
- two relays like jqc-3ff-s-z
- coin acceptor (you will find it on aliexpress. Check the photo folder to see how it looks)
- NV9 bill acceptor
- waterproof casing- this one is US military case for something. I have bought it on some dumb. 
- additionaly just in case I made rain-proof front of coin acceptor. I have attached g-code for 3d printing it. 
- two waterproof buttons
- some wires :)

