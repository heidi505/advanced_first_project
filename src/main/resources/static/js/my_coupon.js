window.onload = function(){
	

	// 내 쿠폰에 이벤트 연결
	const myCoupon = document.querySelectorAll(`.my_coupon`);
	myCoupon.forEach((coupon) => {
		coupon.addEventListener(`click`, e => {
			useMyCoupon();
		});
	});

}