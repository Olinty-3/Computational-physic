* 7-43-iam.f 

************************************************************************

* El paseo del borracho

*  Isabel Alfonso Marchante

************************************************************************

      include '/ran2.f'
      real la , lb , lc 
      
      k = 10000
      iseed1 = - 48746679 ! escogemos varias semillas, para los distintos apartados
      iseed2 = - 68103782
      iseed3 = - 16820992
      iseed4 = - 87201811
      iseed5 = - 96826191
      
      pi = acos(-1.0)

* datos del problema:     
      
      la = 1.0 
      a1 = 0.0 ! valores para decidir hacia donde se mueve en el apartado a)
      b1 = 4.0
      a2 = 0.0  ! valores para decidir hacia donde se mueve en los apartados b) y c)
      b2 = 2.0*pi 
      a3 = 50.0 !cm
      b3 = 70.0 !cm
      gamma = 60.0 !cm //  valor medio distribucion exponencial decreciente (apartado c) )
      
* Para comprobar que se cumple para cualquier N, defino varias 

      N1 = 10 
      N2 = 50
      N3 = 75
      N4 = 100
      N5 = 250 
      N6 = 500
      N7 = 750
      N8 = 1000
      
      dn1a = 0.0 
      dn2a = 0.0
      dn3a = 0.0 
      dn4a = 0.0
      dn5a = 0.0 
      dn6a = 0.0
      dn7a = 0.0 
      dn8a = 0.0
      
      dn1b = 0.0 
      dn2b = 0.0
      dn3b = 0.0 
      dn4b = 0.0
      dn5b = 0.0 
      dn6b = 0.0
      dn7b = 0.0 
      dn8b = 0.0
      
      dn1c = 0.0 
      dn2c = 0.0
      dn3c = 0.0 
      dn4c = 0.0
      dn5c = 0.0 
      dn6c = 0.0
      dn7c = 0.0 
      dn8c = 0.0

* Creo varios bucles donde calculo las distancias medias  

      do m = 0 , k !primer bucle
      
        iseed1 = iseed1 + m ! voy variando la semilla para que me de secuencias distintas cada vez 
        iseed2 = iseed2 - m 
        iseed3 = iseed3 + m
        iseed4 = iseed4 - m
        iseed5 = iseed5 + m
        
        
        xa = 0.0 ! valores de la posicion apartado a)
        ya = 0.0
        xb = 0.0 ! valores de la posicion apartado b)
        yb = 0.0 
        xc = 0.0 ! valores de la posicion apartado c)
        yc = 0.0 
        
        do i = 0 , N1  !Creo un bucle donde se generan numeros aleatorios que dictaminan hacia donde se mueve 
        
          r1 = ran2(iseed1)
          r2 = ran2(iseed2)
          r3 = ran2(iseed3)
          r4 = ran2(iseed4)
          r5 = ran2(iseed5)
          
          za = a1 + (b1-a1) * r1
          zb = a2 + (b2-a2) * r2
          zc = a2 + (b2-a2) * r3
          lb = a3 + (b3-a3) * r4
          lc = - log(1.0-r5)/gamma
          
          j = za ! de esta forma transformo el valor z en entero
        
* Calculo trayectoria apartado a)
        
          if (j.eq.0) xa = xa + la
          if (j.eq.1) xa = xa - la
          if (j.eq.2) ya = ya + la 
          if (j.eq.3) ya = ya - la 
          
* Calculo trayectoria apartado b)

          xb = xb + lb * cos(zb)
          yb = yb + lb * sin(zb)
          
* Calculo trayectoria apartado c)

          xc = xc + lc * cos(zc)
          yc = yc + lc * sin(zc)
        
        end do 
      
      d1a = xa**2 + ya**2 ! calculo el cuadrado de la distancia media de cada simulación 
      dn1a = dn1a + d1a ! calculo la suma de los cuadrados medios
      
      d1b = xb**2 + yb**2 
      dn1b = dn1b + d1b
      
      d1c = xc**2 + yc**2 
      dn1c = dn1c + d1c
      
      end do 
      
      do m = 0 , k !segundo bucle
      
        iseed1 = iseed1 + m - k  ! voy variando la semilla para que me de secuencias distintas cada vez 
        iseed2 = iseed2 - m - k
        iseed3 = iseed3 + m - k 
        iseed4 = iseed4 - m - k
        iseed5 = iseed5 + m - k 
        
        
        xa = 0.0 ! valores de la posicion apartado a)
        ya = 0.0
        xb = 0.0 ! valores de la posicion apartado b)
        yb = 0.0 
        xc = 0.0 ! valores de la posicion apartado c)
        yc = 0.0 
        
        do i = 0 , N2  !Creo un bucle donde se generan numeros aleatorios que dictaminan hacia donde se mueve 
        
          r1 = ran2(iseed1)
          r2 = ran2(iseed2)
          r3 = ran2(iseed3)
          r4 = ran2(iseed4)
          r5 = ran2(iseed5)
          
          za = a1 + (b1-a1) * r1
          zb = a2 + (b2-a2) * r2
          zc = a2 + (b2-a2) * r3
          lb = a3 + (b3-a3) * r4
          lc = - log(1.0-r5)/gamma
          
          j = za ! de esta forma transformo el valor z en entero
        
* Calculo trayectoria apartado a)
        
          if (j.eq.0) xa = xa + la
          if (j.eq.1) xa = xa - la
          if (j.eq.2) ya = ya + la 
          if (j.eq.3) ya = ya - la 
          
* Calculo trayectoria apartado b)

          xb = xb + lb * cos(zb)
          yb = yb + lb * sin(zb)
          
* Calculo trayectoria apartado c)

          xc = xc + lc * cos(zc)
          yc = yc + lc * sin(zc)
        
        end do 
      
      d2a = xa**2 + ya**2 ! calculo el cuadrado de la distancia media de cada simulación 
      dn2a = dn2a + d2a ! calculo la suma de los cuadrados medios
      
      d2b = xb**2 + yb**2 
      dn2b = dn2b + d2b
      
      d2c = xc**2 + yc**2 
      dn2c = dn2c + d2c
      
      end do 
      
      do m = 0 , k !tercer bucle
      
        iseed1 = iseed1 + m - 2*k! voy variando la semilla para que me de secuencias distintas cada vez 
        iseed2 = iseed2 - m - 2*k
        iseed3 = iseed3 + m - 2*k
        iseed4 = iseed4 - m - 2*k
        iseed5 = iseed5 + m - 2*k
        
        
        xa = 0.0 ! valores de la posicion apartado a)
        ya = 0.0
        xb = 0.0 ! valores de la posicion apartado b)
        yb = 0.0 
        xc = 0.0 ! valores de la posicion apartado c)
        yc = 0.0 
        
        do i = 0 , N3  !Creo un bucle donde se generan numeros aleatorios que dictaminan hacia donde se mueve 
        
          r1 = ran2(iseed1)
          r2 = ran2(iseed2)
          r3 = ran2(iseed3)
          r4 = ran2(iseed4)
          r5 = ran2(iseed5)
          
          za = a1 + (b1-a1) * r1
          zb = a2 + (b2-a2) * r2
          zc = a2 + (b2-a2) * r3
          lb = a3 + (b3-a3) * r4
          lc = - log(1.0-r5)/gamma
          
          j = za ! de esta forma transformo el valor z en entero
        
* Calculo trayectoria apartado a)
        
          if (j.eq.0) xa = xa + la
          if (j.eq.1) xa = xa - la
          if (j.eq.2) ya = ya + la 
          if (j.eq.3) ya = ya - la 
          
* Calculo trayectoria apartado b)

          xb = xb + lb * cos(zb)
          yb = yb + lb * sin(zb)
          
* Calculo trayectoria apartado c)

          xc = xc + lc * cos(zc)
          yc = yc + lc * sin(zc)
        
        end do 
      
      d3a = xa**2 + ya**2 ! calculo el cuadrado de la distancia media de cada simulación 
      dn3a = dn3a + d3a ! calculo la suma de los cuadrados medios
      
      d3b = xb**2 + yb**2 
      dn3b = dn3b + d3b
      
      d3c = xc**2 + yc**2 
      dn3c = dn3c + d3c
      
      end do 
      
      
      do m = 0 , k !cuarto bucle
      
        iseed1 = iseed1 + m - 3*k ! voy variando la semilla para que me de secuencias distintas cada vez 
        iseed2 = iseed2 - m - 3*k
        iseed3 = iseed3 + m - 3*k
        iseed4 = iseed4 - m - 3*k
        iseed5 = iseed5 + m - 3*k
        
        
        xa = 0.0 ! valores de la posicion apartado a)
        ya = 0.0
        xb = 0.0 ! valores de la posicion apartado b)
        yb = 0.0 
        xc = 0.0 ! valores de la posicion apartado c)
        yc = 0.0 
        
        do i = 0 , N4  !Creo un bucle donde se generan numeros aleatorios que dictaminan hacia donde se mueve 
        
          r1 = ran2(iseed1)
          r2 = ran2(iseed2)
          r3 = ran2(iseed3)
          r4 = ran2(iseed4)
          r5 = ran2(iseed5)
          
          za = a1 + (b1-a1) * r1
          zb = a2 + (b2-a2) * r2
          zc = a2 + (b2-a2) * r3
          lb = a3 + (b3-a3) * r4
          lc = - log(1.0-r5)/gamma
          
          j = za ! de esta forma transformo el valor z en entero
        
* Calculo trayectoria apartado a)
        
          if (j.eq.0) xa = xa + la
          if (j.eq.1) xa = xa - la
          if (j.eq.2) ya = ya + la 
          if (j.eq.3) ya = ya - la 
          
* Calculo trayectoria apartado b)

          xb = xb + lb * cos(zb)
          yb = yb + lb * sin(zb)
          
* Calculo trayectoria apartado c)

          xc = xc + lc * cos(zc)
          yc = yc + lc * sin(zc)
        
        end do 
      
      d4a = xa**2 + ya**2 ! calculo el cuadrado de la distancia media de cada simulación 
      dn4a = dn4a + d4a ! calculo la suma de los cuadrados medios
      
      d4b = xb**2 + yb**2 
      dn4b = dn4b + d4b
      
      d4c = xc**2 + yc**2 
      dn4c = dn4c + d4c
      
      end do 
      
      do m = 0 , k !quinto bucle
      
        iseed1 = iseed1 + m - 4*k ! voy variando la semilla para que me de secuencias distintas cada vez 
        iseed2 = iseed2 - m - 4*k
        iseed3 = iseed3 + m - 4*k
        iseed4 = iseed4 - m - 4*k
        iseed5 = iseed5 + m - 4*k
        
        
        xa = 0.0 ! valores de la posicion apartado a)
        ya = 0.0
        xb = 0.0 ! valores de la posicion apartado b)
        yb = 0.0 
        xc = 0.0 ! valores de la posicion apartado c)
        yc = 0.0 
        
        do i = 0 , N5  !Creo un bucle donde se generan numeros aleatorios que dictaminan hacia donde se mueve 
        
          r1 = ran2(iseed1)
          r2 = ran2(iseed2)
          r3 = ran2(iseed3)
          r4 = ran2(iseed4)
          r5 = ran2(iseed5)
          
          za = a1 + (b1-a1) * r1
          zb = a2 + (b2-a2) * r2
          zc = a2 + (b2-a2) * r3
          lb = a3 + (b3-a3) * r4
          lc = - log(1.0-r5)/gamma
          
          j = za ! de esta forma transformo el valor z en entero
        
* Calculo trayectoria apartado a)
        
          if (j.eq.0) xa = xa + la
          if (j.eq.1) xa = xa - la
          if (j.eq.2) ya = ya + la 
          if (j.eq.3) ya = ya - la 
          
* Calculo trayectoria apartado b)

          xb = xb + lb * cos(zb)
          yb = yb + lb * sin(zb)
          
* Calculo trayectoria apartado c)

          xc = xc + lc * cos(zc)
          yc = yc + lc * sin(zc)
        
        end do 
      
      d5a = xa**2 + ya**2 ! calculo el cuadrado de la distancia media de cada simulación 
      dn5a = dn5a + d5a ! calculo la suma de los cuadrados medios
      
      d5b = xb**2 + yb**2 
      dn5b = dn5b + d5b
      
      d5c = xc**2 + yc**2 
      dn5c = dn5c + d5c
      
      end do 


      do m = 0 , k !sexto bucle
      
        iseed1 = iseed1 + m - 5*k ! voy variando la semilla para que me de secuencias distintas cada vez 
        iseed2 = iseed2 - m - 5*k
        iseed3 = iseed3 + m - 5*k
        iseed4 = iseed4 - m - 5*k
        iseed5 = iseed5 + m - 5*k
        
        
        xa = 0.0 ! valores de la posicion apartado a)
        ya = 0.0
        xb = 0.0 ! valores de la posicion apartado b)
        yb = 0.0 
        xc = 0.0 ! valores de la posicion apartado c)
        yc = 0.0 
        
* N6 = 500 , de aqui guardo las trayectorias para el apartado d)

       if(m.eq.1) then
         open(10,file= '7-34-d-a1-iam.dat')
         write(10,*) '#   x     y'
         open(20,file= '7-34-d-b1-iam.dat')
         write(20,*) '#   x     y'
         open(30,file= '7-34-d-c1-iam.dat')
         write(30,*) '#   x     y'
       end if
       
       if(m.eq.2) then
         open(10,file= '7-34-d-a2-iam.dat')
         write(10,*) '#   x     y'
         open(20,file= '7-34-d-b2-iam.dat')
         write(20,*) '#   x     y'
         open(30,file= '7-34-d-c2-iam.dat')
         write(30,*) '#   x     y'
       end if
       
       if(m.eq.3) then
         open(10,file= '7-34-d-a3-iam.dat')
         write(10,*) '#   x     y'
         open(20,file= '7-34-d-b3-iam.dat')
         write(20,*) '#   x     y'
         open(30,file= '7-34-d-c3-iam.dat')
         write(30,*) '#   x     y'
       end if
       
       if(m.eq.4) then
         open(10,file= '7-34-d-a4-iam.dat')
         write(10,*) '#   x     y'
         open(20,file= '7-34-d-b4-iam.dat')
         write(20,*) '#   x     y'
         open(30,file= '7-34-d-c4-iam.dat')
         write(30,*) '#   x     y'
       end if
       
       if(m.eq.5) then
         open(10,file= '7-34-d-a5-iam.dat')
         write(10,*) '#   x     y'
         open(20,file= '7-34-d-b5-iam.dat')
         write(20,*) '#   x     y'
         open(30,file= '7-34-d-c5-iam.dat')
         write(30,*) '#   x     y'
       end if
         
        
        do i = 0 , N6  !Creo un bucle donde se generan numeros aleatorios que dictaminan hacia donde se mueve 
        
          r1 = ran2(iseed1)
          r2 = ran2(iseed2)
          r3 = ran2(iseed3)
          r4 = ran2(iseed4)
          r5 = ran2(iseed5)
          
          za = a1 + (b1-a1) * r1
          zb = a2 + (b2-a2) * r2
          zc = a2 + (b2-a2) * r3
          lb = a3 + (b3-a3) * r4
          lc = - log(1.0-r5)/gamma
          
          j = za ! de esta forma transformo el valor z en entero
        
* Calculo trayectoria apartado a)
        
          if (j.eq.0) xa = xa + la
          if (j.eq.1) xa = xa - la
          if (j.eq.2) ya = ya + la 
          if (j.eq.3) ya = ya - la 
          
* Calculo trayectoria apartado b)

          xb = xb + lb * cos(zb)
          yb = yb + lb * sin(zb)
          
* Calculo trayectoria apartado c)

          xc = xc + lc * cos(zc)
          yc = yc + lc * sin(zc)
          
          write(10,*) xa , ya
          write(20,*) xb , yb
          write(30,*) xc , yc
          
        end do 
        
      if (m.eq.1) then 
        close(10)
        close(20)
        close(30) 
      end if
      
      if (m.eq.2) then 
        close(10)
        close(20)
        close(30) 
      end if
      
      if (m.eq.3) then 
        close(10)
        close(20)
        close(30) 
      end if
      
      if (m.eq.4) then 
        close(10)
        close(20)
        close(30) 
      end if
      
      if (m.eq.5) then 
        close(10)
        close(20)
        close(30) 
      end if
      
      d6a = xa**2 + ya**2 ! calculo el cuadrado de la distancia media de cada simulación 
      dn6a = dn6a + d6a ! calculo la suma de los cuadrados medios
      
      d6b = xb**2 + yb**2 
      dn6b = dn6b + d6b
      
      d6c = xc**2 + yc**2 
      dn6c = dn6c + d6c
      
      end do 
      
      
      do m = 0 , k !septimo bucle
      
        iseed1 = iseed1 + m - 6*k ! voy variando la semilla para que me de secuencias distintas cada vez 
        iseed2 = iseed2 - m - 6*k
        iseed3 = iseed3 + m - 6*k
        iseed4 = iseed4 - m - 6*k
        iseed5 = iseed5 + m - 6*k
        
        
        xa = 0.0 ! valores de la posicion apartado a)
        ya = 0.0
        xb = 0.0 ! valores de la posicion apartado b)
        yb = 0.0 
        xc = 0.0 ! valores de la posicion apartado c)
        yc = 0.0 
        
        do i = 0 , N7  !Creo un bucle donde se generan numeros aleatorios que dictaminan hacia donde se mueve 
        
          r1 = ran2(iseed1)
          r2 = ran2(iseed2)
          r3 = ran2(iseed3)
          r4 = ran2(iseed4)
          r5 = ran2(iseed5)
          
          za = a1 + (b1-a1) * r1
          zb = a2 + (b2-a2) * r2
          zc = a2 + (b2-a2) * r3
          lb = a3 + (b3-a3) * r4
          lc = - log(1.0-r5)/gamma
          
          j = za ! de esta forma transformo el valor z en entero
        
* Calculo trayectoria apartado a)
        
          if (j.eq.0) xa = xa + la
          if (j.eq.1) xa = xa - la
          if (j.eq.2) ya = ya + la 
          if (j.eq.3) ya = ya - la 
          
* Calculo trayectoria apartado b)

          xb = xb + lb * cos(zb)
          yb = yb + lb * sin(zb)
          
* Calculo trayectoria apartado c)

          xc = xc + lc * cos(zc)
          yc = yc + lc * sin(zc)
        
        end do 
      
      d7a = xa**2 + ya**2 ! calculo el cuadrado de la distancia media de cada simulación 
      dn7a = dn7a + d7a ! calculo la suma de los cuadrados medios
      
      d7b = xb**2 + yb**2 
      dn7b = dn7b + d7b
      
      d7c = xc**2 + yc**2 
      dn7c = dn7c + d7c
      
      end do 
      
      do m = 0 , k !octavo bucle
      
        iseed1 = iseed1 + m - 7*k ! voy variando la semilla para que me de secuencias distintas cada vez 
        iseed2 = iseed2 - m - 7*k
        iseed3 = iseed3 + m - 7*k
        iseed4 = iseed4 - m - 7*k
        iseed5 = iseed5 + m - 7*k
        
        
        xa = 0.0 ! valores de la posicion apartado a)
        ya = 0.0
        xb = 0.0 ! valores de la posicion apartado b)
        yb = 0.0 
        xc = 0.0 ! valores de la posicion apartado c)
        yc = 0.0 
        
        do i = 0 , N8  !Creo un bucle donde se generan numeros aleatorios que dictaminan hacia donde se mueve 
        
          r1 = ran2(iseed1)
          r2 = ran2(iseed2)
          r3 = ran2(iseed3)
          r4 = ran2(iseed4)
          r5 = ran2(iseed5)
          
          za = a1 + (b1-a1) * r1
          zb = a2 + (b2-a2) * r2
          zc = a2 + (b2-a2) * r3
          lb = a3 + (b3-a3) * r4
          lc = - log(1.0-r5)/gamma
          
          j = za ! de esta forma transformo el valor z en entero
        
* Calculo trayectoria apartado a)
        
          if (j.eq.0) xa = xa + la
          if (j.eq.1) xa = xa - la
          if (j.eq.2) ya = ya + la 
          if (j.eq.3) ya = ya - la 
          
* Calculo trayectoria apartado b)

          xb = xb + lb * cos(zb)
          yb = yb + lb * sin(zb)
          
* Calculo trayectoria apartado c)

          xc = xc + lc * cos(zc)
          yc = yc + lc * sin(zc)
        
        end do 
      
      d8a = xa**2 + ya**2 ! calculo el cuadrado de la distancia media de cada simulación 
      dn8a = dn8a + d8a ! calculo la suma de los cuadrados medios
      
      d8b = xb**2 + yb**2 
      dn8b = dn8b + d8b
      
      d8c = xc**2 + yc**2 
      dn8c = dn8c + d8c
      
      end do 
      
      dn1a = dn1a/(k+1)
      dn2a = dn2a/(k+1) 
      dn3a = dn3a/(k+1)
      dn4a = dn4a/(k+1)
      dn5a = dn5a/(k+1)
      dn6a = dn6a/(k+1) 
      dn7a = dn7a/(k+1)
      dn8a = dn8a/(k+1)
      
      dn1b = dn1b/(k+1)
      dn2b = dn2b/(k+1) 
      dn3b = dn3b/(k+1)
      dn4b = dn4b/(k+1)
      dn5b = dn5b/(k+1)
      dn6b = dn6b/(k+1) 
      dn7b = dn7b/(k+1)
      dn8b = dn8b/(k+1)
      
      dn1c = dn1c/(k+1)
      dn2c = dn2c/(k+1) 
      dn3c = dn3c/(k+1)
      dn4c = dn4c/(k+1)
      dn5c = dn5c/(k+1)
      dn6c = dn6c/(k+1) 
      dn7c = dn7c/(k+1)
      dn8c = dn8c/(k+1)
      
      drms1a = sqrt(dn1a) 
      drms2a = sqrt(dn2a)
      drms3a = sqrt(dn3a) 
      drms4a = sqrt(dn4a)
      drms5a = sqrt(dn5a) 
      drms6a = sqrt(dn6a)
      drms7a = sqrt(dn7a) 
      drms8a = sqrt(dn8a)
      
      drms1b = sqrt(dn1b) 
      drms2b = sqrt(dn2b)
      drms3b = sqrt(dn3b) 
      drms4b = sqrt(dn4b)
      drms5b = sqrt(dn5b) 
      drms6b = sqrt(dn6b)
      drms7b = sqrt(dn7b) 
      drms8b = sqrt(dn8b)
      
      drms1c = sqrt(dn1c) 
      drms2c = sqrt(dn2c)
      drms3c = sqrt(dn3c) 
      drms4c = sqrt(dn4c)
      drms5c = sqrt(dn5c) 
      drms6c = sqrt(dn6c)
      drms7c = sqrt(dn7c) 
      drms8c = sqrt(dn8c)
      
      
* Abro un fichero para escribir la distancia cuadrática media y N, así podre ver que funcion las relaciona en gnplot

       open(10, file='7-34-a-iam.dat')
       
       write(10,*) '#   N      drms '
       write(10,*)  N1 , drms1a 
       write(10,*)  N2 , drms2a 
       write(10,*)  N3 , drms3a 
       write(10,*)  N4 , drms4a 
       write(10,*)  N5 , drms5a 
       write(10,*)  N6 , drms6a 
       write(10,*)  N7 , drms7a 
       write(10,*)  N8 , drms8a 
       
       close(10)
       
       open(10, file='7-34-b-iam.dat')
       
       write(10,*) '#  N    drms   '
       write(10,*)  N1 , drms1b   
       write(10,*)  N2 , drms2b 
       write(10,*)  N3 , drms3b 
       write(10,*)  N4 , drms4b 
       write(10,*)  N5 , drms5b 
       write(10,*)  N6 , drms6b 
       write(10,*)  N7 , drms7b 
       write(10,*)  N8 , drms8b 
       
       close(10)
       
       open(10, file='7-34-c-iam.dat')
       
       write(10,*) '#    N       drms    '
       write(10,*)  N1 , drms1c  
       write(10,*)  N2 , drms2c 
       write(10,*)  N3 , drms3c 
       write(10,*)  N4 , drms4c 
       write(10,*)  N5 , drms5c 
       write(10,*)  N6 , drms6c 
       write(10,*)  N7 , drms7c 
       write(10,*)  N8 , drms8c 
       
       close(10)
      
      stop 
      end       
      
