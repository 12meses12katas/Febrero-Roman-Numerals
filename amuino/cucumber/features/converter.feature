# language: es
Característica: Convertir a romano
	Para poder poner el año de grabación de las series
	Como ilustrador de los créditos de cierre en la BBC
	Quiero saber cómo se escribe cada número en romano
	
	Esquema del escenario: convertir un entero a romano
		Dado que el número decimal es <valor decimal>
		Cuando convierto a romano
		Entonces el resultado es <valor romano> 
		
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
		
		
	