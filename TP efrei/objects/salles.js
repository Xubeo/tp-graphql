import { prisma } from '../index.js'

const sallesType = `
    type salles {
        idSalles: ID!
        numeroSalle: Int
        cours: [cours]
    }

    input sallesInput {
        numeroSalle: Int
    }
`

const sallesMutations = `
    insertSalles (value: sallesInput): [salles]
    updateSalles (id: Int!, value: sallesInput): [salles]
    deleteSalles (id: Int!): [salles]
`

const sallesQuery = `
    "Permet de récupèrer les valeurs de la table Salles."
    getSalles : [salles]
`

const sallesFunctions = {
    getSalles: () => {
        return prisma.salles.findMany()
    },

    insertSalles: async ({ value }) => {
        await prisma.salles.create({
            data: value
        })

        return prisma.salles.findMany()
    },

    updateSalles: async ({ id, value }) => {
        await prisma.salles.update({
            where: {
                idSalles: id
            },
            data: value
        })

        return prisma.salles.findMany()
    },

    deleteSalles: async ({ id }) => {
        await prisma.salles.delete({
            where: {
                idSalles: id
            }
        })

        return prisma.salles.findMany()
    }
}

export {
    sallesType,
    sallesQuery,
    sallesMutations,
    sallesFunctions
}