USE playground3;

-- Creación de la tabla Usuarios
CREATE TABLE Usuarios (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    categoria ENUM('estudiante', 'docente', 'editor', 'administrador') NOT NULL
);

-- Creación de la tabla Cursos
CREATE TABLE Cursos (
    curso_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    imagen VARCHAR(100),
    fecha_inicio DATE NOT NULL,
    fecha_finalizacion DATE NOT NULL,
    cupo_maximo INT NOT NULL
);

-- Creación de la tabla Unidades
CREATE TABLE Unidades (
    unidad_id INT AUTO_INCREMENT PRIMARY KEY,
    curso_id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id)
);

-- Creación de la tabla Clases
CREATE TABLE Clases (
    clase_id INT AUTO_INCREMENT PRIMARY KEY,
    unidad_id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE NOT NULL,
    visibilidad BOOLEAN NOT NULL,
    FOREIGN KEY (unidad_id) REFERENCES Unidades(unidad_id)
);

-- Creación de la tabla intermedia Usuarios_Cursos
CREATE TABLE Usuarios_Cursos (
    usuario_curso_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    curso_id INT,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id)
);

-- Creación de la tabla Bloques
CREATE TABLE Bloques (
    bloque_id INT AUTO_INCREMENT PRIMARY KEY,
    clase_id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    tipo ENUM('texto', 'video', 'presentacion', 'PDF', 'archivo') NOT NULL,
    contenido TEXT NOT NULL,
    visibilidad BOOLEAN NOT NULL,
    FOREIGN KEY (clase_id) REFERENCES Clases(clase_id)
);
