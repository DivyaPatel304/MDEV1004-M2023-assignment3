/**
 * File: db.ts
 * 
 * Student's Name: Divya Patel 
 * Student ID: 200538095
 * 
 * Date: 23/07/2023
 */


let localURI= 'mongodb://127.0.0.1:27017/movies';
let remoteURI='mongodb+srv://divya:12345@cluster0.qjwziqz.mongodb.net/movies';
let secret = 'SomeSecret';

export default {
    localURI: localURI,
    remoteURI: remoteURI,
    secret: secret
}