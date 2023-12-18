// Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-analytics.js";
  import { getMessaging , getToken } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-messaging.js";
  import { getInstallations, getId } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-installations.js";


 
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
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
  const analytics = getAnalytics(app);
  const messaging = getMessaging(app);
  const installation = getInstallations(app);
  // Firebase Installation ID 가져오기
  const installationId = await getId(installation);
  // 클라이언트 식별자를 히든 타입에 저장
  const installationIdInput = document.getElementById('installationId');
  installationIdInput.value = installationId;
  // 서비스 워커 경로 지정
  navigator.serviceWorker.register('/firebase-messaging-sw.js')
  .then((registration) => {
    console.log('Service Worker registered with scope:', registration.scope);
  })
  .catch((error) => {
    console.error('Service Worker registration failed:', error);
  });
    
   
  Notification.requestPermission().then((permission) => {
  if (permission === 'granted') {
    // 사용자가 알림 허용한 경우
    getToken(messaging, { vapidKey: 'BCPIpN8VnNsSCtJlN2-YpFOcqfJqKdf7sy5DC_kTpk1yN8KrMxZc9yB1Mn0yKDN8_wPKRPh3x77t3T6fG2_bGB8' })
      .then((currentToken) => {
		// fcm 토큰을 hidden 타입에 저장
        const fcmTokenInput = document.getElementById('fcmToken');
        fcmTokenInput.value = currentToken;
      })
      .catch((err) => {
        console.log('An error occurred while retrieving token. ', err);
      });
  } else {
    console.log('User denied notification permission');
  }
});

  