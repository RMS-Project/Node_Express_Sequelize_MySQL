import { DataTypes } from "sequelize"

import db from "../database"

// Cria um objeto com padrão pascal-case que contém a primeira letra em maiúsculo.
const Category = db.define(
    "Category" /* No do módulo */, {

    // Descrição das colunas da tabela.
    id: {
        type: DataTypes.INTEGER,
        primaryLey: true,
        autoIncrement: true
    },
    name: {
        type: DataTypes.STRING,
    },
    createAt: {
        type: DataTypes.DATE
    },
    updateAt: {
        type: DataTypes.DATE
    }
}, {
    // Objeto de configurações.
    tableName: "categoryp"
})

module.exports = Category