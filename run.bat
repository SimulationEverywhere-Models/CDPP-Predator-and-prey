echo path=%path%;c:\cd++
simu -m%1.ma -t00:04:30:000 -lsalid.log

drawlog -m%1.ma -cdevlab -lsalid.log > Salida.drw
Graflog -v -e10 -fsalida.drw -ccolores.col


