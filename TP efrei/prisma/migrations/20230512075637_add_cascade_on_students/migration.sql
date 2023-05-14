-- CreateTable
CREATE TABLE `classes` (
    `idClasses` INTEGER NOT NULL AUTO_INCREMENT,
    `nameClasses` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`idClasses`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cours` (
    `idCours` INTEGER NOT NULL AUTO_INCREMENT,
    `idClasses` INTEGER NOT NULL,
    `idTeachers` INTEGER NOT NULL,
    `nameCours` VARCHAR(50) NOT NULL,

    INDEX `idClasses`(`idClasses`),
    INDEX `idTeachers`(`idTeachers`),
    PRIMARY KEY (`idCours`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `students` (
    `idStudents` INTEGER NOT NULL AUTO_INCREMENT,
    `firstNameStudents` VARCHAR(50) NOT NULL,
    `lastNameStudents` VARCHAR(50) NOT NULL,
    `idClasses` INTEGER NOT NULL,

    INDEX `idClasses`(`idClasses`),
    PRIMARY KEY (`idStudents`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `teachers` (
    `idTeachers` INTEGER NOT NULL AUTO_INCREMENT,
    `firstNameTeachers` VARCHAR(50) NOT NULL,
    `lastNameTeachers` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`idTeachers`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `administration` (
    `idAdministration` INTEGER NOT NULL AUTO_INCREMENT,
    `firstNameAdministration` VARCHAR(50) NOT NULL,
    `lastNameAdministration` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`idAdministration`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notes` (
    `idNotes` INTEGER NOT NULL AUTO_INCREMENT,
    `idStudents` INTEGER NOT NULL,
    `idClasses` INTEGER NOT NULL,
    `notes` INTEGER NOT NULL,

    INDEX `idClasses`(`idClasses`),
    INDEX `idStudents`(`idStudents`),
    PRIMARY KEY (`idNotes`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `salles` (
    `idSalles` INTEGER NOT NULL AUTO_INCREMENT,
    `idCours` INTEGER NOT NULL,
    `numeroSalle` INTEGER NOT NULL,

    INDEX `idCours`(`idCours`),
    PRIMARY KEY (`idSalles`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `cours` ADD CONSTRAINT `cours_ibfk_1` FOREIGN KEY (`idClasses`) REFERENCES `classes`(`idClasses`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `cours` ADD CONSTRAINT `cours_ibfk_2` FOREIGN KEY (`idTeachers`) REFERENCES `teachers`(`idTeachers`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `students` ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`idClasses`) REFERENCES `classes`(`idClasses`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `notes` ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`idClasses`) REFERENCES `classes`(`idClasses`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `notes` ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`idStudents`) REFERENCES `students`(`idStudents`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `salles` ADD CONSTRAINT `salles_ibfk_1` FOREIGN KEY (`idCours`) REFERENCES `cours`(`idCours`) ON DELETE RESTRICT ON UPDATE RESTRICT;
