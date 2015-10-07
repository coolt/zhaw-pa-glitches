Cyclone II:
Works only with quartus 13.0sp.

script [home/bin]
./quartus13_0sp1.sh



Synthese/vhdl 1:
----------------
- Zustand von Hans ersten Coude.
- Asynchroner Zähler mit (zur Kontrolle) Glitch ber FF.
Erkenntnis:
- Man sieht keine Glitches. Es rauscht.
Material:
- 2 Bilder vom KO + RTL-Diagramm

Synthese/vhdl2:
---------------
- Katrins redesign. Hat noch Fehler.


Synthese/vhdl3:
----------------
- Komplettes Redesign
- Ziel: Verlängerte Pfade einbauen durch Knoten (Logik mit FF)
- Pfade sind unterschiedlich lang

Erkenntnis:
Knoten erschienen im RTL nicht als FF. (Siehe dazu Synthese 4b -> delay routing process.
Dort hat es Knoten.)

Synthese/vhdl4:
---------------
- Redesign: 16 Pins von GPIO 1 für Routing eingebaut, Typcast von int -> std_log_vector.
- Zähler auf Vektorbasis (nur *.vhdl, nicht implemntiert)
- Ziel: Verzögerung durch Routing durch GPIO (OUT -> IN).
- Ergebnis: Keine Glitches sichtbar.


Synthese/vhdl4b:
----------------
- Variante von Synthese 4. Zwei Bits [ cnt(0) und cnt(6)] nicht über GPIO routen.
                           1 Bit [ cnt(4) ] durch getaktete Logik (node) zusätzlich verzögern.
-Ergebnis: Keine Glitches sichtbar

Synthese/vhdl5:
................
Intelligentes Routen: Welche Pins sollen verzögert sein, welche nicht?

