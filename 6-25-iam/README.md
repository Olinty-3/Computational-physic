# 6.25 

**a) We have two identical bars of aluminium  of 0.25 m of length. One of them is at 50 ºC, while the other is at 100ºC. Now we put them in touch through one of their ends while the other end stays at 0 ºC. Compute and plot the temperature's evolution through the two bars** 

The equation that tell us how the temperature in a material develops is: 

$$  \frac{\partial u}{\partial t} = \alpha \frac{\partial^2u}{\partial x^2} $$ 

where $u$ is the temperature and $\alpha$ is the thermal diffusivity. 

![alt text][logo]

[logo]:https://github.com/Olinty-3/Computational-physic/blob/main/6-25-iam/6-25a-iam.png

The legend shows the time steps each line represents. As is seen at first the evolution is faster and then you need more steps to see a change. Another important feature of the evolution is how, at first, the cooler bar, at the left, gains temerature, when the difference is still significant but then, when the temperature at the ends starts to take relevance, the two bars act like one and start geting cooler. The stability is reach when all the bar is at 0 ºC.

**b) Repite the exercise considering now that the bar at 50 ºC is made out of iron, while the bar at 100ºC si made out of aluminium.**

![alt text][logo2]

[logo2]:https://github.com/Olinty-3/Computational-physic/blob/main/6-25-iam/6-25b-iam.png

The evolution at the start is very similar to our last case, the cooler bar gains some temperature before loosing it again. But then the maximum in temperature doesn't lay at the center of the bar but in the part of iron. In this case the equilibrium is reach uch later.  
