const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Course = sequelize.define('Course', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  title: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  description: {
    type: DataTypes.TEXT,
    allowNull: true,
  },
}, {
  timestamps: true, // Esto crea automáticamente las columnas createdAt y updatedAt
  tableName: 'courses', // Asegúrate de que el nombre de la tabla coincida con el de la BD
});

module.exports = Course;
