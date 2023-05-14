import { prisma } from '../index.js'

const classesType = `
    type classes {
        idClasses: ID!
        nameClasses: String!
        cours: [cours]
        students: [students]
    }

    input classesInput {
        nameClasses: String
    }
`

const classesMutations = `
    insertClasses (value: classesInput): [classes]
    updateClasses (id: Int!, value: classesInput): [classes]
    deleteClasses (id: Int!): [classes]
`

const classesQuery = `
    "Permet de récupèrer les valeurs de la table Classes."
    getClasses : [classes]
`

const classesFunctions = {
    getClasses: () => {
        return prisma.classes.findMany()
    },

    insertClasses: async ({ value }) => {
        await prisma.classes.create({
            data: value
        })

        return prisma.classes.findMany()
    },

    updateClasses: async ({ id, value }) => {
        await prisma.classes.update({
            where: {
                idClasses: id
            },
            data: value
        })

        return prisma.classes.findMany({
            include: {
                students: true,
                cours: true
            }
        })
    },

    deleteClasses: async ({ id }) => {
        await prisma.classes.delete({
            where: {
                idClasses: id
            }
        })

        return prisma.classes.findMany()
    }
}

export {
    classesType,
    classesQuery,
    classesMutations,
    classesFunctions
}