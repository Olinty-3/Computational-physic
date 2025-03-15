# 5.13 

**Compute and plot the trajectory of Pluto around the Sun. We will assume that the Sun is at rest in the origin of the coordinate system. We will also assume that Pluto is initialy at the perihelion. To check our results we will plot the trajectories during various compleat orbits, that should superimpose; plot the total energy, that should be constant; and compute the areal velocity, that should also be constant, following Kepler's second law.**

**We will assume we are dealing with a boundary conditions problem, so we don't know the initial velocity of Pluto**

To solve this problem I have to compute the gradient of the differential equation that describes the system at the initial time through iterative methods. The ecuation to compute comes from equalising Newton's second law to the gravitational law. 

$$ \frac{d^2\vec{r}}{dt^2} = \frac{M G}{\vec{r}^2} \hat{u}_r $$

where $\hat{u}_r$ is an unitary vector in the direction of $r$. To solve the problem we divide the equation in its cartesian coordinates: 

$$ \frac{d^2x}{dt^2} = \frac{MGx}{(x^2+y^2)^\frac{3}{2}} $$

$$ \frac{d^2y}{dt^2} = \frac{MGy}{(x^2+y^2)^\frac{3}{2}} $$

With the additional advantage that we do know the gradien in the x axis, since Pluto is at the perihelion the gradien is zero. 

There were needed 8 iterations to find the correct gradient. 

![alt text][logo]

[logo]:https://github.com/Olinty-3/Computational-physic/blob/main/5-13-iam/5-13-1-iam.png

I ploted three compleat orbits. As it can be seen the two first interactions are far from being an eliptical orbit. Both the seventh and eighth interaction spuerimpose compleatly, what lead us to belive we achive the desired precision. 

To compute the energy I use the known relation: 

$$ E = K + U = \frac{1}{2}mv^2 - \frac{MG}{r} $$

All of the elements in the ecuation are been computed to plot the trajectory. 

![alt text][logo2]

[logo2]:https://github.com/Olinty-3/Computational-physic/blob/main/5-13-iam/5-13-2-iam.png

If we had only plot this graph it could have misslead us since the energy begings to be constant much earlier than convergence in the trajectories. But with different final energies so we wold get also that value wrong.

The ecuation for the areal velocity is: 

$$ \vec{v}_a = \frac{1}{2m}|\vec{r}\ \times m \vec{v}| = \frac{1}{2} | x v_y - y v_x | $$

![alt text][logo3]

[logo3]:https://github.com/Olinty-3/Computational-physic/blob/main/5-13-iam/5-13-3-iam.png



