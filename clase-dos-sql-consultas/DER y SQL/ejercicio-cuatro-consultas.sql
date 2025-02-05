/*1. Consulta*/
SELECT dni 
FROM Cliente;

/*2. Consulta*/
SELECT velocidad 
FROM Plan
WHERE precio <= 50;

/*3. Consulta*/
SELECT fecha_suscripcion 
FROM suscripcion
WHERE Cliente_dni <= "01234567J";

/*4. Consulta*/
SELECT dni 
FROM Cliente
ORDER BY nombre;

/*5. Consulta*/
SELECT COUNT(*) as "Total Córdoba"
FROM Cliente
WHERE Ciudad = "Córdoba";

/*6. Consulta*/
SELECT dni 
FROM Cliente
ORDER BY nombre
LIMIT 2;

/*7. Consulta*/
SELECT Cliente_dni, Plan_idPlan 
FROM Suscripcion
WHERE year(fecha_suscripcion) > 2020;

/*8. Consulta*/
SELECT avg(precio) as "Precio promedio"
FROM Plan;

/*9. Consulta*/
SELECT avg(duracion) as "Duración promedio"
FROM Suscripcion;

/*10. Consulta*/
SELECT COUNT(*) as "Total de Suscripciones"
FROM Suscripcion;