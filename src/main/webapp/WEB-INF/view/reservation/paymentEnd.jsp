<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>


<!-- TODO 여기서부터 main영역 -->
<main class="airport_info_page pt-0 mt-0">
	<div class="container">
		<div class="section">
			<div class=" w-85 pt-5 mx-auto">
				<div class="p-5 text-center">
					<img class="payed_result_mark p-3 rounded-circle" src="/images/check_mark.png">
					<p class="fs-1 my-2"><b>항공권 결제가 정상적으로 완료되었습니다.</b></p>
					<p class="mt-3">예약상세/결제하기에서 확인할 수 있습니다.</p>
				</div>
				<hr class="w-75 mx-auto">
			</div>
			<!-- 상단 페이지 끝-->
			<div class="mx-auto w-85 mt-5">
			<h2 class="my-4"><b>예약 상세</b></h2>
			<table class="w-100 parking_fee_table table mt-3 mx-auto">
			<thead>
			<tr>
			<th class="align-middle">예약번호</th>
			<td class="text-start ps-3">1234-5678</td>
			<th>여행일</th>
			<td class="text-start ps-3">2019.10.22</td>
			</tr>
			<tr>
			  <th class="py-3">여행자</th>
			  <td colspan="3" class="text-start ps-3">홍길동 포함 2명</td>
			</tr>
			</thead>
			<tbody>
			</tbody>
			</table>
			<h2 class="my-4"><b>결제금액</b></h2>
			<div class="w-100  d-flex mx-auto">
			<div class="w-50 border p-5 lh-lg bg_line">
			<span class="me-5">결제일</span><span class="float-end">2019-09-16 10:18</span>
			<br><span class="me-5">결제수단</span><span class="float-end"><b>카카오페이</b></span>
			</div>
			<div class="w-50 border p-5 lh-lg">
			<span class="me-5">총 금액</span><span class="float-end">30,000</span>
			<br><span class="me-5">총 할인금액</span><span class="float-end">-9,000</span>
			<br><span class="me-5">└ 적용된 쿠폰</span><span class="float-end">-2,000</span>
			<hr class="my-2">
			<br><span class="me-5">결제금액</span><span class="float-end">29,000</span>
			</div>
			</div>
			</div>
			<div class="w-100 text-center p-5">
			<button class="payed_check_btn btn btn-primary w-25">확인</button>
			</div>
			
			
			
			
			
			
			
		</div>
		<!-- section end -->
	</div>
</main>

</div>
</div>


<script src="/js/payment_end.js"></script>
<!-- header.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>