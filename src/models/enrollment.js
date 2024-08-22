const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Student = require('./student');
const Course = require('./course');

const Enrollment = sequelize.define('Enrollment', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  grade: {
    type: DataTypes.STRING,
    allowNull: true,
  },
}, {
  timestamps: true, // Esto crea automáticamente las columnas createdAt y updatedAt
  tableName: 'enrollments', // Asegúrate de que el nombre de la tabla coincida con el de la BD
});

// Definir las relaciones
Student.belongsToMany(Course, { through: Enrollment });
Course.belongsToMany(Student, { through: Enrollment });

module.exports = Enrollment;
