*Secante-iam.f

************************************************************************

* Subrutina - Método de la secante 

* Isabel Alfonso Marchante - 02-02

************************************************************************

      subroutine sec( f , x0 , x1 , tol , kmax , k , x )
    
      
      do k=2,kmax
        x=x1-f(x1)*(x1-x0)/(f(x1)-f(x0))
        write(*,*) k,x1  ! escribo en pantalla la evolucion de la solucion
        dif=abs(x-x1)    ! criterio de error absoluto
        if (dif.lt.tol) then
          write(*,*) 'se alcanzo la precision deseada'
          write(*,*) 'num. iter.=',k,'      x=',x 
          goto 100       
        end if   
        x0=x1
        x1=x
      end do
      
      
      write(*,*) 'no se alcanzo la precision deseada'
      write(*,*) 'num. iter.=',kmax,'   x=',x1
      
      stop
      
100   write(*,*) 

      stop 
      end 
      
