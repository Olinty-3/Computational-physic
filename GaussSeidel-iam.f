* GaussSeidel-iam.f

************************************************************************

* Subrutina para resolver sistemas de ecuaciones mediante el método de Gauss Seiden

*  Isabel Alfonso Marchante

************************************************************************

* CUIDADO:  es importante el orden en que se escriben las ecuaciones; para asegurarse  de que funcione el programa, hay que reordenar las ecuaciones originales
* de manera que la matriz de coeficientes sea diagonalmente dominante 

       subroutine GaussSeidel(n, a , b , xo , k , tol , x)
       
       dimension a(n,n) , b(n) , xo(n) , x(n) !MUY IMPORTANTE definir tanto aqui como en el programa las dimensiones de los objetos
       
       
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
