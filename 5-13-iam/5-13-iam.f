* 5-13-2-iam.f 

************************************************************************

* Calculo de la orbita de Pluton como un problema de condiciones de contorno

*           Isabel Alfonso Marchante

************************************************************************

      include '/rk4.f'
      parameter (n=4)       ! n = orden de la ecuacion diferencial
      parameter(npasos=1000) ! numero de subintervalos en que divido el dominio [x0, xf]
      dimension y(n),dydx(n),yout(n)
      external derivs
      common/ene/nn ! common para pasar el orden de la ecuacion diferencial
      common/cte/A ! common para pasar las constante
      real m !defino la masa como real 
      nn=n
      
* Datos para comprobar la validez del modelo 

      m = 1.25e22 !kg
      pi = acos(-1.0)
      A = 4.0 * pi**2.0      
      
        
* valores inicial (x0) y final (xf) de la variable independiente ( tiempo ) ( representare tres orbitas ) 

      x0 = 0.0 
      xf = 3.0 * 248.77 !años
      
* condiciones de contorno para la funcion (posicion) 
                         ! eje x 
      y01= 29.65 !UA     ! valor de la funcion en el origen del dominio
      yf1= y01            ! valor de la funcion en el final del dominio
                         ! eje y 
      y02 = 0.0 !UA
      yf2 = y02

* comenzamos el calculo a partir de dos valores de prueba para la derivada (y(2),y(4)) de la funcion en el origen del dominio
* me invento ambos valores 

      vx = 0 

      vy1=0.5 !UA/año
      vy2=3.0

      h=(xf-x0)/real(npasos) ! paso con que se recorre "x"

* hago los calculos usando cada uno de los valores de prueba para la derivada en el origen del dominio; 

      do k=1,8  ! comienzan los intentos
        x = x0         ! fijo valor inicial de la variable independiente t 
        y(1) = y01     ! fijo valor inicial de la funcion x
        y(3) = y02     ! fijo valor inicial de la funcion y 

* mediante los "if" que siguen fijo el valor inicial de la pendiente y(2),y(4) en diferentes intentos
        if(k.eq.1) then       ! primer intento
          y(2) = vx
          y(4) = vy1
          open(10,file='5-13-1-iam.dat',status='unknown')
        else if(k.eq.2) then  ! segundo intento
          y(2) = vx
          y(4) = vy2
          open(10,file='5-13-2-iam.dat',status='unknown')
        else if(k.eq.3) then  ! tercer intento
          y(2) = vx
          y(4) = vy2 - (y2f2-yf2)*(vy2-vy1)/(y2f2-y2f1)
          vy3 = y(4)
         open(10,file='5-13-3-iam.dat',status='unknown')
        else if(k.eq.4) then  ! cuarto intento
          y(2) = vx
          y(4) = vy3 - (y2f3-yf2)*(vy3-vy2)/(y2f3-y2f2) 
          vy4 = y(4) 
          open(10,file='5-13-4-iam.dat',status='unknown')
        else if(k.eq.5) then  ! quinto intento
          y(2) = vx
          y(4) = vy4 - (y2f4-yf2)*(vy4-vy3)/(y2f4-y2f3)
          vy5 = y(4) 
          open(10,file='5-13-5-iam.dat',status='unknown')
        else if(k.eq.6) then !sexto intento
          y(2) = vx
          y(4) = vy5 - (y2f5-yf2) * (vy5-vy4)/(y2f5-y2f4)
          vy6 = y(4)
          open(10,file='5-13-6-iam.dat',status='unknown')
        else if(k.eq.7) then !setimo intento
          y(2) = vx
          y(4) = vy6 - (y2f6-yf2) * (vy6-vy5)/(y2f6-y2f5)
          vy7 = y(4)
          open(10,file='5-13-7-iam.dat',status='unknown')
        else if(k.eq.8) then !setimo intento
          y(2) = vx
          y(4) = vy7 - (y2f7-yf2) * (vy7-vy6)/(y2f7-y2f6)
          vy8 = y(4)
          open(10,file='5-13-8-iam.dat',status='unknown')
        end if
 
        write(10,*) ' t, x, dx, y, dy , E , va' 
        write(10,*)
        write(10,*) x,y(1),y(2),y(3),y(4)   ! escribo resultados al principio de cada intento

        do i=1,npasos    !  recorro los diferentes puntos "x" donde evaluare la funcion
          call derivs(x,y,dydx)
          call rk4(y,dydx,nn,x,h,yout,derivs)  ! subrutina RK4 que devuelve la funcion y(x+h) evaluada en el punto x+h
          x=x0+i*h  ! redefino el valor de entrada para la "x" en el siguiente paso
          E = m *(0.5*(y(2)**2 +y(4)**2) - A/(y(1)**2 + y(3)**2)**(0.5)) ! Calculo de la energía para comprobar que los cálculos estan bien E = Ec + Ep 
          va = 0.5 * abs(y(1)*y(4) - y(3) * y(2) ) ! Calculo la velocidad aerolar para comprobar los calculos va = 1/2m |r x mv|
          do j=1,nn         ! redefino los valores de "y" para volver a usar...
            y(j)=yout(j)   ! ...las subrutinas "derivs" y "rk4"
          end do
          write(10,*) x , y(1) , y(2) , y(3) , y(4) , E , va ! escribo resultados a medida que se calculan 
        end do
        close(10)
        if(k.eq.1) y1f1=y(1) ! guardo resultado al final del intento 1
        if(k.eq.1) y2f1=y(3)
        
        if(k.eq.2) y1f2=y(1)  ! guardo resultado al final del intento 2
        if(k.eq.2) y2f2=y(3)
        
        if(k.eq.3) y1f3=y(1)
        if(k.eq.3) y2f3=y(3)
        
        if(k.eq.4) y1f4=y(1)
        if(k.eq.4) y2f4=y(3)
        
        if(k.eq.5) y1f5=y(1)
        if(k.eq.5) y2f5=y(3)
        
        if(k.eq.6) y2f6=y(3)
        if(k.eq.7) y2f7=y(3)
      end do      ! fin del bucle para los intentos
      
      write(*,*) 'programa finalizado'
      
      stop
      end
      
************************************************************************
      subroutine derivs(x,y,dy) !  sistema de ecs. difs. que hay que resolver
************************************************************************
* y(1) = x y(2) = dx/dt  y(3) = y y(4) = dy/dt

      dimension y(nn),dy(nn)
      common/ene/nn       
      common/cte/A
      
      dy(1) = y(2)
      dy(2) = - A  * y(1) * (y(1)**2.0 + y(3)**2.0)**(-3.0/2.0)
      dy(3) = y(4)
      dy(4) = - A * y(3) * (y(1)**2.0 + y(3)**2.0)**(-3.0/2.0)
      
      return
      end
