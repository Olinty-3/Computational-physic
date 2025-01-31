* Simpson-r8-iam.f

************************************************************************

* Subrutina para calcular integrales con el metodo Simpson con doble precision 

* Isabel Alfonso Marchante   08-02

************************************************************************

      subroutine Simpson-r8( f , N , a , b , sum ) 
      
      implicit real*8 (a-h,o-z) 
      external f 
      real*8 f 
      
      h = (b-a)/N
      
      sumi = 0.0d0 
       do i = 1 , N-1 , 2 !sumamos solo los numeros impares 
         x = a + i * h 
         sumi = sumi + f(x)
       end do 
       
       sump = 0.0d0 
       do i = 2 , N-2 , 2 !sumamos los terminos pares  sin contar los extremos 
         x = a + i * h 
         sump = sump + f(x) 
       end do 
       
       sum = (4.0d0 * sumi + 2.0d0 * sump + f(a) + f(b) ) * h/3.0d0
       
       return
       end 
      
