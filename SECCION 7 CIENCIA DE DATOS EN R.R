#70 VALORES PERDIDOS---------------------------------------------------------------------

niveles = read.csv("C:/Users/URIEL/Documents/DATOS (CSV,XML,JSON,ETC)/SQL PARA DATA SCIENCE/Nivelesdecontaminacion.csv", 
                   na.strings = "")
######na.strings = "" para que los valores en blanco los interprete como NA. 

#para quitar una fila 
 niveles = niveles[-(33),]
#revisamos los tipos de variable 
 str(niveles)
 #verificar que patrones siguen nuestros datos 
 library(mice)
 

#para ver cuales columnas tienen valores perdidos. 
 md.pattern(niveles)
 #los 0 indican los valores perdidos, por ejemplo hay 4 valores perdidos en 
 #la columna CN. 
 
 #para saber si una columna tiene NAs 
 is.na(niveles$NOX)
 sum(is.na(niveles$NOX))
 
#detectando las filas que  no contienen NAs 
 complete.cases(niveles)
 
 #para quitar las filas que contienen valores faltantes 
 niveles_sin_NAs = na.omit(niveles)
 niveles_sin_NAs_complete = niveles[complete.cases(niveles),]
 
 
#para quedarnos con las filas que si tienen informacion quitando los NA de una columna
 niveles_sin_NAs_NOX = niveles[!is.na(niveles$NOX),]
 
 #reemplazando ceros por NAs 
 niveles$Numero_de_empresas[niveles$Numero_de_empresas == 0]= NA
 
 #quitando los valores duplicados 
 sin_duplicados = unique(niveles)
 
 #deteccion de valores duplicados 
 duplicated(niveles)
 
 #calculando la media cuando se tienen valores NAs 
 mean(niveles$NOX, na.rm = TRUE)
 
 #calculando la desviacion estandar cuando se tienen valores NAs 
 sd(niveles$NOX, na.rm = TRUE)
 
 #71. TECNICAS DE REEMPLAZO DE VALORES PERDIDOS----------------------------------------
 #calcular los valores perdidos, el reemplazo es un tema muy delicado. 
 niveles2 = niveles
 
 #reemplazo con la media o la mediana. 
 #usaremos la columna PM2.5 
 niveles2$PM2.5_mean = ifelse(is.na(niveles$PM2.5), mean(niveles$PM2.5, 
                              na.rm = TRUE), niveles$PM2.5)
 #para reemplazarlo con la mediana, hacemos el mismo procedimiento. 
 niveles2$PM2.5_median = ifelse(is.na(niveles2$PM2.5), mean(niveles2$PM2.5, 
                                                         na.rm = TRUE), niveles2$PM2.5)
 
 #existe otro metodo de reemplazo de valores perdidos, llamado metodo de los k-vecinos. 
 # no solo toma  los valores existentes en una columna determinada, 
 #sino que toma en cuenta todos los valores que tienen. 
 
 #reemplazo de todos los NAs del archivo niveles con el metodo de los k-vecinos 
 install.packages("DMwR", dependencies = TRUE)
 library(DMwR)
 niveles3 = knninputation(niveles)
 
 #72. DETECCION DE OUTLIERS-----------------------[1]-------------------------------------------
 
 #un outlier es un valor que es muy diferente al resto de los datos, lo que puede afectar 
 #el analisis de los mismos, por lo que es recomendable quitarlos de la base de datos 
 #antes de seguir adelante con el analisis. 
 
 #creamos un nuevo archivo. 
 require("datasets")
 #escogemos la base de datos. 
data(rivers)

help(rivers) #141 rios de america del norte. 
str(rivers) #los tipos de datos son numericos. 

hist(rivers)
#de acuerdo a la informacion obtenida, la mayoria de los rios tienen una longitud pequeñs. 
#¿Cuales son los outliers o los que son muy diferentes a la mayoria? 
#usamos boxplot 
boxplot(rivers, horizontal = TRUE)
#la forma de obtener los valores de esos puntos es: 
boxplot.stats(rivers)
#ahora obtendremos la lista de valores que no son outliers. 
#aquellos cuya longitud es menor a 1240 millas. 
rios_sin_out = rivers[rivers < 1240]
boxplot(rios_sin_out, horizontal = TRUE)
#ahora aparecen nuevos outliers, esto se debe a que la mediana, los limites 
#de la caja y de los bigotes ya cambiaron, puesto que los calculos se hicieron 
#con un conjuntos distinto de valores. 
rios_sin_out2 = rivers[rivers < 1110]
boxplot(rios_sin_out2)
rios_sin_out3 = rivers[rivers < 1054]
boxplot(rios_sin_out3)
#ahora si esta base de datos ya esta libre de estos valores.

#73.MEDIDAS DE TENDENCIA CENTRAL------------------------------------------------------------
#media 
#mediana
#moda 
Corredores = read.csv("C:/Users/URIEL/Documents/DATOS (CSV,XML,JSON,ETC)/SQL PARA DATA SCIENCE/MaratonNY.csv")

#obtenemos el promedio 
mean(Corredores$age)
#obtenemos la mediana 
median(Corredores$age)
#obtener el valor que se repite con mas frecuencia
table(Corredores$age)
#con eso vemos que el 33 es el valor que mas se repite, 71 veces. 
frecuencias = data.frame(table(Corredores$age))

moda = frecuencias[which.max(frecuencias$Freq),1]
moda


#74.MEDIDAS DE DISPERSION------------------------------------------------------------------
#obtener 
#rango
#varianza
#desviacion tipica 
#esta medidas nos permiten ver que tan dispersos estan los datos, respecto a una medida de tendencia central 
#un valor muy pequeño indica que los valores estan muy proximos a la media 
# asi la media se podria considerar un valor representativa de los mismos. 
#un valor grande significa que la media no es confiable. 

var(Corredores$age)
#desviacion estandar 
sd(Corredores$age)

#75.DIAGRAMAS DE DISPERSION-----------------------[2]----------------------------------------------
#diagramas para dos o mas variables, estudia la relacion entre dos o mas variables. 
Latinos = read.csv("C:/Users/URIEL/Documents/DATOS (CSV,XML,JSON,ETC)/SQL PARA DATA SCIENCE/Latinos.csv")
#nos gustaria saber si a mayor edad de los corredores mayor tiempo 
#que les toma llegar a la meta o no. 

#con graficos basicos, usando plot. 
#[1]
plot(Latinos$Tiempo ~ Latinos$Edad, 
     xlab = "Edad", ylab = "Tiempo", 
     main = "Tiempo vs Edad")

#diagrama de dispersion con mas de dos variables. 

Estudiantes = read.csv("C:/Users/URIEL/Documents/DATOS (CSV,XML,JSON,ETC)/SQL PARA DATA SCIENCE/Estudiantes.csv")

#[2]
pairs(data = Estudiantes, 
      ~ Matematicas + Ciencias + Espanol + Historia + Deportes, #indico cuales columnas incluire en el grafico
      pch=19,  #forma de los puntos 
      main = "Calificaciones de Estudiantes ")
#esto lo que nos arroja es la relacion de todas las variables contra todas. 

#grafico mismo usando gglot2 
#[3]
library(ggplot2)
ggplot(data=Latinos) + 
        geom_point(aes(x=Edad, y=Tiempo)) + 
        labs(title = "Maraton NY 2002", x="Edades", y="Tiempos") +
        theme_classic() + 
        theme(plot.title = element_text(hjust = 0.5))

#el mismo grafico de dispersion para mas de dos variables en ggplot 
#[4]
install.packages("GGally")
library(GGally)
ggpairs(Estudiantes,
        columns = 1:5, 
        title = "Calificaciones de Estudiantes") +
        theme_bw() + 
        theme(plot.title = element_text(hjust = 0.5)) #esta linea para centrar el titulo. 

#76. GRAFICOS DE BARRAS-------------------------[3]----------------------------------------
#[1]
barplot(Estudiantes$Matematicas, main = "Calificaciones de Matematicas", 
        names.arg = row.names(Estudiantes), 
        ylim = c(0,10), 
        col="yellow")


#graficando cuantos corredores hay de cada pais. 
#¿Cuantos corredores de cada unos de los paises participaron en el maraton? 
install.packages("dplyr", dependencies = TRUE)
library(dplyr)
por_pais = group_by(Latinos, Pais) 
#le indicamos que queremos agrupar los datos de acuerdo al pais de cada uno de ellos. 
por_pais

#hacemos el conteo de los corredores de cada uno de los grupos.
count_por_pais = summarise(por_pais, total_por_pais = length(Pais))
#le indicamos el objeto que tiene los grupos a contar, el conteo lo llevara acabo usando la funcion length.
count_por_pais
write.csv(count_por_pais, "Corredores Latinos por Pais.csv")

#[2]
barplot(count_por_pais$total_por_pais, names.arg = count_por_pais$Pais, 
        main = "Corredores por pais", 
        ylim = c(0,15), col = rainbow(12))

#77. GRAFICOS CIRCULARES----------------------[4]---------------------------
#grafica de pasteles, circulo dividido en sectores.
Corredores_Pais = read.csv("C:/Users/URIEL/Documents/DATOS (CSV,XML,JSON,ETC)/SQL PARA DATA SCIENCE/Corredores Latinos por Pais.csv")
Corredores_Pais$X = NULL

#formamos las etiquetas que a cololcar el en grafico circular. 
etiquetas = paste(Corredores_Pais$Pais, Corredores_Pais$total_por_Pais) 
etiquetas

#con graficos basicos de R. 

#[1]
pie(Corredores_Pais$total_por_Pais, col = rainbow(12), 
    labels = etiquetas, 
    main = "Corredores Latinos por Pais")

#para hacerlo con ggplot 
#[2]
Pias = Corredores_Pais$Pais
library(ggplot2)
ggplot(Corredores_Pais, aes(x="", y=Corredores_Pais$total_por_Pais, fill=Pais)) + 
        geom_bar(stat = "identity", color = "black") + 
        coord_polar("y", start=0) +
        geom_text(aes(label = Corredores_Pais$total_por_Pais),position = position_stack(vjust = 0.5), 
                  color = "blue") + 
        labs(title="Corredores por pais") + 
        theme_void()
#dentro de ggplot : 
#1. objeto que queremos graficar. 
#2. aes, para indicar las variables que contienen las cantidades en base a las cuales hara las divisiones. 
#3. fill=pais, le decimos que el color de las secciones estará determinado por los paises 
#contenidos en el objeto pais que se acaba de crear. 
#5. con geom_bar creamos el graficos. 
#6. stat="identity, indicamos que ya no necesitamos que realize ningun conteo 
#pues ya se lo estamos proporcionando con el parametro y de arriba. 
#7. coord_polar, cree un grafico circular y no de barras. 
#8. geom_text, agregamos etiquetas al grafico. 

#78.HISTOGRAMAS-----------------------------------------------[5]------------------------
#utiles cuando queremos saber la distribucion que tienen los valores de una 
#variable continua, es decir si hay intervalos que se presenten mas frecuentes que otros. 

hist(Latinos$Tiempo)
#[1]
#cambiando la cantidad de diviones del histograma. 
hist(Latinos$Tiempo, breaks=10, col = rainbow(12), 
     xlab="Tiempos", ylab="Frecuencias", main="Histograma de los tiempos")

#[2]
#histograma con ggplot2. 
ggplot(Latinos, aes(x = Tiempo)) + 
        geom_histogram(bins=10, fill=rainbow(10), col="black") +
        labs(title = "Tiempo Registrado", x="Tiempo", y="Frecuencias") +
        theme_classic() + 
        theme(plot.title = element_text(hjust=0.5))

#79.DIAGRAMA DE PARETO----------------------------------[6]----------------------------
ventas = read.csv("C:/Users/URIEL/Documents/DATOS (CSV,XML,JSON,ETC)/SQL PARA DATA SCIENCE/Datos Compras.csv", stringsAsFactors = T)
productos_vendidos = table(ventas$Producto)

productos_vendidos

install.packages("qcc")
library(qcc)
#[1]
#creamos el diagrama de pareto. 
pareto.chart(productos_vendidos, col=rainbow(length(productos_vendidos)),
             main = "Diagrama de Pareto")

#80.MATRICES DE CORRELACION-----------------------------------[7]---------------------------
mtcars = read.csv("C:/Users/URIEL/Documents/DATOS (CSV,XML,JSON,ETC)/SQL PARA DATA SCIENCE/mtcars.csv")
#necesitamos quitar la columna que no sea numerica. 
mtcars$Modelo = NULL
#ahora que todas son numericas, calculas la correlacion que hay entre ellas. 
mtcars_cor = cor(mtcars, method="pearson")
round_corr = round(mtcars_cor, digits=1) #redondeamos los valores de las correlaciones para solo tener un decimal. 

round_corr

#crearemos una matriz de correlacion, que nos permita analizar los numeros 
#de manera visual. 

#[1]
library(corrplot)
corrplot(round_corr)

#para hacerlo con graficos mas avanzados. 
#[2]
install.packages("ggcorrplot")
library(ggcorrplot)

ggcorrplot(round_corr, method= 'circle', type = 'lower', lab=TRUE) + 
        ggtitle("Matriz de Correlacion") + 
        theme_minimal()

#81.NUBES DE PALABRAS-----------------------------------------------------------------
#grafico usado en el analisis de texto, ya sea un libro, contenido en internet. 

install.packages("tm")
library(tm)

comentarios = read.csv("C:/Users/URIEL/Documents/DATOS (CSV,XML,JSON,ETC)/SQL PARA DATA SCIENCE/opiniones acerca de vinos.csv")
#contiene opinion acerca de vinos. 

palabras = VCorpus(VectorSource(comentarios$description))
View(palabras)

palabras = tm_map(palabras, content_transformer(tolower))
palabras = tm_map(palabras, removePunctuation)

palabras = tm_map(palabras, removeWords, stopwords("english"))

#cargamos el paquete RcolorBrewer
install.packages("RColorBrewer")
library(RColorBrewer)

colores = brewer.pal(8, "Dark2")

display.brewer.all(colorblindFriendly = TRUE)

#crear nube de palabras 
install.packages("wordcloud")
library(wordcloud)

wordcloud(palabras, scale=C(2.6,0.3), random.order = FALSE, 
          max.words = 75, rot.per = 0.25, colors=colores)

title(main = "wordcloud")

#82. IMPORTANDO INFORMACION DE SQL SERVER EN RSTUDIO--------------------------------------------------





