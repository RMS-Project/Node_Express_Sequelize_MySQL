// Arquivo que junta todos os arquivos de configuração do model.
// Nele é criado o relacionamento entre a s tabelas.

import { Manufacturer } from './Manufacturer'
import { Product } from './Product'
import { Category } from './Category'
import { CategoryProduct } from "./CategoryProduct"

import { User } from './User'

// Relacionamento 1 para N.

// Produtos pertencem a um fabricante.
Product.belongsTo(Manufacturer, {
    foreignKey: "manufacturer.id"
})

// Um fabricante possui muitos produtos.
Manufacturer.hasMany(Product, {
    foreignKey: "manufacturer.id"
})

// Relacionamento 1 para 1.
// www.sequelize.org/v7/assocs.html

Product.belongsToMay(Category, {
    foreignKey: "product_id",
    through: CategoryProduct
})

Category.belongsToMay(Product, {
    foreignKey: "category_id",
    through: CategoryProduct
})

module.exports = {
    Manufacturer,
    Product,
    Category,

    User
}