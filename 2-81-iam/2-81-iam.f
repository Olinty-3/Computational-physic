* 2-81-iam.f

************************************************************************

* Calculo de los voltajes en un circuito por medio de la reglas de krichoff 

*     Isabel Alfonso Marchante  

************************************************************************

      include 'ludcmp.f'
      include 'lubksb.f'
      parameter (n=10,np=10)   
      dimension a(np,np),indx(np),b(np)

* Transcribo los datos (trabajo en unidades del SI )  

      
      V = 5.0 
      
      a = 0.0
      b = 0.0 
      
      
      i = 1  !Fila 1 
      a(i,1) = 1.0 
      a(i,2) = -1.0
      a(i,10) = -1.0
      
      i = 2 !Fila 2
      a(i,1) = -1.0 
      a(i,3) = 1.0 
      a(i,4) = 1.0
      a(i,5) = 1.0
      
      i = 3 !Fila 3
      a(i,4) = -1.0 
      a(i,7) = -1.0 
      a(i,8) = 1.0
      
      i = 4 !Fila 4
      a(i,5) = -1.0 
      a(i,6) = 1.0 
      a(i,7) = 1.0 
      a(i,9) = -1.0
      
      i = 5 !Fila 5 
      a(i,8) = -1.0 
      a(i,9) = 1.0
      a(i,10) = 1.0
      
      i = 6 !Fila 6
      a(i,1) = 2.0 
      a(i,2) = 2.0
      a(i,3) = 1.0
      
      i= 7 !Fila 7 
      a(i,3) = -1.0
      a(i,5) = 2.0 
      a(i,6) = 1.0
      
      i = 8 !Fila 8 
      a(i,4) = -1.0 
      a(i,5) = 2.0 
      a(i,7) = 1.0 
      
      i = 9 !Fila 9
      a(i,7) = 1.0 
      a(i,8) = 2.0 
      a(i,9) = 2.0
      
      i = 10 !Fila 10 
      a(i,2) = 2.0 
      a(i,6) = 1.0
      a(i,9) = 2.0 
      b(i) = - V 
      
* ahora escribo los elementos de la matriz "a" y el vector "b"  para comprobar que he introducido bien los datos

      do i=1,n
       write(*,*) (a(i,j), j=1,n),'  || ', b(i)   
      end do
      write(*,*)     ! escribo una linea en blanco
      
      call ludcmp(a,n,np,indx,d) ! subrutina que descompone la matriz "a" en el producto de matrices "l*u"
      call lubksb(a,n,np,indx,b) ! subrutina que resuelve el sistema de ecuaciones

* escribo el vector columna con las soluciones a las incognitas

      do i=1,n
        write(*,*) i,b(i)
      end do
      
*Por ultimo caluculo el valor de los potenciales 
* Multiplico por 2 las intensidades de las resistencias Rx
      
      V1 = V - 2 * b(1) 
      V2 = V1 - b(3)
      V3 = V + 2 * b(2)
      V4 = V3 + b(6)
    
      
* Escribo la solucion 

      write(*,*)
      write(*,*) 'V =' , V1 , V2 , V3 , V4 , 'V'
      
      stop
      end
     
      
 
