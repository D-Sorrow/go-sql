
/*Seleccionar el nombre, el puesto y la localidad de los departamentos donde trabajan los vendedores.*/

SELECT nombre, puesto, localidad
FROM EMPLEADO emp
JOIN DEPARTAMENTO der
ON emp.depto_nro = der.depto_nro;

/*Visualizar los departamentos con más de cinco empleados.*/

SELECT der.nombre_depto
FROM DEPARTAMENTO der
JOIN EMPLEADO emp
ON der.depto_nro = emp.depto_nro
group by der.depto_nro
HAVING COUNT(der.depto_nro) > 5
;

/*Mostrar el nombre, salario y nombre del departamento de los empleados que tengan el mismo puesto que ‘Mito Barchuk’.*/
SELECT emp.nombre, emp.salario, dep.nombre_depto
FROM EMPLEADO emp
JOIN DEPARTAMENTO  dep
ON emp.depto_nro = dep.depto_nro
WHERE emp.puesto = (
	SELECT e.puesto
    FROM EMPLEADO e
    WHERE nombre = "Mito" and apellido = "Barchuk"
);

/*Mostrar los datos de los empleados que trabajan en el departamento de contabilidad, ordenados por nombre.’.*/
SELECT emp.cod_emp, emp.nombre, emp.apellido, emp.puesto, emp.fecha_alta, emp.salario, emp.comision
FROM EMPLEADO emp
JOIN DEPARTAMENTO dep
ON dep.depto_nro = emp.depto_nro
WHERE dep.nombre_depto = "Contabilidad"
ORDER BY emp.nombre;

/*Mostrar el nombre del empleado que tiene el salario más bajo.*/

SELECT emp.nombre
FROM EMPLEADO emp
WHERE emp.salario = (
	SELECT MIN(emp.salario)
	FROM EMPLEADO emp
);

/*Mostrar los datos del empleado que tiene el salario más alto en el departamento de ‘Ventas’.*/

SELECT *
FROM DEPARTAMENTO dep
INNER JOIN EMPLEADO emp
ON dep.depto_nro = emp.depto_nro
WHERE dep.nombre_depto = "Ventas"
ORDER BY emp.salario DESC
LIMIT 1


