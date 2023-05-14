import { prisma } from '../index.js'

const coursType = `
    type cours {
        idCours: ID!
        idClasses: Int
        idTeachers: Int
        idSalles: Int
        nameCours: String
        classes: classes
        teachers: teachers
        salles: salles
        notes: [notes]
    }

    input coursInput {
        idClasses: Int
        idTeachers: Int
        idSalles: Int
        nameCours: String
    }
`

const coursMutations = `
    insertCours (value: coursInput): [cours]
    updateCours (id: Int!, value: coursInput): [cours]
    deleteCours (id: Int!): [cours]
`

const coursQuery = `
    "Permet de récupèrer les valeurs de la table Cours."
    getCours : [cours]
`

const coursFunctions = {
    getCours: () => {
        return prisma.cours.findMany({
            include: {
                teachers: true,
                classes: true,
                salles: true
            }
        })
    },

    insertCours: async ({ value }) => {
        await prisma.cours.create({
            data: value
        })

        return prisma.cours.findMany({
            include: {
                teachers: true,
                classes: true,
                salles: true
            }
        })
    },

    updateCours: async ({ id, value }) => {
        await prisma.cours.update({
            where: {
                idCours: id
            },
            data: value
        })

        return prisma.cours.findMany({
            include: {
                teachers: true,
                classes: true,
                salles: true
            }
        })
    },

    deleteCours: async ({ id }) => {
        await prisma.cours.delete({
            where: {
                idCours: id
            }
        })

        return prisma.cours.findMany()
    }
}

export {
    coursType,
    coursQuery,
    coursMutations,
    coursFunctions
}