import { prisma } from '../index.js'

const administrationType = `
    type administration {
        idAdministration: ID!
        firstNameAdministration: String
        lastNameAdministration: String
    }

    input administrationInput {
        firstNameAdministration: String
        lastNameAdministration: String
    }
`

const administrationMutations = `
    insertAdministration (value: administrationInput): [administration]
    updateAdministration (id: Int!, value: administrationInput): [administration]
    deleteAdministration (id: Int!): [administration]
`

const administrationQuery = `
    "Permet de récupèrer les valeurs de la table Administration."
    getAdministration : [administration]
`

const administrationFunctions = {
    getAdministration: () => {
        return prisma.administration.findMany()
    },

    insertAdministration: async ({ value }) => {
        await prisma.administration.create({
            data: value
        })

        return prisma.administration.findMany()
    },

    updateAdministration: async ({ id, value }) => {
        await prisma.administration.update({
            where: {
                idAdministration: id
            },
            data: value
        })

        return prisma.administration.findMany()
    },

    deleteAdministration: async ({ id }) => {
        await prisma.administration.delete({
            where: {
                idAdministration: id
            }
        })

        return prisma.administration.findMany()
    }
}

export {
    administrationType,
    administrationQuery,
    administrationMutations,
    administrationFunctions
}