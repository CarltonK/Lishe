import * as functions from 'firebase-functions'
import * as admin from 'firebase-admin'
import * as express from 'express'
import * as bodyParser from 'body-parser'

//Initialize Firebase
admin.initializeApp()

//Initialize Server
const app = express()
const main = express()

//Define API Url
main.use('/api/v1', app);
main.use(bodyParser.json())

//Expose Endpoints
export const lisheAPI = functions.https.onRequest(main)

//Initialize DB
const db = admin.firestore()

//USER
class User {
    static firstName: string
    static lastName: string
    static password1: string
    static password2: string
    static phone: number
}

/*
CREATE USER
POST
/users
*/

app.post('/users', async (request: express.Request, response: express.Response) => {
    try {
        const singleUser: User = {
            firstName: request.body['firstName'],
            lastName: request.body['lastName'],
            password1: request.body['password1'],
            password2: request.body['password2'],
            phone: request.body['phone'],
        }

        //Save the data in the DB
        //Save in Users collection
        await db.collection('users').doc().set(singleUser)
        response.status(201).json({
            status: true,
            message: 'Your account has been created successfully',
        })
    }
    catch (error) {
        response.status(400).json({
            status: false,
            message: 'You have not provided all the details',
        })
    }
})

/*
GET USERS
GET
/users
*/

app.get('/users', async (request: express.Request, response: express.Response) => {
    try {
        //Placeholder to store users
        const users: Array<any> = []
        //Get users
        const usersRetrieved = await db.collection('users').get()
        usersRetrieved.forEach((single) => {
            users.push(single.data())
        })

        response.status(200).json({
            status: true,
            message: 'Users retrieved successfully',
            data: users
        })
    }
    catch (error) {
        response.status(400).json({
            status: false,
            message: 'Users could not be found',
        })
    }
})