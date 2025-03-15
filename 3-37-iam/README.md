# 3.37

**Compute the electric potential produced by the sperfitial density of a charge q = 5 a.u. uniformily distributed in an ellpise with semi-major axis is a = 2 a.u. and semi-minor axis b = 1 a.u.**

**a) Make this computation in the x axis from x $\gtrsim$ a to x = 10 a.u.**

The potential in a point is the integral of the electrical field from this point to the infinity, that is our origin of zero potential. We can compute the electrical field through the Gauss low: 

$$ \int_S \vec{E} d\vec{S} = \frac{q_{int}}{\epsilon_0} $$

where $d\vec{S}$ is the surface's differential of the sphere inside of which we compute the electrical field. 

$$ E = \frac{q}{4 \pi \epsilon_0 r^2}  \ \ \ r > (a,b) $$

$$ V(x) = \frac{1}{4 \pi \epsilon_0} \int_x^{\infty} \frac{q}{(x+a)^2 + b^2} dx $$

![alt text][logo]

[logo]:https://github.com/Olinty-3/Computational-physic/blob/main/3-37-iam/3-37-a-iam.png

**b)  From what distance to the center of the ellipse the potetntial you just computed differs by less than 1% from the one due to a puntual charge q in the center of this ellipse ?** 

The potential due to a point-like charge is: 

$$  V(x) = \frac{1}{4 \pi \epsilon_0} \int_x^{\infty} \frac{q}{x^2} dx $$ 

![alt text][logo2]

[logo2]:https://github.com/Olinty-3/Computational-physic/blob/main/3-37-iam/3-37-b-iam.png

The potentials start to differ by less than a 1% for x = 30.71 a.u.
