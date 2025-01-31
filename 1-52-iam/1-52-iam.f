* 1-52-iam.f

************************************************************************

* Encontrar la distancia de equilibrio para una molécula de NaCl

*   Isabel Alfonso Marchante 

************************************************************************

      include 'New-Rap-iam.f'
      
      external f , fp 
      
* Defino los parametros de la iteracion 
      
      x0 = 4.75 !valor inicial para empezar la interacion 
      tol = 1.0e-4 !tolerancia 
      kmax = 200 !numero de iteraciones maximas 
      
      call NewRap(f,fp,x0,tol,kmax,k,x)
      write(*,*) k,x
      write(*,*)
      write(*,*) 'programa finalizado'
       
      stop
      end
      
************************************************************************
       function f(x)    ! funcion cuyos ceros quiero calcular
************************************************************************

      
* Defino las cte. Voy a trabajar en unidades atomicas 

      real lmb

      lmb = 40.15 
      rho = 0.607
      z = 6.0
      alpha = 1.747565

      f = alpha / x**2 - z *lmb/rho * exp(-x/rho)
      
      return
      end
 
************************************************************************
      function fp(x)  ! Derivada de la funcion
************************************************************************

      
* Vuelvo a definir las cte.

      real lmb

      lmb = 40.15
      rho = 0.607
      z = 6.0
      alpha = 1.747565

      fp = z * lmb /rho**2 * exp(-x/rho) - 2 * alpha/x**3 
      
      return 
      end   

      
      
