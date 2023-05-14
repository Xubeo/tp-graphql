import { prisma } from '../index.js'

const studentsType = `
    type students {
        idStudents: ID!
        firstNameStudents: String
        lastNameStudents: String
        idClasses: Int
        notes: [notes]
        classes: classes
    }

    input studentsInput {
        firstNameStudents: String
        lastNameStudents: String
        idClasses: Int
    }
`

const studentsMutations = `
    insertStudents (value: studentsInput): [students]
    updateStudents (id: Int!, value: studentsInput): [students]
    deleteStudents (id: Int!): [students]
`

const studentsQuery = `
    "Permet de récupèrer les valeurs de la table Students."
    getStudents : [students]
`

const studentsFunctions = {
    getStudents: () => {
        return prisma.students.findMany({
            include: {
                classes: true,
                notes: true
            }
        })
    },

    insertStudents: async ({ value }) => {
        await prisma.students.create({
            data: value
        })

        return prisma.students.findMany({
            include: {
                classes: true
            }
        })
    },

    updateStudents: async ({ id, value }) => {
        await prisma.students.update({
            where: {
                idStudents: id
            },
            data: value
        })

        return prisma.students.findMany({
            include: {
                classes: true
            }
        })
    },

    deleteStudents: async ({ id }) => {
        await prisma.students.delete({
            where: {
                idStudents: id
            }
        })

        return prisma.students.findMany()
    }
}

export {
    studentsType,
    studentsQuery,
    studentsMutations,
    studentsFunctions
}