import { prisma } from '../index.js'

const teachersType = `
    type teachers {
        idTeachers: ID!
        firstNameTeachers: String
        lastNameTeachers: String
        cours: [cours]
    }

    input teachersInput {
        firstNameTeachers: String
        lastNameTeachers: String
    }
`

const teachersMutations = `
    insertTeachers (value: teachersInput): [teachers]
    updateTeachers (id: Int!, value: teachersInput): [teachers]
    deleteTeachers (id: Int!): [teachers]
`

const teachersQuery = `
    "Permet de récupèrer les valeurs de la table Teachers."
    getTeachers : [teachers]
`

const teachersFunctions = {
    getTeachers: () => {
        return prisma.teachers.findMany()
    },

    insertTeachers: async ({ value }) => {
        await prisma.teachers.create({
            data: value
        })

        return prisma.teachers.findMany()
    },

    updateTeachers: async ({ id, value }) => {
        await prisma.teachers.update({
            where: {
                idTeachers: id
            },
            data: value
        })

        return prisma.teachers.findMany()
    },

    deleteTeachers: async ({ id }) => {
        await prisma.teachers.delete({
            where: {
                idTeachers: id
            }
        })

        return prisma.teachers.findMany()
    }
}

export {
    teachersType,
    teachersQuery,
    teachersMutations,
    teachersFunctions
}