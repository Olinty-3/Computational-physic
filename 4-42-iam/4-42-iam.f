* 4-42.iam.f

************************************************************************

* Resolucion de la ec. diferencial que describe el  oscilador de Duffing forzado

* Isabel Alfonso Marchante

************************************************************************

      include 'rk4-r8.f'
      implicit real*8 (a-h, o-z)
      parameter (n=2)  ! n = numero de ecucaciones diferenciales
      dimension y(n),dydx(n),yout(n) ,  y2(n),dydx2(n),yout2(n)
      external derivs
      common/const/ w02 , b , e , f  ! common para pasar los valores de las constantes
      common/ene/nn   ! common para pasar el orden de la ecuacion diferencial
      nn=n
      
* defino las constantes que intervienen en el problema (unidades SI)

      w02 = - 1.0d0 !w0**2
      b = 0.2d0 
      e = 0.1d0
      f = 1.0d0

      
* condiciones iniciales (unidades SI) 

      y(1) = 1.0d0
      y(2) = 0.0d0
      x0=0.0d0     ! valor inicial del tiemp
      xf = 150     ! valor final del tiempo 
      
      x=x0           ! fijo el valor de x desde donde se inician los calculos
      npasos= 1000
      h=(xf-x0)/real(npasos)
      
* abro un fichero para escribir los datos 
      
      open(10,file='4-42-a-iam.dat',status='unknown')

      write(10,*) '# tiempo        x       dx '
      
      do j=1,npasos    ! recorro los diferentes puntos x donde evaluare la funcion
        call derivs(x,y,dydx)
        call rk4(y,dydx,n,x,h,yout,derivs)  ! subrutina RK4 que devuelve la funcion y(x+h) evaluada en el punto x+h
        x=x0+j*h    ! redefino el valor de entrada para la "x" en el siguiente paso
        do i=1,n       ! redefino los valores de "y" para volver a usar...
          y(i)=yout(i) ! ...las subrutinas "derivs" y "rk4"
        end do
        write(10,*) x,(y(k),k=1,n) ! escribo resultados a medida que se calculan
      end do
      
      close(10)
      
* apartado c) cambio w 

      y2(1) = 1.0d0
      y2(2) = 0.0d0
      
      x2 = x0 
      
      open(20,file='4-42-c-iam.dat',status='unknown')

      write(20,*) '# tiempo        x       dx '
      
      do j=1,npasos    ! recorro los diferentes puntos x donde evaluare la funcion
        call derivs2(x2,y2,dydx2)
        call rk4(y2,dydx2,n,x2,h,yout2,derivs2)  ! subrutina RK4 que devuelve la funcion y(x+h) evaluada en el punto x+h
        x2=x0+j*h    ! redefino el valor de entrada para la "x" en el siguiente paso
        do i=1,n       ! redefino los valores de "y" para volver a usar...
          y2(i)=yout2(i) ! ...las subrutinas "derivs" y "rk4"
        end do
        write(20,*) x2,(y2(k),k=1,n) ! escribo resultados a medida que se calculan
      end do
      
      close(20)
      
      
      
      write(*,*) 'programa finalizado'
      
      stop
      end
      
      
**********************************************************************
      subroutine derivs(x,y,dy)   ! sistema de ecs. difs. original 
************************************************************************
      implicit real*8 (a-h,o-z)
      dimension y(nn),dy(nn)
      common/const/ w02 , b , e , f   ! common para pasar los valores de las constantes
      common/ene/nn ! common para pasar el orden de la ecuacion diferencial
      w = 1.0d0
      dy(1)=y(2)
      dy(2)= f * cos(w*x) - e * y(1)**3 - w02 * y(1) - b * y(2)
      return
      end
      
**********************************************************************
      subroutine derivs2(x2,y2,dy2)   ! sistema de ecs. difs. modificacion DNI
************************************************************************
      implicit real*8 (a-h,o-z)
      dimension y2(nn),dy2(nn)
      common/const/ w02 , b , e , f   ! common para pasar los valores de las constantes
      common/ene/nn   ! common para pasar el orden de la ecuacion diferencial
      w2 = 1.009d0 
      dy2(1)=y2(2)
      dy2(2)= f * cos(w2*x2) - e * y2(1)**3 - w02 * y2(1) - b * y2(2)
      return
      end

            
    
