import { Product, Manufacturer, Category } from '../models/index.js'

const productsController = {
    listProduct: async (req, res) => {
        const listOfProduct = await Product.findAll({
            // Retorna o produto mais o seu fabricante.
            include: Manufacturer
        });

        res.json(listOfProduct)
    },

    // Necessário adicionar o manufacture para que o sequelize entenda a relação
    // entre as duas tabelas.
    async createProduct(req, res) {
        const {name, price, quantify, manufacturer_id, category_id } = req.body;

        const newProduct = await Product.create({
            name,
            price,
            quantify,
            manufacturer_id
        });

        // findByPk - busca a categoria pelo id.
        const category = await Category.findByPk(category_id)

        await newProduct.setCategory(category)

        res.json(newProduct)
    }

    // Special methods - foo.hasMany(Bar)
}

export default productsController