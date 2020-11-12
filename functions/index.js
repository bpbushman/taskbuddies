const functions = require('firebase-functions');

exports.onCreateFollower = functions.firestore
    .document("/followers/{userid}/userFollowers/{followerId}")
    .onCreate(async (snap, context) =>  {
        const userId = context.params.userId;
        const followerId = context.params.followerId;
        const followedUserRef = admin
            .firestore()
            .collection('lists')
            .doc(userId)
            .collection('userLists');
        const timeLinePostsRef = admin
            .firestore()
            .collection('timeline')
            .doc(followerId)
            .collection('timelinePosts');
        const querySnapshot = await followedUserRef.get();
        
    });

    //8003008800 #