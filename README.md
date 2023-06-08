
# TIPOS DE DATOS #
Este archivo fue creado para poder visualizar los tipos de datos que estamos utilizando en la base de datos, la base de datos esta montada en ORACLE, entonces disponemos de ciertos tipos de datos.

## TEXTO ##
En estos tipos, conviene indicar suficiente espacio para almacenar los valores. En el caso de los "VARCHAR2", no se malgasta espacio por poner más espacio del deseado ya que si el texto es más pequeño que el tamaño indicado, el resto del espacio se ocupa: aunque también es conveniente ajustar ya que evita que se pueden introducir más caracteres de los necesarios en la base de datos.

1.  ###### VARCHAR2  (Utilizado para textos de longitud variable) ######
    En este tipo, para cada valor Oracle almacena primero el tamaño del texto y luego almacena el texto. De esa forma un texto corto ocupa en disco menos que un texto largo. Cuando se indica "VARCHAR2" como tipo, se debe de indicar también un número entre paréntesis que indicará el tamaño máximo del texto.
    **ADVERTENCIA**
    En Oracle las palabras "VARCHAR" y "VARCHAR2" son equivalentes, pero se aconseja utilizar "VARCHAR2".
    Se admiten textos que ocupen hasta 4000 bytes como máximo.

2.  ###### "CHAR" (Para textos de longitud fija) ######
    En las columnas que usen este tipo de datos, los valores siempre ocuparán el mismo tamaño. Por ejemplo, si hemos indicado como tipo CHAR(20), todos los textos ocuparán 20 caracteres, sean del tamaño que sean.
    El tipo CHAR, como mucho puede indicar un tamaño de 2000 bytes.

## FECHAS ##
Las fechas y las horas en Oracle se almacenan internamente en un formato especial (realmente es un formato numérico). Sin embargo, las personas representamos las fechas indicando años, meses, día del mes, hora, minutos y segundos. Por lo tanto hay que tener en cuenta que el formato en el que se muestran las fechas por pantalla cuando consultamos datos, es una conversión para que las personas entendamos las fechas.
Oracle posee cuatro tipos de datos relacionados con fechas.

1.  ###### DATE ######
    El tipo DATE permite almacenar fechas sin tener en cuenta las horas, minutos y segundos, como Oracle posee la función SYSDATE para obtener la fecha actual. 
    **ADVERTENCIA**
    Las fechas no se pueden manipular directamente y se debe usar la función TO_DATE para pasar un texto que representa fechas a la fecha correspondiente.

2.  ###### TIMESTAMP ######
    Es una extensión del anterior, almacena valores de día, mes y año, junto con hora, minuto y segundos, incluso con decimales para los segundos, con lo que representa un instante concreto en el tiempo.
    **ADVERTENCIA**
    Si intentamos almacenar datos que contienen (además de la fecha) horas, minutos y segundos en una columna de tipo DATE, solo se almacenará el año, mes y día.

## NÚMEROS ##
En Oracle, el tipo "NUMBER" es un tipo muy versátil que permite representar todo tipo de números. Su rango permite almacenar números de entre 10-130 y 9,99999999999 * 10128. Si intentamos añadir un número fuera de este rango, Oracle produciría un error.

1.  ###### NUMBER(p,s) ######
    Donde p es la precisión máxima del número y s es la escala (número de decimales a la derecha de la coma). Por ejemplo, "NUMBER (8,3)" indica que se representan números de ocho cifras de precisión y tres decimales, los decimales en Oracle se presenta con el punto y no con la coma.
    Para números enteros Oracle también permite almacenar números enteros, en este caso se indica la palabra "NUMBER" seguida del número máximo de cifras que podrán almacenarse. Por ejemplo "NUMBER(8)" permitiría almacenar números sin decimales de hasta ocho cifras, entonces indicas "NUMBER(p)" donde p es el número de dígitos, eso es equivalente a "NUMBER(p,0)".
    Para números en coma flotante se indican simplemente con la palabra "NUMBER", sin indicar número alguno después. Como se ha indicado anteriormente, los números en coma flotante permiten almacenar números decimales que se operan muy rápido por parte de las computadoras, pero que no almacenan los números con exactitud absoluta.
