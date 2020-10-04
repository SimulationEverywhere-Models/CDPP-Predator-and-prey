[top]
components : devlab

[devlab]
type : cell
dim : (20,20)
delay : inertial
defaultDelayTime : 200
border : nowrapped
neighbors : devlab(-1,-1)    devlab(-1,0)   devlab(-1,1)
neighbors : devlab(0,-1)     devlab(0,0)     devlab(0,1)
neighbors : devlab(1,-1)     devlab(1,0)     devlab(1,1)


initialValue : 0
initialCellsValue : devlab1.val
localtransition : reglas

[reglas]

%({[\-]*[0-9]},{[\-]*[0-9]}) expresion regular para invertir la convencion de (x,y) a (y,x).
% en replace va (\2,\1)


%Reglas de comportamiento
%reglas de choque. Desde la perspectiva del malo
%rule : 311



%Malo. Predador
%     1
% 2 (0,0) 3
%     4
%
%
%reglas de seguir olor de presa
%malo hacia arriba
rule : 0   800 { (-1,0) >100 and (-1,0) <250 and ((0,0)=311 or (0,0)=301) }
rule : 311 800 { (0,0) >100 and (0,0) <250 and ((1,0)=311 or (1,0)=301) }
%malo derecha
rule : 0   800 { (0,1) >100 and (0,1) <250 and ((0,0)=313 or (0,0)=303) }
rule : 313 800 { (0,0) >100 and (0,0) <250 and ((0,-1)=311 or (0,-1)=301) }
%malo abajo
rule : 0   800 { (1,0) >100 and (1,0) <250 and ((0,0)=314 or (0,0)=304) }
rule : 311 800 { (0,0) >100 and (0,0) <250 and ((-1,0)=314 or (-1,0)=304) }
%malo izquierda
rule : 0   800 { (0,-1) >100 and (0,-1) <250 and ((0,0)=312 or (0,0)=302) }
rule : 311 800 { (0,0) >100 and (0,0) <250 and ((0,1)=312 or (0,1)=302) }

%girar
rule : 311 300 { (0,0) >300 and (0,0) <350 and (0,0)!=311 and (-1,0) >=100 and (-1,0)<250}
rule : 313 300 { (0,0) >300 and (0,0) <350 and (0,0)!=313 and (0,1) >=100 and (0,1)<250}
rule : 314 300 { (0,0) >300 and (0,0) <350 and (0,0)!=314 and (1,0) >=100 and (1,0)<250}
rule : 312 300 { (0,0) >300 and (0,0) <350 and (0,0)!=312 and (0,-1) >=100 and (0,-1)<250}


%siguiendo pared
%yendo arriba (1)
% solo gira cuando choca contra el laberinto o cuando la derecha esta vacia
rule :   0 800 { (0,0) = 301 and (0,1)>=400 and (-1,0) <400 }
rule : 301 800 { (1,0) = 301 and (0,0)<400 and (1,1) >=400}
%girar
rule : 313 300  { (0,0) = 301 and (0,1)<400 }
rule : 302 300  { (0,0) = 301 and (-1,0)>=400 and (0,1)>=400}
rule : 304 300  { (0,0) = 301 and (-1,0)>=400 and (0,1)>=400 and (0,-1)>=400}


%yendo derecha (3)
rule :   0 800  { (0,0) = 303 and (1,0)>=400 and (0,1) < 400 }
rule : 303 800  { (0,-1) = 303 and (0,0)<400 and (1,-1) >= 400 }
%girar
rule : 314 300  { (0,0) = 303 and (1,0) < 400 }
rule : 301 300  { (0,0) = 303 and (0,1) >= 400 and (1,0) >= 400 }
rule : 302 300  { (0,0) = 303 and (0,1)>=400 and (1,0)>=400 and (-1,0)>=400}

%yendo abajo (4)
rule :   0 800 { (0,0) = 304 and (0,-1)>=400 and (1,0) <400 }
rule : 304 800 { (-1,0) = 304 and (0,0)<400 and (-1,-1) >=400}
%girar
rule : 312 300  { (0,0) = 304 and (0,-1)<400 }
rule : 303 300  { (0,0) = 304 and (1,0)>=400 and (0,-1)>=400}
rule : 301 300  { (0,0) = 304 and (1,0)>=400 and (0,-1)>=400 and (0,1)>=400}

%yendo izquierda (2)
rule :   0 800 { (0,0) = 302 and (-1,0)>=400 and (0,-1) <400 }
rule : 302 800 { (0,1) = 302 and (0,0)<400 and (-1,1) >=400}
%girar
rule : 311 300  { (0,0) = 302 and (-1,0)<400 }
rule : 304 300  { (0,0) = 302 and (0,-1)>=400 and (-1,0)>=400}
rule : 303 300  { (0,0) = 302 and (0,-1)>=400 and (-1,0)>=400 and (1,0)>=400}

%Buscando Pared
%no avanza sobre el olor de una presa, solo gira cuando choca contra el laberinto
%arriba
%espejada para seguir para arriba
rule :   0  800 { (0,0) = 311 and (-1,0) <400 }
rule : 311  800 { (1,0) = 311 and (0,0)<400 and (0,1)<400}
rule : 301  800 { (1,0) = 311 and (0,0)<400 and (0,1)>=400}
rule : 302 300  { (0,0) = 311 and (-1,0)>=400 }

%yendo derecha (3)
rule :   0  800 { (0,0) = 313 and (0,1) <400 }
rule : 313  800 { (0,-1) = 313 and (0,0)<400 and (1,0) <400}
rule : 303  800 { (0,-1) = 313 and (0,0)<400 and (1,0) >=400}
rule : 301 300  { (0,0) = 313 and (0,1)>=400 }

%yendo abajo (4)
rule :   0  800 { (0,0) = 314 and (1,0) <400 }
rule : 314  800 { (-1,0) = 314 and (0,0)<400 and (0,-1)<400}
rule : 304  800 { (-1,0) = 314 and (0,0)<400 and (0,-1)>=400}
rule : 303 300  { (0,0) = 314 and (1,0)>=400 }

%yendo izquierda (2)
rule :   0  800 { (0,0) = 312 and (0,-1) <400 }
rule : 312  800 { (0,1) = 312 and (0,0)<400 and (-1,0)<400}
rule : 302  800 { (0,1) = 312 and (0,0)<400 and (-1,0)>=400}
rule : 304 300  { (0,0) = 312 and (0,-1)>=400 }

%Reglas de presa
%     1
% 2 (0,0) 3
%     4
%Bueno
%siguiendo pared

%siguiendo pared
%yendo arriba (1)
% solo gira cuando choca contra el laberinto o cuando la derecha esta vacia
rule : 104 1000 { (0,0) = 201 and (0,1)>=103 and (-1,0) <103 }
rule : 201 1000 { (1,0) = 201 and (0,0)<103 and (1,1) >=103}
%girar
rule : 213 500  { (0,0) = 201 and (0,1)<103 }
rule : 202 500  { (0,0) = 201 and (-1,0)>=103 and (0,1)>=103}
rule : 204 500  { (0,0) = 201 and (-1,0)>=103 and (0,1)>=103 and (0,-1)>=103}


%yendo derecha (3)
rule :   104 1000  { (0,0) = 203 and (1,0)>=103 and (0,1) < 103 }
rule : 203 1000  { (0,-1) = 203 and (0,0)<103 and (1,-1) >= 103 }
%girar
rule : 214 500  { (0,0) = 203 and (1,0) < 103 }
rule : 201 500  { (0,0) = 203 and (0,1) >= 103 and (1,0) >= 103 }
rule : 202 500  { (0,0) = 203 and (0,1)>=103 and (1,0)>=103 and (-1,0)>=103}

%yendo abajo (4)
rule :   104 1000 { (0,0) = 204 and (0,-1)>=103 and (1,0) <103 }
rule : 204 1000 { (-1,0) = 204 and (0,0)<103 and (-1,-1) >=103}
%girar
rule : 212 500  { (0,0) = 204 and (0,-1)<103 }
rule : 203 500  { (0,0) = 204 and (1,0)>=103 and (0,-1)>=103}
rule : 201 500  { (0,0) = 204 and (1,0)>=103 and (0,-1)>=103 and (0,1)>=103}

%yendo izquierda (2)
rule :   104 1000 { (0,0) = 202 and (-1,0)>=103 and (0,-1) <103 }
rule : 202 1000 { (0,1) = 202 and (0,0)<103 and (-1,1) >=103}
%girar
rule : 211 500  { (0,0) = 202 and (-1,0)<103 }
rule : 204 500  { (0,0) = 202 and (0,-1)>=103 and (-1,0)>=103}
rule : 203 500  { (0,0) = 202 and (0,-1)>=103 and (-1,0)>=103 and (1,0)>=103}

%Buscando Pared
%no avanza sobre el olor de una presa, solo gira cuando choca contra el laberinto
%arriba
%espejada para seguir para arriba
rule :   104  1000 { (0,0) = 211 and (-1,0) <103 }
%Si
rule : 211  1000 { (1,0) = 211 and (0,0)<103 and (0,1)<103}
rule : 201  1000 { (1,0) = 211 and (0,0)<103 and (0,1)>=103}
rule : 202 500  { (0,0) = 211 and (-1,0)>=103 }

%yendo derecha (3)
rule : 104  1000 { (0,0) = 213 and (0,1) <103 }
rule : 213  1000 { (0,-1) = 213 and (0,0)<103 and (1,0) <103}
rule : 203  1000 { (0,-1) = 213 and (0,0)<103 and (1,0) >=103}
rule : 201 500  { (0,0) = 213 and (0,1)>=103 }

%yendo abajo (4)
rule : 104  1000 { (0,0) = 214 and (1,0) <103 }
rule : 214  1000 { (-1,0) = 214 and (0,0)<103 and (0,-1)<103}
rule : 204  1000 { (-1,0) = 214 and (0,0)<103 and (0,-1)>=103}
rule : 203 500  { (0,0) = 214 and (1,0)>=103 }

%yendo izquierda (2)
rule : 104  1000 { (0,0) = 212 and (0,-1) <103 }
rule : 212  1000 { (0,1) = 212 and (0,0)<103 and (-1,0)<103}
rule : 202  1000 { (0,1) = 212 and (0,0)<103 and (-1,0)>=103}
rule : 204 500  { (0,0) = 212 and (0,-1)>=103 }




%Reglas de entorno
%Regla del laberinto
rule : { (0,0) } 100000 { (0,0)=400}
%Reglas del olor
rule : { (0,0) - 1 } 1000 { (0,0)>101 and (0,0) <105}

rule : 0 1000 { (0,0)<=101 }

rule : {(0,0)} 100 {t}


