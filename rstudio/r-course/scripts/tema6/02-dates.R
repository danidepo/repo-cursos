#EPOCH: 1 de Enero del 1970

#HOY
Sys.Date()

#A�o dos digitos
as.Date("1/1/80", format = "%m/%d/%y")

#A�o cuatro digitos
as.Date("1/1/1980", format = "%m/%d/%Y")

#yyyy-mm-dd o yyyy/mm/dd
as.Date("2018-01-06")

nac <- as.Date("88/05/19")

##fecha -> numero
as.numeric(as.Date("1972/10/09"))
as.numeric(Sys.Date())

#Nombre de los meses
as.Date("Ene 6, 2018", format="%b %d, %Y")
as.Date("Enero 6, 18", format="%B %d, %y")

#Crear fechas desde dias de EPOCH
dt <- 2018
class(dt) <- "Date"
dt

dt <- -2018
class(dt) <- "Date"
dt

#Fechas desde dias de un punto dado
as.Date(2018, origin = as.Date("1988-05-19"))
as.Date(-2018, origin = as.Date("1988-05-19"))

#Componentes de las fechas
dt
#A�o en 4 d�gitos
format(dt, "%Y")
#A�o como numero en lugar de String
as.numeric(format(dt, "%Y"))
#A�o en 2 digitos
format(dt, "%y")
#A�o como numero en lugar de String
as.numeric(format(dt, "%y"))
#Mes como String
format(dt, "%b")
format(dt, "%B")
months(dt)
weekdays(dt)
quarters(dt)
julian(dt)

julian(dt, origin = as.Date("1980/06/25"))

##Operaciones con fechas
dt <- as.Date("1/1/2001", format = "%d/%m/%Y")
dt+100
dt-100
dt+31

dt2 <- as.Date("2001/01/02")
dt2 - dt
dt - dt2
dt - dt
as.numeric(dt-dt)
dt < dt2
dt2 < dt
dt==dt2

seq(dt, dt+365, "month")
seq(dt, dt+365, "days")

seq(dt, as.Date("2001/01/10"), "day")

seq(dt, dt+365, "2 months")

seq(from = dt, by = "4 months", length.out = 6)[3]
seq(from = dt, by = "3 weeks", length.out = 6)
