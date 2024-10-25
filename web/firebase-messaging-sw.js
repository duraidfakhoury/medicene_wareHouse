importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

const firebaseConfig = {
    apiKey: "AIzaSyAmgFZaPrI6L3nM42CrVu1W39zxWDolqEo",
    authDomain: "even-crossing-400500.firebaseapp.com",
    projectId: "even-crossing-400500",
    storageBucket: "even-crossing-400500.appspot.com",
    messagingSenderId: "584194731992",
    appId: "1:584194731992:web:782ea2d0c59b753a664cad",
    measurementId: "G-VSJC2RDJLR"
};

firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

messaging.onBackgroundMessage((message) => {
    console.log("onBackgroundMessage", message);
  });