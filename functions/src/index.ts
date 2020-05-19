import * as functions from 'firebase-functions'
import * as admin from 'firebase-admin'
import * as express from 'express'

//Initialize Firebase
admin.initializeApp()

//Initialize Server
const app = express()
const main = express()

//Define API Url
main.use('/api/v1', app)
main.use(express.json())

//Expose Endpoints
export const lisheAPI = functions.https.onRequest(main)

//Initialize DB
const db = admin.firestore()
const auth = admin.auth()

//USER
class User {
    firstName: string
    lastName: string
    password1: string
    password2: string
    phone: string
    email: string
    uid: string = ""
    registerDate: admin.firestore.Timestamp = admin.firestore.Timestamp.now()

    constructor(firstName: string, lastName: string, password1: string, password2: string, phone: string, email: string) {
        this.firstName = firstName
        this.lastName = lastName
        this.password1 = password1
        this.password2 = password2
        this.phone = phone
        this.email = email
    }
}

/*
CREATE USER
POST
/users
*/

app.post('/register', async (request: express.Request, response: express.Response) => {
    try {
        const singleUser: User = new User(
            request.body['firstName'],
            request.body['lastName'],
            request.body['password1'],
            request.body['password2'],
            request.body['phone'],
            request.body['email'],
        )
        
        //Granular search
        if (singleUser.firstName === null || singleUser.lastName === null || singleUser.email === null 
            || singleUser.password1 === null || singleUser.password2 === null || singleUser.phone === null) {
                response.status(400).json({
                    status: false,
                    message: 'One or more fields is missing',
                })
        }
        else if (singleUser.password1.length < 7) {
            response.status(400).json({
                status: false,
                message: 'Password should be more than 7 characters',
            })
        }
        else if (!singleUser.email.includes('@')) {
            response.status(400).json({
                status: false,
                message: 'Email must contain @',
            })
        }
        else if (singleUser.phone.length !== 10) {
            response.status(400).json({
                status: false,
                message: 'Phone Number should be 10 digits',
            })
        }
        else if (!singleUser.phone.startsWith('07')) {
            response.status(400).json({
                status: false,
                message: 'Phone Number should start with 07',
            })
        }
        else if (singleUser.password1 !== singleUser.password2) {
            response.status(400).json({
                status: false,
                message: 'Passwords do not match',
            })
        }
        else {
            //Authenticate the user
            const newUser: admin.auth.UserRecord = await auth.createUser({
                email: singleUser.email, 
                password: singleUser.password1
            })
            console.log(`${newUser.uid} is trying to register`)
            singleUser.uid = newUser.uid
            //Save the data in the DB
            //Save in Users collection
            await db.collection('users').doc(singleUser.uid).set({
                'email': singleUser.email,
                'firstName': singleUser.firstName,
                'lastName': singleUser.lastName,
                'phone': singleUser.phone,
                'uid': singleUser.uid,
                'registerDate': singleUser.registerDate
            })
            .catch((error) => {
                response.status(400).json({
                status: false,
                message: error,
                })
            })
            response.status(201).json({
                status: true,
                message: `Welcome to Lishe ${singleUser.firstName}`,
            })
        }
    }
    catch (error) {
        response.status(400).json({
            status: false,
            message: error,
        })
    }
})

app.post('/login', async (request: express.Request, response: express.Response) => {
    try {
        const email: string = request.body['email']
        const password1: string = request.body['password1']

        if (email === null) {
            response.status(400).json({
                status: false,
                message: 'Email address is required',
            })
        }
        else if (password1 === null) {
            response.status(400).json({
                status: false,
                message: 'Please provide a password',
            })
        }
        else if (password1.length < 7) {
            response.status(400).json({
                status: false,
                message: 'Password should be more than 7 characters',
            })
        }
        else {
            const loggedInUser: admin.auth.UserRecord = await auth.getUserByEmail(email)
            if (loggedInUser === null) {
                response.status(400).json({
                    status: false,
                    message: 'The email address could not be found'
                })
            }
            else {
                const uid: string = loggedInUser.uid
                console.log(`${uid} is attempting to Login`)
                //Retrieve user data
                const userDoc: admin.firestore.DocumentData = await db.collection('users').doc(uid).get()
                response.status(200).json({
                    status: true,
                    message: `Welcome ${userDoc.get('firstName')}`,
                    user: userDoc.data()
                })
            }
        }
    }
    catch (error) {
        response.status(400).json({
            status: false,
            message: error,
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