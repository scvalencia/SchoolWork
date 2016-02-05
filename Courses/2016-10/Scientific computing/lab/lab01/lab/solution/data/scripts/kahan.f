REAL FUNCTION EPSLON(X)
      REAL X 
      REAL a , b , c , eps
 
      a = 4.0/3.0
      DO WHILE ( .TRUE. )
         b = a - 1.0
         c = b + b + b
         eps = ABS(c-1.0)
         IF ( eps.NE.0.0 ) GOTO 1
      ENDDO
 1    EPSLON = eps*ABS(X)
      CONTINUE
      END