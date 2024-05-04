USE playground3;

-- Consulta 1
SELECT *, COUNT(curso_id) FROM unidades GROUP BY curso_id LIMIT 5;

-- Consulta 2
SELECT c.titulo AS curso, AVG(num_unidades) AS media_unidades
FROM Cursos c
JOIN (SELECT curso_id, COUNT(*) AS num_unidades
    FROM Unidades
    GROUP BY curso_id) AS UnidadesPorCurso ON c.curso_id = UnidadesPorCurso.curso_id
GROUP BY c.titulo;

-- CONSULTA 3 
SELECT * FROM usuarios u
INNER JOIN usuarios_cursos uc ON u.usuario_id = uc.usuario_id
GROUP BY u.usuario_id
HAVING COUNT(uc.curso_id) > 3
ORDER BY nombre ASC;

-- CONSULTA 4 
SELECT *
FROM Clases
WHERE fecha_inicio > '2024-04-29'
ORDER BY fecha_inicio ASC
LIMIT 10;


-- CONSULTA 5 
SELECT tipo, COUNT(*) AS numero_de_bloques
FROM Bloques
WHERE clase_id = 1
GROUP BY tipo;

-- CONSULTA 6 
SELECT 
    COALESCE(nombre, '') AS nombre,
    COALESCE(apellido, '') AS apellido
FROM Usuarios;

-- CONSULTA 7 
SELECT c.titulo AS curso, COUNT(uc.usuario_id) AS cantidad_usuarios
FROM Cursos c
JOIN Usuarios_Cursos uc ON c.curso_id = uc.curso_id
GROUP BY c.curso_id
ORDER BY COUNT(uc.usuario_id) DESC
LIMIT 3;

-- CONSULTA 8 
SELECT c.titulo AS curso, AVG(num_clases) AS promedio_clases_por_unidad
FROM Cursos c
JOIN Unidades u ON c.curso_id = u.curso_id
LEFT JOIN (SELECT unidad_id, COUNT(*) AS num_clases
    FROM Clases GROUP BY unidad_id) AS clases_por_unidad ON u.unidad_id = clases_por_unidad.unidad_id
GROUP BY c.titulo;

-- CONSULTA 9 
SELECT u.nombre, u.apellido, c.fecha_inicio, COUNT(uc.curso_id) AS cantidad_cursos
FROM Usuarios u
JOIN Usuarios_Cursos uc ON u.usuario_id = uc.usuario_id
JOIN Cursos c ON uc.curso_id = c.curso_id
WHERE c.fecha_inicio > '2023-05-01'
GROUP BY u.usuario_id
HAVING COUNT(uc.curso_id) > 2
ORDER BY u.nombre ASC;


-- CONSULTA 10 
SELECT *
FROM Unidades
WHERE fecha_inicio > '2023-12-05'
ORDER BY fecha_inicio DESC
LIMIT 5;

-- CONSULTA 11 
SELECT u.categoria, COUNT(*) AS numero_de_usuarios
FROM Usuarios u
JOIN Usuarios_Cursos uc ON u.usuario_id = uc.usuario_id
WHERE uc.curso_id = 1
GROUP BY u.categoria;


