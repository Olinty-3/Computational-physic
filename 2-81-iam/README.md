# 2.81 
**La figura muestra un circuito formado por un conjunto de resistencias. Las que están inclinadas las denominamos $R_{\otimes}$ y las que están horizontales o verticales las denominamos $R_{\oplus}$ El voltaje en el terminal superior es $V_{\oplus} = 5 V$ y en el terminal inferior vale $V_0 = 0 V$ ¿Cuánto valen los voltajes en los otros nodos del circuito si $R_{\otimes} = 2 R_{\oplus}$**

![alt text][logo]

[logo]:https://github.com/Olinty-3/Computational-physic/blob/main/2-81-iam/2-81b-iam.png

Para resolverlo usare las reglas de Krichoff para crear una matriz de 10x10 que resolví con el programa en fortran. En la imágen superior se puede ver como he nombrado a los distintos nodos y distintas intensidades asi como el sentido que he tomado para las intensidades, si estas salen negativas será por que las he tomado al reves.

$$ nudo \ \ \ a: I_1 - I_2 - I_{10} = 0 $$
$$ nudo \ \ \ b: -I_1 + I_3 + I_4 + I_5 = 0 $$
$$ nudo \ \ \ d: - I_4 - I_7 + I_8 = 0 $$
$$ nudo \ \ \ e: - I_5 + I_6 + I_7 - I_9 = 0 $$
$$ nudo \ \ \ f: - I_8 + I_9 + I_{10} = 0 $$

$$ malla \ \ \ abca: I_1 R_{\otimes} + I_2 R_{\otimes} + I_3 R_{\oplus} = R_{\oplus} ( 2 I_1 + 2 I_2 + I_3 ) = 0  $$
$$ malla \ \ \ becb: - I_3 R_{\oplus} + I_5 R_{\otimes} + I_6 R_{\oplus} = R_{\oplus} ( - I_3 + 2 I_5 + I_6 ) = 0  $$
$$ malla \ \ \ bedb: - I_4 R_{\oplus} + I_5 R_{\otimes} + I_7 R_{\oplus} = R_{\oplus} ( - I_4 + 2 I_5 + I_7 ) = 0 $$
$$ malla \ \ \ dfed: I_7 R_{\oplus} + I_8 R_{\otimes} + I_9 R_{\otimes} = R_{\oplus} ( I_7 + 2 I_8 + 2 I_9 ) = 0 $$
$$ malla \ \ \ acefa: - I_2 R_{\otimes} - I_6 R_{\oplus} - I_9 R_{\otimes} = - R_{\oplus} ( 2 I_2 + I_6 + 2 I_9 ) = V_+ $$

Donde he supuesto que la pila no ejerce ningunar resistencia.

El sistema de ecuaciones a resolver queda: 

```math

\begin{pmatrix}

1 & -1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & -1 \\
-1 & 0 & 1 & 1 & 1 & 0 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & -1 & 0 & 0 & -1 & 1 & 0 & 0 \\
0 & 0 & 0 & 0 & -1 & 1 & 1 & 0 & -1 & 0 \\
0 & 0 & 0 & 0 & 0 & 0 & 0 & -1 & 1 & 1 \\
2 & 2 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
0 & 0 & -1 & 0 & 2 & 1 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & -1 & 2 & 0 & 1 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 & 0 & 0 & 1 & 2 & 2 & 0 \\
0 & -2 & 0 & 0 & 0 & -1 & 0 & 0 & -2 & 0 

\end{pmatrix}

\begin{pmatrix}

I_1 \\ I_2 \\ I_3 \\ I_4 \\ I_5 \\ I_6 \\ I_7 \\ I_8 \\ I_9 \\ I_{10}

\end{pmatrix}

R_{\oplus} =

\begin{pmatrix}

0 \\ 0 \\ 0 \\ 0 \\ 0 \\ 0 \\ 0 \\ 0 \\ 0 \\ V

\end{pmatrix} 


```

The solution is: 

| $i$ | $I_i$ $R_{\oplus}$ (V) | | $i$ | $I_i$ $R_{\oplus}$ (V) | 
| :---: | :---: | --- | :---: | :---: |
| 1 | 1.071 | | 6 | - 0.875 | 
| 2 | - 1.0 | | 7 | 0.143 |
| 3 | - 0.143 | | 8 | 1.0 |
| 4 | 0.857 | | 9 | -1.071 |
| 5 | 0.357 | | 10 | 2.071 | 

But actually we are asked about the voltage in the nodes. To do so we know that the potential's difference between two nodes will be the potential in the resistence. So we just solve this four ecuation system: 

$$ V_{\oplus} - V_1 = I_1 R_{\otimes} = 2 I_1 R_{oplus} $$ 
$$ V_1 - V_2 = I_4 R_{\oplus} $$ 
$$ V_3 - V_{\oplus} = I_2 R_{\otimes} = 2 I_2 R_{\oplus} $$ 
$$ V_4 - V_3 = I_6 R_{\oplus} $$ 

$$ V_1 = 2.857 V $$ 
$$ V_2 = 3.0 V $$ 
$$ V_3 = 3.0 V $$ 
$$ V_4 = 2.143 V $$ 


