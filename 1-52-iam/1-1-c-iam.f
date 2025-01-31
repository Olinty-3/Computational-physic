* 1-1-c-iam.f

************************************************************************

* Calculo de los ceros de la función f(x) = cos x - x 

* c) Mediante el método de Newton Raphson (subrutina)



*  Isabel Alfonso Marchante

************************************************************************

      include 'New-Rap-iam.f'
      
      external f , fp 
      
      k = 1000
      tol = 1.0e-4
      xo = 0.5
      
      call NewRap(f , fp , xo , tol , k , i , x)
      
      write(*,*)  'i =' , i , 'x =' , x 
      
      stop 
      end 
      
************************************************************************

      function f(x) 
      
      f = cos(x) - x 
      
      return 
      end 

************************************************************************

************************************************************************

      function fp(x) 
      
      fp = - sin(x) - 1
      
      return 
      end 
      
************************************************************************


