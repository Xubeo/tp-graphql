import { prisma } from '../index.js'

const notesType = `
    type notes {
        idNotes: ID!
        idStudents: Int
        idCours: Int
        notes: Int
        students: students
        cours: cours
    }

    input notesInput {
        idStudents: Int
        idCours: Int
        notes: Int
    }
`

const notesMutations = `
    insertNotes (value: notesInput): [notes]
    updateNotes (id: Int!, value: notesInput): [notes]
    deleteNotes (id: Int!): [notes]
`

const notesQuery = `
    "Permet de récupèrer les valeurs de la table Notes."
    getNotes : [notes]
`

const notesFunctions = {
    getNotes: () => {
        return prisma.notes.findMany({
            include: {
                students: true,
                cours: true
            }
        })
    },

    insertNotes: async ({ value }) => {
        await prisma.notes.create({
            data: value
        })

        return prisma.notes.findMany({
            include: {
                students: true,
                cours: true
            }
        })
    },

    updateNotes: async ({ id, value }) => {
        await prisma.notes.update({
            where: {
                idNotes: id
            },
            data: value
        })

        return prisma.notes.findMany({
            include: {
                students: true,
                cours: true
            }
        })
    },

    deleteNotes: async ({ id }) => {
        await prisma.notes.delete({
            where: {
                idNotes: id
            }
        })

        return prisma.notes.findMany({
            include: {
                students: true,
                cours: true
            }
        })
    }
}

export {
    notesType,
    notesQuery,
    notesMutations,
    notesFunctions
}