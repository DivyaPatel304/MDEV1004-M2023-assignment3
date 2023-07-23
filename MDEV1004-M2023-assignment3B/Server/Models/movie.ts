/**
 * File: movie.ts
 * 
 * Student's Name: Divya Patel 
 * Student ID: 200538095
 * 
 * Date: 23/07/2023
 */



import { Schema, model } from 'mongoose';

// Defines the Mongoose schema and model for the Movie collection

interface IMovie {
    movieID: string,
    title: string,
    studio: string,
    genres: string[],
    directors: string[],
    writers: string[],
    actors: string[],
    year: number,
    length: number,
    shortDescription: string,
    mpaRating: string,
    posterLink: string,
    criticsRating: number
}



let movieSchema = new Schema<IMovie>({
    movieID: String,
    title: String,
    studio: String,
    genres: [String],
    directors: [String],
    writers: [String],
    actors: [String],
    year: Number,
    length: Number,
    shortDescription: String,
    mpaRating: String,
    posterLink: String,
    criticsRating: Number
});


// Creating a Movie model using the movie schema

let Movie = model<IMovie>('Movie', movieSchema);

export default Movie;