# 🔌 DECO_2_4 Design

Implementación VHDL de un Decodificador 2:4. Incluye el código fuente y el testbench para la simulación y la comprobación del diseño.

## 📂 Ficheros Principales
* **DECODER_2_4.vhdl:** Código fuente con la entidad y la arquitectura.
* **DECODER_2_4_tb.vhdl:** Testbench para simular el diseño y comprobar su comportamiento.

## ⚙️ Simulación y Salidas Esperadas

### 📊 Tabla de Verdad: Decodificador 2:4

<img align="right" width="575" src="../../Waveforms/DECO_2_4.png">

| A[1] | A[0] | Y[3] | Y[2] | Y[1] | Y[0] |
| :---: | :---: | :---: | :---: | :---: | :---: |
| 0 | 0 | **0** | **0** | **0** | **1** |
| 0 | 1 | **0** | **0** | **1** | **0** |
| 1 | 0 | **0** | **1** | **0** | **0** |
| 1 | 1 | **1** | **0** | **0** | **0** |

<br clear="right"/>
