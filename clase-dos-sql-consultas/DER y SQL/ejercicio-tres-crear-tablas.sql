CREATE TABLE IF NOT EXISTS `empresa_internet`.`Cliente` (
  `dni` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE);
  
  CREATE TABLE IF NOT EXISTS `empresa_internet`.`Plan` (
  `idPlan` INT NOT NULL,
  `velocidad` VARCHAR(10) NULL,
  `precio` DECIMAL(3) NULL,
  `descuento` DECIMAL(2) NULL,
  PRIMARY KEY (`idPlan`));
  
  CREATE TABLE IF NOT EXISTS `empresa_internet`.`Suscripcion` (
  `idSuscripción` INT NOT NULL,
  `Cliente_dni` VARCHAR(45) NOT NULL,
  `Plan_idPlan` INT NOT NULL,
  `fecha_suscripción` DATE NOT NULL,
  `duración` INT NOT NULL,
  PRIMARY KEY (`idSuscripción`),
  INDEX `fk_Suscripción_Cliente_idx` (`Cliente_dni` ASC) VISIBLE,
  INDEX `fk_Suscripción_Plan1_idx` (`Plan_idPlan` ASC) VISIBLE,
  CONSTRAINT `fk_Suscripción_Cliente`
    FOREIGN KEY (`Cliente_dni`)
    REFERENCES `empresa_internet`.`Cliente` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Suscripción_Plan1`
    FOREIGN KEY (`Plan_idPlan`)
    REFERENCES `empresa_internet`.`Plan` (`idPlan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
INSERT INTO empresa_internet.Cliente (dni, nombre, apellido, fecha_nacimiento, provincia, ciudad) VALUES
('12345678A', 'Juan', 'Pérez', '1985-02-15', 'Buenos Aires', 'Buenos Aires'),
('23456789B', 'Ana', 'García', '1990-06-25', 'Córdoba', 'Córdoba'),
('34567890C', 'Luis', 'Martínez', '1978-09-10', 'Santa Fe', 'Rosario'),
('45678901D', 'María', 'Rodríguez', '1982-11-30', 'Mendoza', 'Mendoza'),
('56789012E', 'Pedro', 'López', '1995-03-05', 'Tucumán', 'San Miguel de Tucumán'),
('67890123F', 'Laura', 'González', '1988-07-19', 'Salta', 'Salta'),
('78901234G', 'Carlos', 'Fernández', '1975-04-22', 'Entre Ríos', 'Paraná'),
('89012345H', 'Sofía', 'Jiménez', '1992-01-14', 'Neuquén', 'Neuquén'),
('90123456I', 'Javier', 'Ruiz', '1981-12-07', 'Chaco', 'Resistencia'),
('01234567J', 'Marta', 'Torres', '1998-05-29', 'Misiones', 'Posadas');


INSERT INTO empresa_internet.Plan (idPlan, velocidad, precio, descuento) VALUES
(1, "300", 83.00, 15.00),
(2, "200", 3.00, 2.00),
(3, "100", 2.00, 2.00),
(4, "500 Mbps", 90.50, 20.30),
(5, "500 Mbps", 199.50, 15.30);


INSERT INTO empresa_internet.Suscripcion (Cliente_dni, Plan_idPlan, fecha_suscripcion, duración) VALUES
("90123456I", 2, "2024-03-05", 120), 
("01234567J", 3, "2024-03-05", 120),
("12345678A", 1, "2024-03-05", 120), 
("23456789B", 1, "2024-03-05", 120);
