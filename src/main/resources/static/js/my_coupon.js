async function useMyCoupon(couponId){
	try{
		const response = await fetch(`/coupon/use-coupon/${couponId}`);
		const data = await response.json();
		// 쿠폰 사용에 성공했다는 결과 반환
		// 사용자에게 알리고, 쿠폰 사용 결과 (포인트 적립) 출력
	}catch(error){
		alert('쿠폰 사용에 실패하였습니다');
	}
}

window.onload = function(){
	
	// 내 쿠폰에 이벤트 연결
	const myCoupon = document.querySelectorAll(`.my_coupon`);
	myCoupon.forEach((coupon) => {
		coupon.addEventListener(`click`, e => {
			// 쿠폰 아이디를 가져와야 함
			let couponId = e.target.parentElement.firstChild.value;
			console.log(couponId);
			useMyCoupon(couponId);
		});
	});

}