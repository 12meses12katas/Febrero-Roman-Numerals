Esta kata está corrompida por Leo y su post en agile-spain :-)
  http://groups.google.com/group/agile-spain/msg/4c5130d832297895

Es una versión muy parecida, pero en Scala en lugar de Ruby.

Usa un hashmap de correspondencia entre números romanos "base" que se
usan para dividir el número decimal (y, su inverso, para sumar).

También extiende la clase de números enteros con nueva funcionalidad, en este caso usando implicits (el mecanismo de scala). Para la conversión romano->decimal se extiende String.

La mayor diferencia es que no se utilizan efectos laterales (por ejemplo, asignar a un atributo de la instancia, como hace Leo con «roman»).

Para evitar una solución recursiva sin efectos laterales, se usan acumuladores.