// Para utilizar o s recursos de um ORM devemos criar uma padronização no projeto.
// Para cada tabela que temos no banco de dados será um arquivo em models.

import { DataTypes } from "sequelize"

import db from "../database"

// Cria um objeto com padrão pascal-case que contém a primeira letra em maiúsculo.
const User = db.define(
    "User" /* No do módulo */, {

    // Descrição das colunas da tabela.
    id: {
        type: DataTypes.INTEGER,
        primaryLey: true,
        autoIncrement: true
    },
    name: {
        type: DataTypes.STRING,
    },
    email: {
        type: DataTypes.STRING,
    },
    password: {
        type: DataTypes.STRING
    }
}, {
    // Objeto de configurações.
    tableName: "user"
})

module.exports = User