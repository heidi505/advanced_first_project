 import { initializeApp } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-app.js";
  import { getMessaging , onMessage } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-messaging.js";
 
const firebaseConfig = {
    apiKey: "AIzaSyAyH8kceRChzHcJjLFiO7OtKSuShMxqdhw",
    authDomain: "two-flight-ticket-82cd2.firebaseapp.com",
    projectId: "two-flight-ticket-82cd2",
    storageBucket: "two-flight-ticket-82cd2.appspot.com",
    messagingSenderId: "877375565972",
    appId: "1:877375565972:web:4fb7740d1cb80a164e8481",
    measurementId: "G-CW9KDBSLL8"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const messaging = getMessaging(app);
  
   // 서비스 워커 경로 지정
  navigator.serviceWorker.register('/firebase-messaging-sw.js')
  .then((registration) => {
    console.log('Service Worker registered with scope:', registration.scope);
  })
  .catch((error) => {
    console.error('Service Worker registration failed:', error);
  });
  
    // 푸시 알림 수신 처리
    onMessage(messaging, (payload) => {
    console.log('Message received:', payload);

    const notificationTitle = payload.notification.title;
    const notificationOptions = {
        body: payload.notification.body,
    };

    self.registration.showNotification(notificationTitle, notificationOptions);
    });