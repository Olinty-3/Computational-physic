* GaussSeidel-iam.f

************************************************************************

* Subrutina para resolver sistemas de ecuaciones mediante el método de Gauss Seiden

*  Isabel Alfonso Marchante

************************************************************************ 

       subroutine GaussSeidel(n, a , b , xo , k , tol , x)
       
       dimension a(n,n) , b(n) , xo(n) , x(n) 
       
       
* Iniciamos el método

    
      do i = 1 , k
        difmax = 0.0
        do j = 1 , n
          sum = 0.0  
          do l = 1 , j-1
            sum = sum + a(j,l)*xo(l) 
          end do 
          do l = j+1 , n
             sum = sum + a(j,l)*xo(l)
          end do 
          x(j)  = (b(j) - sum)/a(j,j)
          dif = abs(x(j)-xo(j))
          difmax = max(difmax,dif)
          xo(j) = x(j)
        end do 
        if(difmax.le.tol) go to 100
      end do 
      
100   write(*,*) ' Se alcanzo la convergencia deseada'

      return
      end 
