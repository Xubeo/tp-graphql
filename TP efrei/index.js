import { PrismaClient } from '@prisma/client'
import express from 'express'
import { buildSchema } from 'graphql'
import { graphqlHTTP } from 'express-graphql'

import { administrationType, administrationQuery, administrationMutations, administrationFunctions } from './objects/administration.js'
import { classesType, classesQuery, classesMutations, classesFunctions } from './objects/classes.js'
import { coursType, coursQuery, coursMutations, coursFunctions } from './objects/cours.js'
import { notesType, notesQuery, notesMutations, notesFunctions } from './objects/notes.js'
import { sallesType, sallesQuery, sallesMutations, sallesFunctions } from './objects/salles.js'
import { studentsType, studentsQuery, studentsMutations, studentsFunctions } from './objects/students.js'
import { teachersType, teachersQuery, teachersMutations, teachersFunctions } from './objects/teachers.js'

export const prisma = new PrismaClient()

let schema = buildSchema(`
    ${classesType}
    ${coursType}
    ${studentsType}
    ${teachersType}
    ${administrationType}
    ${notesType}
    ${sallesType}

    type Query {
        ${classesQuery}
        ${coursQuery}
        ${studentsQuery}
        ${teachersQuery}
        ${administrationQuery}
        ${notesQuery}
        ${sallesQuery}
    }

    type Mutation {
        ${classesMutations}
        ${coursMutations}
        ${studentsMutations}
        ${teachersMutations}
        ${administrationMutations}
        ${notesMutations}
        ${sallesMutations}
    }
`)

let root = {
    ...classesFunctions,
    ...coursFunctions,
    ...studentsFunctions,
    ...teachersFunctions,
    ...administrationFunctions,
    ...notesFunctions,
    ...sallesFunctions
}

let app = express()
app.use(
    '/graphql',
    graphqlHTTP({
        schema: schema,
        rootValue: root,
        graphiql: true,
    })
)

app.listen(4002)