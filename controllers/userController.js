import { User } from '../models'

// Necessário biblioteca bcrypt para senhas criptografadas
import bcrypt from 'bcryptjs'

const userController = {
    async createUser(request, response) {

        const { name, email, password, confirmPassword } = request.body;

        if(password !== confirmPassword) {
            return response.status(401).json("A senha de confirmação não corresponde a senha informada.")
        }

        password = bcrypt.hashSync(confirmPassword, 10);

        const newUser = await User.create({
            name,
            email,
            password
        })
        
        return response.status(201).json(newUser)
    }
}

module.exports = userController