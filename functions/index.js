const functions = require("firebase-functions");
const admin = require('firebase-admin');

admin.initializeApp();
const db = admin.firestore();

const JOB_COLLECTION = 'jobs';

exports.listJobs = functions.https.onRequest(async (request, response) => {
    var snapshot = await db.collection("jobs").orderBy("createdAt", "desc").get();
    response.set('Access-Control-Allow-Origin', '*');
    response.send({ jobList: snapshot.docs.map(doc => doc.data()) })
});