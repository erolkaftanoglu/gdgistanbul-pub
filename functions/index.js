const functions = require("firebase-functions");
const admin = require('firebase-admin');

admin.initializeApp();
const db = admin.firestore();

const JOB_COLLECTION = 'jobs';

exports.listJobs = functions.https.onRequest(async (request, response) => {
    var jobTypes = request.query.jobTypes;
    console.log(jobTypes);
    // var snapshot = await db.collection("jobs").orderBy("createdAt", "desc").where("jobType", "==", jobTypes).get();
    var jobsRef = db.collection("jobs")
    var snapshot = await jobsRef.where('jobType', '==', jobTypes).get();
    
    response.set('Access-Control-Allow-Origin', '*');
    response.send({ jobList: snapshot.docs.map(doc => doc.data()) })
});

