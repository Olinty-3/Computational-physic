* New-Rap-iam.f

***************************************************

* Metodo de Newton Rapshon- Subrutina  

*  Isabel Alfonso Marchante   25-01

****************************************************

       subroutine NewRap(f , fp , x0 , tol , kmax , k , x) 
       
       external f,fp ! fp , funcion prima , funcion derivada
       real f , fp

       
       do k=1,kmax
         x = x0 - f(x0)/fp(x0)
         dif = abs(2.0 * (x-x0)/(x+x0))   ! criterio de error relativo
         if (dif .lt. tol) goto 100
         x0=x
      end do
      
      write(*,*)
      write(*,*) 'num. iter.=',kmax,'   x=',x
      write(*,*) 'no se alcanzo la precision deseada'
      stop

100   write(*,*) 'num. iter.=',k,'      x=',x
      write(*,*) 'se alcanzo la precision deseada'
      
      
      return
      end
