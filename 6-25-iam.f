* 6-25-iam.f

************************************************************************

* Evolucion temporal de la temperatura de dos barras en contacto 

* Isabel Alfonso Marchante 

************************************************************************

      parameter (nx = 200 ) !numero de intervalos en los que divido las barras, debe ser divisible entre 2 ya que hay dos barras con temperaturas iniciales diferenciadas 
      parameter (nt=70000) ! indice maximo del tiempo, podemos variarlo para llegar a la situacion estacionaria
      dimension u(0:nx) , unew(0:nx) , u2(0:nx) , u2new(0:nx) ! temperatura (celsius) 
      character jtiempo*5 ! variable character para guardar la temperatura en distintos momentos 
      
      nx2 = nx/2 ! variable para recorer los distintos bucles de las condiciones iniciales del problema 
      
* Datos ( en SI, salvo la temperatura que se da en celsius ) 

      alphaAl = 9.75e-5 !difusivid termica aluminio 
      x0 = 0.0 ! extremo izquierdo de la barra 
*      x1 = 0.25 ! punto de contacto entre las barras 
      xf = 0.50 ! extremo derecho de la barra
      t0 = 0.0
      
      hx = (xf-x0)/real(nx) ! incremento espacial para discretizar la longitud de la barra
      ht = 0.5 * hx**2.0 / alphaAl ! incremento temporal para discretizar la evolucion temporal; maximo valor permitido de ht
      
* Preparo los ficheros que quiero guardar. Me interesa guardar muchos al principio y no tantos al final, por eso creo dos jframes 
    
      jframe1 = nt/14 ! indica cada cuantos pasos temporarles se guardan los resultados en un fichero; de aqui guardare los ultimos momentos temportales    
      jframe2 = nt/140 ! de aqui solo guardare los primeros 
      
  
* Condiciones iniciales    
    
      open(10,file='6-25-00000-iam.dat') !fichero para escribir los datos en t = 0 
      write(10,*) '#     x        T '
      
      u(0) = 0.0
      write(10,*) x0 , u(0) 
      
      do i = 1, nx2 ! Primera barra 
        x = x0 + i*hx 
        u(i) = 50 
        write(10,*) x , u(i)
      end do 
      
      do i = nx2 , nx 
        x = x0 + i*hx
        u(i) = 100
        write(10,*) x , u(i) 
      end do 
      
      u(nx) = 0.0 
      write(10,*) xf , u(nx) 
      
      close(10) 
      
* Resuelvo el problema 

      cte=alphaAl*ht/hx**2.0 ! defino esta cte por que aparecera mucho
      
      do j = 0 , nt 
        t = t0 + j*ht
        do i = 1 , nx-1
          unew(i) = u(i) + cte * (u(i-1) - 2.0 * u(i) + u(i+1) ) 
        end do 
        do i = 1 , nx-1
          u(i) = unew(i) ! renombro los valores recien calculados para usarlos en el sigiente instante
        end do 
        do jj = 1, 10 !creo un nuevo bucle para escribir las temperaturas a lo largo de la evolucion
          if(j.eq.jj*jframe1) then 
            write(jtiempo , '(i5.5)' ) j
            open(10,file='6-25-'//jtiempo//'-iam.dat')
            write(10,*) '# instente = ' , j , 'tiempo = ' , t  
            write(10,*) ' #    x    T '
            do i = 0 , nx ! abrimos otro bucle para recorer u(i) y escribirlo
              x = x0 + i*hx 
              write(10,*) x , u(i) 
            end do 
            close(10)
          end if 
        end do 
        do jj = 1, 7 ! abro otro bucle para escribir las temperaturas 
          if(j.eq.jj*jframe2) then 
            write(jtiempo , '(i5.5)' ) j
            open(10,file='6-25-'//jtiempo//'-iam.dat')
            write(10,*) '# instente = ' , j , 'tiempo = ' , t  
            write(10,*) ' #    x    T '
            do i = 0 , nx ! abrimos otro bucle para recorer u(i) y escribirlo
              x = x0 + i*hx 
              write(10,*) x , u(i) 
            end do 
            close(10)
          end if 
        end do 
      end do 
      
* APARTADO b) , barra 1 aluminio , barra 2 hierro 

* La mayoría de cte ya se han definido en el apartado anterior pero hay que redefinir varias 
      
      alphaFe = 2.28e-5  ! (SI) difusividad termica hierro
      
* He defindo ht usando alphaAl, pero como esta es mayor que la del hierro estoy coguiendo un paso más pequeño que 
* el maximo para la barra de hierro. La barra mezcla tiene que tener el mismo paso temporal en los dos lados 
* por lo que me quedo con el paso temporal mas pequeño, que es el valido para ambos lados y es el que ya habia calculado  

      cte2 = alphaFe*ht/hx**2.0
      
* En este segundo apartado la evolucion temporal es mucho más lenta, por lo que defino dos nuevos saltos temporales. 
      
      jframe3 = nt/7
      jframe4 = nt/70
      
* Escribimos las condiciones iniciales de esta segunda barra, que son las mismas que la primera

      open(10,file='6-25b-00000-iam.dat') !fichero para escribir los datos en t = 0 
      write(10,*) '#     x        T '
      
      u2(0) = 0.0
      write(10,*) x0 , u2(0) 
      
      do i = 1, nx2-1 ! Primera barra 
        x = x0 + i*hx 
        u2(i) = 50 
        write(10,*) x , u2(i)
      end do 
      
      do i = nx2 , nx 
        x = x0 + i*hx
        u2(i) = 100
        write(10,*) x , u2(i) 
      end do 
      
      u2(nx) = 0.0 
      write(10,*) xf , u2(nx) 
      
      close(10)
    
* Calculamos la evolución temporal

      do j = 0 , nt 
        t = t0 + j*ht
        do i = 1 , nx2-1 !Primera barra 
          u2new(i) = u2(i) + cte2 * (u2(i-1) - 2.0 * u2(i) + u2(i+1) ) 
        end do 
        do i = nx2 , nx-1 ! Segunda barra
          u2new(i) = u2(i) + cte * (u2(i-1) - 2.0 * u2(i) + u2(i+1) )
        end do 
        do i = 1 , nx-1
          u2(i) = u2new(i) ! renombro los valores recien calculados para usarlos en el sigiente instante
        end do 
        do jj = 1, 7 !creo un nuevo bucle para escribir las temperaturas a lo largo de la evolucion
          if(j.eq.jj*jframe3) then 
            write(jtiempo , '(i5.5)' ) j
            open(10,file='6-25b-'//jtiempo//'-iam.dat')
            write(10,*) '# instente = ' , j , 'tiempo = ' , t  
            write(10,*) ' #    x    T '
            do i = 0 , nx ! abrimos otro bucle para recorer u2(i) y escribirlo
              x = x0 + i*hx 
              write(10,*) x , u2(i) 
            end do 
            close(10)
          end if 
        end do 
        do jj = 1, 6 ! abro otro bucle para escribir las temperaturas 
          if(j.eq.jj*jframe4) then 
            write(jtiempo , '(i5.5)' ) j
            open(10,file='6-25b-'//jtiempo//'-iam.dat')
            write(10,*) '# instente = ' , j , 'tiempo = ' , t  
            write(10,*) ' #    x    T '
            do i = 0 , nx ! abrimos otro bucle para recorer u2(i) y escribirlo
              x = x0 + i*hx 
              write(10,*) x , u2(i) 
            end do
            close(10)
          end if 
        if (j.eq.jframe2) then ! un ultimo if para que quede clara la evolucion temporal del sistema
            write(jtiempo , '(i5.5)' ) j
            open(10,file='6-25b-'//jtiempo//'-iam.dat')
            write(10,*) '# instente = ' , j , 'tiempo = ' , t  
            write(10,*) ' #    x    T '
            do i = 0 , nx ! abrimos otro bucle para recorer u2(i) y escribirlo
              x = x0 + i*hx 
              write(10,*) x , u2(i) 
            end do
            close(10)
          end if 
        end do 
      end do  

      
      stop 
      end 
      
      
