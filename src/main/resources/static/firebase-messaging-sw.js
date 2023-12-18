 const firebaseConfig = {
    apiKey: "AIzaSyAyH8kceRChzHcJjLFiO7OtKSuShMxqdhw",
    authDomain: "two-flight-ticket-82cd2.firebaseapp.com",
    projectId: "two-flight-ticket-82cd2",
    storageBucket: "two-flight-ticket-82cd2.appspot.com",
    messagingSenderId: "877375565972",
    appId: "1:877375565972:web:4fb7740d1cb80a164e8481",
    measurementId: "G-CW9KDBSLL8"
  };
  
// 푸시 알림 수신 처리
self.addEventListener('push', function (event) {
    var payload = event.data.json(); // FCM 메시지 페이로드 가져오기

    // 푸시 알림 생성
    self.registration.showNotification(payload.notification.title, {
        body: payload.notification.body,
        icon: payload.notification.icon,
        data: {
            url: payload.notification.click_action // 클릭할 때 열 URL
        }
    });
});

// 푸시 알림 클릭 이벤트 처리
self.addEventListener('notificationclick', function (event) {
    var notification = event.notification;
    var action = event.action;

    // 알림 클릭 처리 로직
    if (action === 'open_url' && notification.data.url) {
        // 클릭할 때 열 URL이 있는 경우 해당 URL로 이동
        clients.openWindow(notification.data.url);
    }

    // 알림을 닫습니다.
    notification.close();
});