base = read.csv("C:/Users/URIEL/Documents/DATOS (CSV,XML,JSON,ETC)/SQL PARA DATA SCIENCE/walmart_ecommerce.csv")

#1.Obtén el diagrama de Pareto de las marcas existentes en la tienda. Recuerda ampliar el panel en el que se despliegan los gráficos, 
#de lo contrario, R te arrojará un error.------------------------------------------------------------------------------------------------------------------

productos_vendidos = table(base$Marca)

productos_vendidos


library(qcc)
#creamos el diagrama de pareto. 
pareto.chart(productos_vendidos, col=rainbow(length(productos_vendidos)),
             main = "Diagrama de Pareto")

#2.Obtén el promedio, la mediana y 
#la moda de los precios de lista de los productos-------------------------------------------------------------------------------------

promedio = mean(base$Precio_de_lista)
mediana = median(base$Precio_de_lista)


tabla = table(base$Precio_de_lista)
frecuencias = data.frame(tabla)

moda = frecuencias[which.max(frecuencias$Freq),1]
moda

#3.Obtén el rango, la varianza y
#la desviación estándar de los precios de lista de los productos------------------------------------------------------------------

varianza = var(base$Precio_de_lista)
desviacion_estandar = sd(base$Precio_de_lista)
rango_valores = range(base$Precio_de_lista)
rango = rango_valores[2] - rango_valores[1]

#4.Crea un histograma de los precios de lista, que 
#contenga 10 divisiones, utilizando la librería ggplot2-------------------------------------------------------------------------------------
library(ggplot2)
ggplot(base, aes(x = Precio_de_lista)) + 
  geom_histogram(bins=10, fill=rainbow(10), col="black") +
  labs(title = "Precios registrados", x="Precio", y="Frecuencias") +
  theme_classic() + 
  theme(plot.title = element_text(hjust=0.5))

#5.Genera un gráfico de caja y bigotes de los precios de lista.
#En caso de que existan outliers, 
#crea una lista ordenada de los mismos

boxplot(base$Precio_de_lista, horizontal = TRUE)
boxplot.stats(base$Precio_de_lista)

Precio_sin_out = base$Precio_de_lista[base$Precio_de_lista<736.00]
boxplot(Precio_sin_out, horizontal = TRUE)
boxplot.stats(Precio_sin_out)

Precio_sin_out2 = base$Precio_de_lista[base$Precio_de_lista<116.39]
boxplot(Precio_sin_out2, horizontal = TRUE)
boxplot.stats(Precio_sin_out2)

Precio_sin_out3 = base$Precio_de_lista[base$Precio_de_lista<87]
boxplot(Precio_sin_out3, horizontal = TRUE)

#lista ordenada de los outliers. 
out3 = boxplot.stats(base$Precio_de_lista)[[4]]  
out1 =  boxplot.stats(Precio_sin_out)[[4]]
out2 = boxplot.stats(Precio_sin_out2)[[4]]
out_completos = c(out1,out2,out3)
#ordenados 
out_completos = sort(out_completos)
length(out_completos)
