window.onload = function () {
        const datepicker = document.getElementById('datepicker');
        const datepicker2 = document.getElementById('datepicker2');
        const startDateInput = document.getElementById('startDate');
        const endDateInput = document.getElementById('endDate');

        function handleDateChange(selectedDates, dateStr, instance) {
        console.log('선택된 날짜:', dateStr);
    }

        flatpickr(datepicker, {
            mode: "range",
            minDate: "today",
            dateFormat: "Y-m-d",
            disable: [
                function(date) {
                    // disable every multiple of 8
                    return !(date.getDate() % 8);
                }
            ],
        dateFormat: 'Y-m-d', // 날짜 및 시간 형식 설정 (예: 2023-09-12 15:30)// 시간 선택 활성화
        time_24hr: true,         // 24시간 형식 사용
        minDate: 'today',        // 오늘 이전 날짜 선택 비활성화
        maxDate: '2025-12-31',   // 특정 날짜까지 선택 가능
        defaultDate: 'today',    // 초기 날짜 설정 (현재 날짜와 시간)
        disable: ['2023-09-15', '2023-09-20'], // 특정 날짜 비활성화
        locale: 'ko',            // 한국어로 지역화
        onOpen: function(selectedDates, dateStr, instance) {
        // 위젯이 열릴 때 실행할 코드
    },
        onClose: function(selectedDates, dateStr, instance) {
        // 위젯이 닫힐 때 실행할 코드
    },
        onChange: function(selectedDates, dateStr, instance) {
        // 날짜가 변경될 때 실행할 코드
    },
        disableMobile: true,      // 모바일 기기에서 위젯 비활성화
        altInput: true,           // 추가 입력란 활성화
        altFormat: 'F j, Y', // 추가 입력란의 날짜 및 시간 형식
    });

        flatpickr(datepicker2, {
        dateFormat: 'Y-m-d', // 날짜 형식 설정 (예: 2023-09-12)
        enableTime: false,   // 시간 선택 비활성화
        minDate: 'today',    // 오늘 이전 날짜 선택 비활성화
        defaultDate: new Date() // 초기 날짜 설정 (현재 날짜로 설정)

    });
        flatpickr(startDateInput, {
        dateFormat: 'Y-m-d',
        enableTime: false,
        minDate: 'today',
        defaultDate: 'today',
        locale: 'ko',
        onChange: handleDateChange, // 날짜 선택 이벤트 핸들러 등록
    });

        flatpickr(endDateInput, {
        dateFormat: 'Y-m-d',
        enableTime: false,
        minDate: 'today',
        defaultDate: 'today',
        locale: 'ko',
        onChange: handleDateChange, // 날짜 선택 이벤트 핸들러 등록
    });
}