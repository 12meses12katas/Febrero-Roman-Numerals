# language: es
Característica: Convertir entre entero decimal y romano
	Para poder poner el año de grabación de las series
	Como ilustrador de los créditos de cierre en la BBC
	Quiero saber cómo se escribe cada número en romano
	
	Esquema del escenario: convertir un entero a romano
		Dado que el número decimal es <valor decimal>
		Cuando convierto a romano
		Entonces el resultado romano es <valor romano> 

		Ejemplos:
			| valor decimal | valor romano |
			| 1             | I            |
			| 2             | II           |
			| 3             | III          |
			| 4             | IV           |
			| 5             | V            |
			| 6             | VI           |
			| 7             | VII          |
			| 8             | VIII         |
			| 9             | IX           |
			| 10            | X            |
			| 1978          | MCMLXXVIII   |
		    | 1999          | MCMXCIX      |
		 	| 3999          | MMMCMXCIX    |
		
	Esquema del escenario: convertir de romano a entero
		Dado que el número romano es <valor romano>
		Cuando convierto a entero
		Entonces el resultado entero es <valor decimal>
		
		Ejemplos:
			| valor decimal | valor romano |
			| 1             | I            |
			| 2             | II           |
			| 3             | III          |
			| 4             | IV           |
			| 5             | V            |
			| 6             | VI           |
			| 7             | VII          |
			| 8             | VIII         |
			| 9             | IX           |
			| 10            | X            |
			| 1978          | MCMLXXVIII   |
		    | 1999          | MCMXCIX      |
		 	| 3999          | MMMCMXCIX    |
		
	