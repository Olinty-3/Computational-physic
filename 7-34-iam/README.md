# 7.34

**The random walk is a typical Montecarlo problem that's is closely related to brownian motion and dispersion. A simplified version of the problem consist of a griled city with streets of the same length, $l$.**

**a) If you choose a direction randomly, show that after $N$ steps the mean squared displacement, $d_{rms}$ is proportional to $\sqrt{N}$**

For this problem I just pick an integrer random number between 0 and 3. If I get 0 I add 1 to the $x$ variable, if I get 1 I subtract one from it. And do the same for the $y$ variable. At the end I get a motion that looks like: 

![alt text][logo]

[logo]:https://github.com/Olinty-3/Computational-physic/blob/main/7-34-iam/7-34-d1-iam.png

Where the different colors are different values of $N$. They all start at the red dot, at (0,0) and end at the dot of each respective color.

To compute the mean squared displacement I use the formula: 

$$ d_{rms} = \sqrt{ \frac{1}{k} \sum_i^k (x_N^2 + y_N^2) } $$

where k is the number of simulations, in my case $k=10000$. Then I plot $d_{rms}$ as a function of $N$.

![alt text][logo2]

[logo2]:https://github.com/Olinty-3/Computational-physic/blob/main/7-34-iam/7-34-a2-iam.png

And fit it for the expresion: 

$$ d_{rms} = a \sqrt{N} + b $$

I get $a = 0.9947 \pm 0.0016$ and $b =0.104 \pm 0.089$


**Now we are goint to let the direction of motion and the size of the steps to also be random**

**b) Compute the relation betwen the $d_rms$ and $N$ if the size of the steps follows a unifrom distribution between $l_1 = 50$ cm and $l_2 = 70$ cm**

Firstly, I pick a random number between 0 and $2\pi$, $\theta$. The direction of motion will be given by the vector ($sin\theta$, $cos\theta$). Then, for the size of the step I use: 

$$ l = l_1 - (l_2-l_1) r $$

where r is a random number between 0 and 1. The paths for different $N$'s look like: 

![alt text][logo3]

[logo3]:https://github.com/Olinty-3/Computational-physic/blob/main/7-34-iam/7-34-d2-iam.png

We plot the data and fit it to the same type of relation with $N$: 

$$ d_{rms} = a \sqrt{N} + b $$

![alt text][logo4]

[logo4]:https://github.com/Olinty-3/Computational-physic/blob/main/7-34-iam/7-34-b2-iam.png

In this case $a = 59.770 \pm 0.097$ and $b = 8.3 \pm 1.8$ 

**c) Lastly, compute the same but this time the size of each step will follow a decreasong exponential with mean value $l = 60$**


















