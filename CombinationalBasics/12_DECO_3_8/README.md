# 🔌 DECO_3_8 Design

Implementación VHDL de un Decodificador 3:8. Incluye el código fuente y el testbench para la simulación y la comprobación del diseño.

## 📂 Ficheros Principales
* **DECODER_3_8.vhdl:** Código fuente con la entidad y la arquitectura.
* **DECODER_3_8_tb.vhdl:** Testbench para simular el diseño y comprobar su comportamiento.

## ⚙️ Simulación y Salidas Esperadas

### 📊 Tabla de Verdad: Decodificador 3:8

<img align="right" width="350" src="../../Waveforms/DECO_3_8.png">

| A[2] | A[1] | A[0] | Y[7] | Y[6] | Y[5] | Y[4] | Y[3] | Y[2] | Y[1] | Y[0] |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 0 | 0 | 0 | **0** | **0** | **0** | **0** | **0** | **0** | **0** | **1** |
| 0 | 0 | 1 | **0** | **0** | **0** | **0** | **0** | **0** | **1** | **0** |
| 0 | 1 | 0 | **0** | **0** | **0** | **0** | **0** | **1** | **0** | **0** |
| 0 | 1 | 1 | **0** | **0** | **0** | **0** | **1** | **0** | **0** | **0** |
| 1 | 0 | 0 | **0** | **0** | **0** | **1** | **0** | **0** | **0** | **0** |
| 1 | 0 | 1 | **0** | **0** | **1** | **0** | **0** | **0** | **0** | **0** |
| 1 | 1 | 0 | **0** | **1** | **0** | **0** | **0** | **0** | **0** | **0** |
| 1 | 1 | 1 | **1** | **0** | **0** | **0** | **0** | **0** | **0** | **0** |

<br clear="right"/>
