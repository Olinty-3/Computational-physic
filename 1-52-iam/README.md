# 1.52
**La energía potencial de interacción de un ion con el resto de componentes de un cristal iónico consta de un término atractivo, debido a la interacción electrostática coulombiana de largo alcance entre el ion y el resto de iones del cristal**

$$ U_{Coulomb}(r) = - \alpha  \ \ \ \frac{e^2}{4 \pi \epsilon_0} \ \ \ \frac{1}{r} $$

**donde r es la separación entre iones primeros vecinos y α es la constante de Madelung, que es un factor puramente geométrico que da cuenta de la contribución a la interacción coulombiana debida a todos los iones del cristal.**

**Por otra parte, la energía potencial debe contener un término repulsivo de corto alcance, que da cuenta de la imposibilidad de que las nubes electrónicas de iones vecinos se superpongan en el mismo espacio. En el libro de Kittel, el potencial repulsivo viene dado por la siguiente expresión:**

$$ U_{repulsion} (r) = z \lambda e^{-r/\rho} $$

**En la expresión anterior, z es el número de primeros vecinos de cada ion, mientras que λ y ρ son dos parámetros que caracterizan la interacción repulsiva para cada par de iones.**

Con estos datos voy a calcular la distancia de equilibrio entre átomos en una molécula de NaCl. Para ello necesito encontrar los ceros de la derivada del potencial total que sufre la molécula:

$$ \frac{dU_{tot}}{dr} = - \frac{z\lambda}{\rho}e^{-\frac{r}{\rho}} + 2 \alpha \frac{e^2}{4\pi\epsilon_0} \frac{1}{r} $$

Una buena práctica es gráficar la función de la que se buscan los ceros para no empezar la simulación muy lejos del punto desado. 

![alt text][logo]

[logo]:https://github.com/Olinty-3/Computational-physic/blob/main/1-52-iam/1-52-iam.png

He graficado tanto el potencial como su derivada ya que, aunque busquemos el cero de la derivada vine bien saber la forma del potencial. Además podemos comprobar que el m ínimo de $U(x)$ equivale al cero de $dU(x)$.

Trabajando con una tolerancia de $ 10^{-4}$. Y obtengo $ r_{eq} = 2.816 $ $ \circ{A} $ con cinco interacciones. 

Si buscamos en la literatura podemos encontrar que la distancia de equilibrio para una molécula de NaCl es de 2.36 $$ \circ{A} $$,  la discrepancia con nuestro resultado se debe a la simplicidad del modelo m ́as que a los métodos computacionales empleados.
