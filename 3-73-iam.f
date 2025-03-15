* 3-73-iam.f 

************************************************************************

* calculo del potencial creado por una elipse de carga superficial uniforme

* Isabel Alfonso Marchante

************************************************************************

      include 'gabq.f' ! subrutina de integracion por Gauss-Legendre (+biparticion)
      implicit real*8 (a-h,o-z)
      external f , g , p
      real*8 f , g , p
      common/datos/a,b,sigma,tol

      tol=1.0d-4   ! tolerancia para calcular la integral 
      
* Trabajo con unidades atomicas 

      a = 2.0 
      b = 1.0
      sigma = 5.0 
      

* Limite de las integrales en x

      xmax = 10
      xmin = a 
      nx = 100 !numero de iteraciones

      
      hx=(xmax-xmin)/nx  ! paso con el que recoro la  integral
      
* Apartado a) abro un fichero para guardar los datos calculados 

      open(10,file='3-73-a-iam.dat') 
      
      write(10,*) ' # x V'
      
      do i=0,nx   
        xinf = xmin + i*hx       ! limite inferior 
        call gabq(f,xinf,xsup,sum,tol,ier) 
        write(10,*) xinf , sum 
      end do
      
      close (10)
      
* Apartado b) he comprobado que incluso en x = 10 la diferencia es un poco mayor que el 1% por lo que voy a aumentar el limite superior hasta encontrar el punto.
  
* Abro un fichero para guardar los datos calculados 

      open(20,file='3-73-b1-iam.dat')
      open(30,file='3-73-b2-iam.dat')
      
      write(20,*) '#x     V'
      write(30,*) '#x     V'

* Voy a calcular a la vez los dos potenciales para poder compararlos dentro del bucle 

      tol2 = 1.0e-2
      xmax2 = 100 
      nx2 = 1000
      hx2 = (xmax2 - xmin)/nx2 

       do i=0,nx2   
        xinf = xmin + i*hx2       ! limite inferior 
        call gabq(f,xinf,xsup,sum,tol,ier) 
        call gabq(g,xinf,xsup,sum2,tol,ier) 
* comparo los resultados 
        dif = abs(sum-sum2)
        if (dif.le.tol2) then
          write(*,*) i , xinf , dif
          write(20,*) xinf , sum 
          write(30,*) xinf , sum2
          stop
        end if 
* escribo datos
        write(20,*) xinf , sum 
        write(30,*) xinf , sum2
      end do
      
      close (20)
      close (30)
    
      write(*,*)
      write(*,*) 'programa finalizado'
      
      stop
      end
      
**************************************************************
      real*8 function f(x)   ! funcion a integrar (elipse)
**************************************************************
      implicit real*8 (a-h,o-z)
      common/datos/a,b,sigma
      f= sigma / ( (x+a)**2.0 + b**2.0 )
      return
      end
      
************************************************************************
      real*8 function g(x) ! funcion a integrar (carga puntual)
************************************************************************
      implicit real*8 (a-h, o-z)
      common/datos/a,b,sigma
      g = sigma/x**2.0
      return
      end
