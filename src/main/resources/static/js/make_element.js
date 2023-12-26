// 요소 타입과 클래스명을 받아 생성하는 함수
function makeElement(elementType, classString){
	const element = document.createElement(elementType);
	// 클래스명이 없다면 생략
	if(classString != undefined){
		const classArray = classString.split(` `);
		classArray.forEach(name => {
			element.classList.add(name);
		})
	}
	return element;	
};