* Simpson-iam.f

************************************************************************

* Subrutina calcular integrales con el metodo Simpson

* Isabel Alfonso Marchante - 08-02 

************************************************************************

      subroutine Simpson(f , N , a , b  , sum ) 
      
      external f 
      real f 
      
      h = (b-a)/N
      
      sumi = 0.0 
       do i = 1 , N-1 , 2 !sumamos solo los numeros impares 
         x = a + i * h 
         sumi = sumi + f(x)
       end do 
       
       sump = 0.0 
       do i = 2 , N-2 , 2 !sumamos los terminos pares  sin contar los extremos 
         x = a + i * h 
         sump = sump + f(x) 
       end do 
       
       sum = (4.0 * sumi + 2.0 * sump + f(a) + f(b) ) * h/3.0
       
       
       return
       end 
