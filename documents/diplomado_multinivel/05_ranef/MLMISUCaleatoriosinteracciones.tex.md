---
subtitle: Modelos Multinivel
...

[plain,label=firstframe]

### Contenidos

Introducción
============

[allowframebreaks]<span>Outline</span>

### Clase anterior

-   Diferentes aproximaciones a estimación multinivel (ej, agregar
    datos, controlar por efectos fijos de grupos, etc.)

-   Modelo de coeficientes aleatorios

-   Correlación intra-clase ($\rho$)

-   Estimación y modelos

-   Modelo completo:
    $y_{ij}=\gamma_{00}+\gamma_{10}X_{ij}+\gamma_{01}Z_j+\gamma_{11}X_{ij}*Z_{j} +\mu_{0j}+\mu_{1j}X_{ij}+ r_{ij}$

-   Donde:

    1.  Variables:

        -   $y_{ij}$= variable dependiente (nivel 1)

        -   $X_{ij}$= variable independiente (nivel 1)

        -   $Z_j$= variable independiente (nivel 2)

    2.  Coeficientes fijos:

        -   $\gamma_{00}$= (gran) intercepto

        -   $\gamma_{10}$= pendiente (beta) nivel 1

        -   $\gamma_{01}$= pendiente (beta) nivel 2

        -   $\gamma_{11}$= pendiente (beta) interacción entre niveles

    3.  Efectos aleatorios:

        -   $\mu_{0j}$= asociado al intercepto

        -   $\mu_{1j}$= asociado a la pendiente

        -   $r_{ij}$= residuo individual

    4.  Componentes de la varianza:

        -   $\tau_{00}$= varianza del intercepto aleatorio

        -   $\tau_{11}$= varianza de la pendiente aleatoria (1)

        -   $\tau_{01}$= covarianza entre intercepto y pendiente

        -   $\sigma^2$= varianza del residuo individual

[allowframebreaks]<span>Outline</span>

### Esta clase

-   Coeficientes aleatorios: predicción, estimación, visualización,
    significación

-   Interacción entre niveles I (la segunda parte la veremos en la clase
    de centrado)

Lectura:

-   Aguinis et al 2013 Best practices in cross level interactions

Efectos y coeficientes aleatorios
=================================

### Contenidos

[allowframebreaks]<span>Outline</span>

### Modelo con coeficientes aleatorios

-   El modelo permite la estimación de coeficientes fijos y aleatorios

-   Fijos: los mismos para todos los casos

-   Aleatorios: distintos, pero iguales para cada grupo

-   En general, se utiliza el termino “efectos aleatorios” para el
    modelo nulo, y coeficientes aleatorios para modelos con pendiente
    aleatoria.

-   En este curso, vamos a utilizar “efecto” para referirnos a las
    desviaciones de cada grupo, y “coeficientes” para la estimación
    total del grupo (coeficiente=efecto fijo + efecto aleatorio)

![image](raneffects)\
<span>Fuente: Aguinis et al.2013</span>

-   A partir de la estimación del modelo, es posible predecir el valor
    de los efectos aleatorios ($\mu$) para cada unidad de nivel 2

-   Para el intercepto: $\mu_{01},\mu_{02},\mu_{03} ... \mu_{0N}$

-   Para la pendiente: $\mu_{11},\mu_{12},\mu_{13} ... \mu_{1N}$

[allowframebreaks]<span>Outline</span>

### Notas sobre estimación

-   2 tipos de parámetros: fijos y aleatorios (varianzas)

-   Para poder conocer (estimar) el valor de uno, se requiere el otro, y
    viceversa

-   Las varianzas asumen distribución normal

-   La estimación se efectúa mediante un proceso iterativo, con valores
    iniciales para los componentes de la varianza, y luego se van
    ajustando a los datos hasta llegar a la mejor solución

-   ¿Cuál es el valor de los componentes de la varianza que maximiza la
    verosimilitud de encontrar estos valores en la población
    (distribución normal)?

-   Los parámetros en multinivel en general se calculan con el método de
    máxima verosimilitud (ML)

-   Se recomienda la versión restringida (restricted maximum likelihood,
    REML) principalmente en el caso de las muestras pequeñas, produce
    estimadores menos sesgados para la parte aleatoria (ML es más
    sesgado hacia la estimación de los componentes de la varianza).

-   Sin embargo, para la comparación de ajuste de modelos (ej: test de
    devianza) se recomienda ML (tema próxima clase: ajuste)

-   El proceso de estimación incluye efectos fijos y varianzas

-   Los efectos aleatorios ($\mu$) son más bien variables latentes que
    parámetros estadísticos

-   El valor de los efectos aleatorios se puede (pos)estimar mediante el
    método de *empirical bayes*, que produce las medias posteriores para
    cada efecto por unidad de nivel dos (ej:escuela, país)

[allowframebreaks]<span>Outline</span>

### Empirical bayes 

-   Es una forma de estimar los coeficientes (o medias posteriores) para
    cada unidad de nivel 2 (interceptos y pendientes)

-   Bayesiano quiere decir que utiliza conocimiento previo (prior) para
    la estimación, que se relaciona con los parámetros del modelo desde
    el cual se derivan las medias posteriores

-   Para facilitar la explicación se ejemplifica para el caso del modelo
    nulo, donde permite estimar el intercepto (promedio) para cada grupo

-   Este intercepto por grupo equivale a un promedio ponderado donde se
    consideran los componentes de la varianza, el N de la unidad 2 y el
    gran intercepto $\gamma_{00}$

-   $\hat{\beta}^{EB}_{0j}=\gamma_j\hat{\beta}_{0j}+(1-\gamma_j)\hat{\gamma}_{00}$

-   Donde:

    -   $\hat{\beta}^{EB}_{0j}$: estimador empirical bayes del
        intercepto para el grupo $j$

    -   $\gamma_j$ es un ponderador que se define como la confiabilidad
        del promedio del grupo, y que equivale a

        $$\begin{aligned}
                    \gamma_j=\frac{\tau_{00}}{\tau_{00}+\sigma^2/n_j}
                    \end{aligned}$$

    -   $\hat{\beta}_{0j}$: es el promedio del grupo

    -   $\hat{\gamma}_{00}$: gran promedio (efecto fijo intercepto)

-   En esta estimación subyace la idea del “shrinkage” (reducción)

-   Los coeficientes de regresión OLS de cada grupo son reducidos en la
    dirección del coeficiente promedio para todos los grupos

-   El grado de “reducción” depende del tamaño del grupo y de la
    distancia entre el promedio del grupo y el promedio general, es
    decir, de la confiabilidad del promedio del grupo

-   Grupos más pequeños y que distan más del promedio serán reducidos de
    mayor manera hacia el promedio del grupo

[fragile]

### Ej.Estimación de intercepto aleatorio (medias posteriores)

    results_3 = lmer(mathach ~ 1 + ses + female + meanses + sector + (1 | id))
    > coef(results_3) # coef: comando que muestra coeficientes por grupo
    $id
      (Intercept)      ses    female  meanses   sector
    1477   11.561349 1.967711 -1.447036 1.503991 2.881483
    1637   10.929336 1.967711 -1.447036 1.503991 2.881483
    1906   12.067264 1.967711 -1.447036 1.503991 2.881483
    2030   11.676105 1.967711 -1.447036 1.503991 2.881483
    2305   11.916705 1.967711 -1.447036 1.503991 2.881483
    2655   14.899506 1.967711 -1.447036 1.503991 2.881483
    2658   10.384268 1.967711 -1.447036 1.503991 2.881483
    2771   13.423571 1.967711 -1.447036 1.503991 2.881483
    .
    .
    .
        

[fragile]

### Ej.estimación de medias posteriores - random slope

    results_4 = lmer(mathach ~ 1 + ses + female + meanses + sector +
    (1 + ses | id))
    > coef(results_4)

    $id
    (Intercept)       ses    female  meanses   sector
    1477   10.444968 1.5421090 -1.388827 1.375666 4.031932
    1637   10.845465 1.9062838 -1.388827 1.375666 4.031932
    1906   11.085050 1.8553321 -1.388827 1.375666 4.031932
    2030   11.486293 1.9561954 -1.388827 1.375666 4.031932
    2305    9.887710 1.0700892 -1.388827 1.375666 4.031932
    2655   16.034357 3.8329943 -1.388827 1.375666 4.031932
    2658    9.523345 1.2708804 -1.388827 1.375666 4.031932
    2771   13.763289 2.9942490 -1.388827 1.375666 4.031932
    .
    .
    .
            

[allowframebreaks]<span>Outline</span>

### Plots

![image](sjp_plot)

![image](xy_plot)

![image](ranef)

### Resumen predicción efectos aleatorios

Usos

-   Pedagógico: para entender el sentido de la estimación con modelos
    mixtos (efectos fijos y aleatorios)

-   Diagnóstico: para analizar y visualizar la variación de unidades de
    nivel dos a nivel de intercepto y pendiente(s)

-   Informativo: para conocer los resultados de las unidades de nivel 2
    y sus variaciones

-   Contraste de hipótesis de investigación

Interacción entre niveles
=========================

### Contenidos

[allowframebreaks]<span>Outline</span>

### Características interacciones entre niveles

Tipos de estimaciones (efectos) en multinivel

-   Nivel 1, individual (Y en X)

-   Directo entre niveles: Y en Z

-   Interacción entre niveles: Y en X\*Z: ¿Existen cambios en la
    relación entre Y y X en función de una variable Z?

-   Interpretación: por cada unidad de aumento en Z, la relación entre Y
    y X se modifica en $\gamma_{11}$

Por lo tanto, el objetivo es dar cuenta de la variabilidad de la
pendiente ($\tau_{11}$) en función de Z

Ejemplo:

-   (Y,X) Efecto de nivel socioeconómico en intención de voto

-   (Y,Z) Efecto de la calidad de la democracia en intención de voto

-   (Y, X\*Z) Cambios en el efecto de nivel socioeconómico en voto según
    la calidad de la democracia de los países

![image](ranslope)

-   La estimación de interacción entre niveles asume la existencia de
    varianza en la pendiente respectiva

-   Es decir, se requiere comprobar si esta varianza es distinta de 0

-   Diferentes métodos:

    -   Comparación de ajuste de modelos (ej: deviance) - próx.clase

    -   Bootstrap no paramétrico, dado que es difícil mantener el
        supuesto de distribución normal de las varianzas

    -   Considerar temas de potencia: con bajo N nivel 2 es posible que
        no se detecte la diferencia (de 0) para $\tau_{11}$

    -   Recomendación: proceder de todas maneras si hay una hipótesis
        sustantiva que base la interacción

[allowframebreaks]<span>Outline</span>

### Ejemplo Aguinis et al(2013)

-   Basado en paper de Chen et al 2007

-   Dependiente (Y): empoderamiento individual

-   Independiente (X): calidad de la relación lider-miembro (LMX -
    leader member exchange)

-   Independiente (Z): clima de liderazgo

-   Hipotesis:

    -   La calidad de la relación líder-miembro (X) aumenta el
        empoderamiento individual (Y)

    -   El clima de liderazgo (Z)aumenta el empoderamiento individual
        (Y)

    -   La relación ente empoderamiento (Y) y LMX (X) será más fuerte en
        equipos con mejor clima de liderazgo (Z)

![image](aguinis_mlm)

Interpretación:

-   $\gamma_{11}$ representa el cambio en la pendiente de empowerment en
    LMX a través de los grupos cuando el clima de liderazgo se
    incrementa en 1 punto.

-   Positivo: LMX (X) se encuentra relacionado más fuertemente a
    empowerment (Y) en grupos con clima más positivo en comparación a
    grupos con clima menos positivo.

-   “the slope of individual empowerment on LMX is expected to equal
    $\gamma_{10} = 0.269$ for teams with an average leadership climate.”
    (Ojo: porque el clima está centrado al promedio en el ejemplo, si no
    sería 0)

-   “However, the relationship between individual LMX and individual
    empowerment becomes stronger, by $\gamma_{11} = 0.104$ units, as a
    team’s leadership climate increases by one unit”.

(Aguinis et al 2013, p. 1504)

![image](aguinis_int)

### A tener en cuenta ( ... best practices)

-   Análisis de potencia (principalmente cuando hay posibilidades de
    diseñar el estudio)

-   Significación del efecto aleatorio: comparación de ajuste con
    modelos previos (próxima clase)

### Práctica

-   Efectos aleatorios e interacciones

-   En casa: replicar Aguinis, datos disponibles en webcurso (JOM.csv);
    sintaxis en paper

 {#section .unnumbered}

### Resumen

-   Coeficientes aleatorios: estimación de medias posteriores tanto para
    intercepto como para pendientes

-   Interacción entre niveles: estimación, interpretación y
    visualización
