<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>

<div id="reservation_preview_page">
    <div class="container">
        <div class="container mt-3">
            <button type="button" class="btn fare_modal_btn" data-bs-toggle="modal" data-bs-target="#myModal">
                운임규정보기
            </button>
        </div>

        <!-- The Modal -->
        <div class="modal res_modal_add" id="myModal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="res_modal_form">
                    <div style="padding: 0.5em 1.5em 1.5em 1.5em;">
                    <h2 class="detail_res_title">
                        <span class="detail_agree_title float-start">운임규정</span>
                        <button type="button" class="btn-close float-end" data-bs-dismiss="modal"></button>
                    </h2>
                    </div>
                    <!-- Modal Header -->
                    <div class="w3-container" id="menu">
                        <div class="" style="max-width:1000px">
                            <div class="w3-row w3-card w3-padding">
                                <div class="detail_agree_form">
                                    <a href="javascript:void(0)" onclick="openMenu(event, 'rule1');"
                                       id="agreeMyLink">
                                        <div class="agreeTablink detail_agree_box">예약규정</div>
                                    </a>
                                    <a href="javascript:void(0)" onclick="openMenu(event, 'rule2');">
                                        <div class="agreeTablink detail_agree_box">운임규정</div>
                                    </a>
                                    <a href="javascript:void(0)" onclick="openMenu(event, 'rule3');">
                                        <div class="agreeTablink detail_agree_box">결제규정</div>
                                    </a>
                                    <a href="javascript:void(0)" onclick="openMenu(event, 'rule4');">
                                        <div class="agreeTablink detail_agree_box">환불/변경</div>
                                    </a>
                                </div>
                            </div>

                            <div id="rule1" class="w3-container agreeMenu w3-padding-48 w3-card">
                                <b><span class="detail_boldb"> ▶발권 수수료</span> </b>
                                <br>님부스 통해 항공권을 결제할 때에는 항공료와 별도로 성인/소아 승객 수만큼 각각 발권수수료가 발생합니다.
                                <span class="detail_boldr">이 수수료는 항공권을 취소하거나 변경하더라도 환불되지 않으며,</span>
                                천재지변이나 항공사 사정에 의한 스케줄 변경, 취소 시에도 동일 적용됩니다.
                                <br>-<b>일반 항공권</b>: 1인당 10,000원 (성인/소아 동일, 유아 면제)
                                <br>-<b>스페셜 세트 항공권</b>: 각 예약번호 기준 1인당 5,000원 (성인/소아 동일, 유아 면제)
                                <br>※ 스페셜 세트 항공권의 경우 출국편/귀국편 <b>각각의 예약번호가 생성</b>되며, 1인당 총 10,000원의 발권수수료가 발생해요.
                                <br><br>
                                <b><span class="detail_boldb">▶변경/환불 시 발생하는 여행사 취급 수수료 </span></b>
                                <br>님부스를 통해 구매한 항공권을 변경하거나 환불할 때에는 항공사 운임규정과 별도로 각 예약번호마다 여행사의 취급 수수료가 매번
                                발생합니다.
                                <b>이 수수료는 환불되지 않아요.</b>
                                <br>-변경 (일정변경, 탑승객 영문성명 변경): 1인당 30,000원 (성인/소아/유아 동일)
                                <br>-환불: 1인당 30,000원 (성인/소아) | 1인당 10,000원 (유아)
                                <br><br>
                                <b> <span class="detail_boldb">▶운임규정 </span> </b>
                                <br>결제 전에 반드시 항공사 운임규정을 확인해 주세요. 규정 확인이 어려운 경우 고객지원실을 통해 문의해 주세요.
                                <br><br>
                                <b> <span class="detail_boldb">▶ 환승(경유)</span> </b>
                                <br>환승(경유) 시 출발/도착 공항이 다를 수 있으며, 이 경우 비자나 출입국 지침 등의 이유로 이용이 어려울 수 있어요.
                                반드시 항공사와 해당 국가 대사관을 통해 환승 가능여부를 확인해주세요.
                                <br><br>
                                <b> <span class="detail_boldb">▶항공권의 변경과 환불</span></b>
                                <br>님부스에서 구매한 항공권은 님부스에서만 변경 또는 환불이 가능하며,
                                직접 항공사에 요청하여 발생하는 문제는 여행사에서 처리가 불가해요.
                                <br><br>
                                <b> <span class="detail_boldb">▶탑승객 영문성명</span> </b>
                                <br>-국제선 항공권은 여권 상의 영문 성과 이름, 성별이 다를 경우에는 탑승이 거절됩니다.
                                <br>-예약이 완료되면 탑승객 정보 변경이 불가해요.
                                예약 완료 전 반드시 입력한 정보가 여권 상 정보와 동일한지 꼭 확인해주세요.
                                <br>-동일 발음에 한하여 영문 성명 변경을 허용하는 항공사의 경우, 항공사 변경수수료와 여행사 변경수수료가 발생해요.
                                <br>-항공권은 양도가 불가능해요.
                                <br><br>
                                <b> <span class="detail_boldb">▶사전좌석지정 </span> </b>
                                <br>-님부스에서 구매한 항공권은 사전에 바로 좌석 지정이 되지 않아요.
                                <br>-탑승 전 사전 좌석지정을 희망하실 경우 항공사 홈페이지 내 예약조회를 통해 부가서비스를 구매하세요.
                                단, 구매한 항공권의 규정에 따라 사전 좌석지정이 불가능할 수 있어요.
                                <br>-사전 좌석지정이 불가능한 항공권은 탑승수속 시 좌석을 지정할 수 있어요. (항공사 웹 체크인, 공항 수속 카운터 등)
                                <br><br>
                                <b> <span class="detail_boldb">▶기타 서비스 </span> </b>
                                <br>아기바구니, 휠체어, 항공사 마일리지 적립, 경유지 호텔, 투어서비스 등 항공사에서 제공하는 서비스는 항공사 홈페이지나 고객센터를
                                통해 신청해주세요.
                                항공사 제공 서비스는 님부스에서 확정해드리기 어려워요.
                                <br>
                                <span class="detail_boldr">
                                신청 불가 서비스 : 동방항공-큐브시티/밀쿠폰, 케냐항공-호텔 서비스, 베트남항공-경유지 투어, 진에어-번들 서비스 등
                            </span>
                                <br><br>
                                <b> <span class="detail_boldb">▶어린이의 여행 </span> </b>
                                <br>-혼자 여행하는 만 12세 ~ 만 18세의 미성년자의 여행은 예약 후 탑승할 항공사에 별도의 유료 서비스(UM)를 신청해야 해요.
                                <br>-항공사마다 정책이 달라
                                <b>
                            <span class="detail_boldr">
                                어린이와 미성년자의 혼자 여행은 불가능할 수 있으며, 도착 국가에서 입국이 거절될 수도 있어요.
                            </span>
                                </b>
                                필요하신 경우 사전에 항공사와 도착 국가의 대사관에 가능 여부를 꼭 확인하세요.
                                <br><br>
                                <b> <span class="detail_boldb">▶수하물 </span> </b>
                                <br>-예약상세 페이지에서 구매한 항공권에 포함된 무료 위탁수하물을 확인할 수 있어요.
                                <br>-수하물의 크기와 무게 등 자세한 규격은 항공사 홈페이지에서 확인해 주세요.
                                <br>-수하물이 추가로 필요할 경우 항공사 홈페이지를 통해 신청할 수 있어요.
                                <br><br>
                                <b> <span class="detail_boldb">▶예약변경 </span> </b>
                                <br>-항공권 예약 및 발권 후 스케줄을 변경하고자 할 경우, 운임규정에 따라 예약 변경이 불가능하거나,
                                가능하더라도 추가 요금과 항공사 변경 수수료가 발생할 수 있어요.
                                <br>-예약 변경이 불가능한 경우 환불 후 원하는 일정으로 재구매해야 합니다. 이 때 운임규정 내 환불 수수료가 적용됩니다.
                                <br>-항공권 예약 변경을 희망하는 경우, 예약상세 페이지 내 “여행 일정 변경”을 통해 영업시간 내에 요청해 주세요.
                                (평일 9:00 ~ 17:00 내 접수 가능) 만약 출발일까지 2일 이내로 남았다면 1:1 채팅상담을 통해 문의해 주세요.
                                <br><br>
                                <b> <span class="detail_boldb">▶항공사/공항 사정에 의한 운항 정보 변동</span> </b>
                                <br>-항공사나 공항 사정에 의하여 발권 이후에 운항 정보가 변경될 수 있어요. (출발시간, 도착시간, 터미널, 편명 등)
                                <br>-운항정보가 변경될 경우 변경일로부터 영업일 기준 5일 이내 등록된 예약자의 휴대폰번호로 알림이 전송됩니다.
                                <br>-스케줄이 변경되면 변경된 정보대로 이용하거나, 다른 스케줄로 변경 또는 환불할 수 있어요.
                                항공사의 지침에 따라 변경/환불 수수료가 면제될 수 있으나, 면제 규정에 해당하지 않을 경우 정상적인 변경/환불 규정이 적용됩니다.
                                <br><br>
                                <b> <span class="detail_boldb">▶예약재확인 </span> </b>
                                <br>국제선 항공권은 항공사와 공항의 사정에 의해 사전 통보 없이 자주 변동되거나 취소될 수 있어요. 반드시 출국/귀국 72시간 전에
                                예약을 재확인하여 변동사항이 없는지 확인해 주세요.
                                <br><br>
                                <b> <span class="detail_boldb">▶미확정 운임 </span> </b>
                                <br>-미확정 요금이란 항공권의 구매 금액이나 좌석이 확정되지 않아 항공사의 운임규정을 재확인해야 하는 예약이에요.
                                <br>-예약완료 기준 48시간 이내 확인 후 알림톡/SMS로 안내드리며, 금액이 확정된 예약에 대해서만 결제 및 발권이 가능해요.
                                <br>-결제시한 전까지 좌석과 요금이 확정되지 않는다면 안내 후 취소됩니다.
                                <br><br>
                                <b> <span class="detail_boldb">▶여권 및 비자 </span> </b>
                                <br>-여권의 유효기간이 6개월 미만인 경우 출국과 입국이 제한될 수 있어요.
                                <br>-경유지를 포함하여 여행하는 나라의 대사관/영사관/출입국사무소 등을 통해 비자 유무 등 출입국 요건을 미리 확인해주세요.
                                <br>-출입국 요건 불충분으로 출국 불가, 입국 거부등으로 발생하는 비용과 불이익에 대해서는 님부스에서는 책임지지 않습니다.
                                <br><br>
                                <b> <span class="detail_boldb">▶중복예약 </span> </b>
                                <br>같은 항공사로 같은 일정을 예약할 경우 중복예약으로 간주되어 항공사에서 별도의 사전 연락 없이 임의로 취소할 수 있으며, 이로
                                인한 불이익이 발생할 경우 님부스에서는 책임지지 않습니다.
                                <br><br>
                                <b> <span class="detail_boldb">▶마일리지이용/적립 </span> </b>
                                <br>-항공권 구매 시 마일리지를 이용하고자 할 경우, 항공사에 문의해 주세요.
                                <br>-마일리지를 통한 좌석 승급을 원하실 경우, 고객지원실로 문의해 주세요.
                                <br>-마일리지 적립은 예약상세 페이지 내 “마일리지 등록” 버튼을 통하여 입력하거나, 항공사 홈페이지 및 탑승수속 시 항공사에
                                요청할 수 있어요.
                                <br>-마일리지 적립률 또는 적립 가능여부는 항공사를 통해 확인해 주세요.
                                <br><br>
                                <b> <span class="detail_boldb">▶결제시한 </span> </b>
                                <br>예약 완료 후 항공권 예약내역 &gt; 예약상세의 결제 시한을 확인 바랍니다.
                                당사의 결제시한은 항공사 결제시한과 상이할 수 있으며 (항공사 결제시한보다 우선함) , 사전 통보 없이 변경될 수 있습니다.
                                <br><br>
                                <b> <span class="detail_boldb">▶공동운항편 이용 시의 서비스 제한 </span> </b>
                                <br>공동운항 편 이용 시, 영문변경, 좌석지정, 마일리지 적립, 웹 체크인 등 서비스가 제한될 수 있어요.
                                <br><br>
                                <b> <span class="detail_boldb">▶님부스 고객지원실</span> </b>
                                <br>항공권 문의 전화번호 <b><h3>1670-8208</h3> (내선 1번) </b>
                                <br>09:00 ~ 18:00 (연중무휴), 점심시간 12:00 ~ 13:00
                                <br> <span
                                    class="detail_boldr">※단, 발권 및 환불/변경은 (월 - 금) 09:00 ~ 17:00까지 접수 가능합니다.</span>
                            </div>

                            <div id="rule2" class="w3-container agreeMenu w3-padding-48 w3-card">
                                <div id="fareruleinfotab" class="k1_agreebox">
                                    <div xmlns="http://www.w3.org/1999/xhtml"
                                         class="k1_option_box1 k1_mb10 detail_baggage">
                                        <dl>
                                            <dd>
                                                전체 여정에
                                                <span class="k1_cpoint3">상이한 운임과 규정</span>
                                                이 적용되었으며, 운임에 따라 가장 제한적인 규정이 적용되거나, 전체 규정이 모두 합산되어 적용될 수 있으므로,
                                                상세 운임규정은 여행사
                                                <span class="k1_cpoint3">예약 담당자를 통해서 재확인</span>
                                                하시기 바랍니다.
                                            </dd>
                                            <dd>아래 운임규정은 1인 기준으로 적용되는 규정입니다.</dd>
                                        </dl>
                                    </div>
                                    <p xmlns="http://www.w3.org/1999/xhtml" class="k1_tit_dot1 k1_mb5">첫번째 운임규정
                                    </p>
                                    <table xmlns="http://www.w3.org/1999/xhtml" class="k1_tbl k1_tbl_form"
                                           style="margin-top: -1px;">
                                        <colgroup>
                                            <col style="width:30%;">
                                            <col style="width:85%;">
                                        </colgroup>
                                        <tbody class="tal">
                                        <input type="hidden" name="contents" class="cont" id="tempcontents_1"
                                               value="서울-동경">
                                        <tr>
                                            <th scope="row">적용구간</th>
                                            <td class="last" id="contents_1">서울-동경<br>
                                                <a href="#" style="color:#235ba5;"
                                                   onclick="airfn_displayoriginrule(this); return false;">[원문규정]
                                                </a>
                                                <div style="display:none">SEL-TYO</div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_8" value="2023.03.26 이후 출발 조건<BR>">
                                        <tr>
                                            <th scope="row">여행가능일</th>
                                            <td class="last" id="contents_8">2023.03.26 이후 출발 조건
                                                <br> <br>
                                                <a href="#" style="color:#235ba5;"
                                                   onclick="airfn_displayoriginrule(this); return false;">[원문규정]
                                                </a>
                                                <div style="display:none">BASE FARE
                                                    <br> <br> VALID FOR TRAVEL COMMENCING ON/AFTER 26MAR 23.
                                                </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_10" value="출발 후 12개월<BR> ">
                                        <tr>
                                            <th scope="row">최대체류일</th>
                                            <td class="last" id="contents_10">출발 후 12개월
                                                <br> <br>
                                                <a href="#" style="color:#235ba5;"
                                                   onclick="airfn_displayoriginrule(this); return false;">[원문규정]
                                                </a>
                                                <div style="display:none">BASE FARE
                                                    <br>FOR ROUND TRIP FARES
                                                    <br> <br> TRAVEL FROM LAST STOPOVER MUST COMMENCE NO LATER THAN
                                                    12
                                                    <br> MONTHS AFTER DEPARTURE FROM FARE ORIGIN.
                                                </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont" id="tempContents_11"
                                               value="- 성인 동반 만 2세 - 만 11세 소아 : 성인 요금의 100%<BR>&amp;nbsp;&amp;nbsp;(전구간 만 18세 이상 성인 동반조건)
                                           <br>- 첫번째 만 2세 미만 유아(좌석 미점유) : 성인 요금의 10%
                                           <BR>- 만 2세 미만 유아(좌석 점유 시) : 성인 요금의 100%
                                           <BR> <BR><BR>※ 상기 모든 수수료는 1인/1회 기준 금액 입니다.
                                           <BR>※ 항공사 및 운항 항공편에 따라 소아, 유아 나이의 적용 기준이 달라질 수 있습니다.
                                           <BR>※ 출발 당시 소아 운임 적용 가능하더라도 여행 도중 만 12세 이상이 되는 경우,
                                           유아 운임 적용 가능하더라도 여행 도중 24개월 이상이 되는 경우, 소아, 유아 운임 적용 불가할 수 있으며
                                           소아,유아 항공권을 소지하더라도 운항 항공편에 따라 탑승이 거절되거나
                                           추가 비용 발생 등 항공권 사용에 문제가 될 수 있으니 구매 전 반드시 확인하시기 바랍니다.">
                                        <tr>
                                            <th scope="row">유/소아요금</th>
                                            <td class="last" id="contents_11">
                                                - 성인 동반 만 2세 - 만 11세 소아 : 성인 요금의 100%
                                                <br>&nbsp;&nbsp;(전구간 만 18세 이상 성인 동반조건)
                                                <br>- 첫번째 만 2세 미만 유아(좌석 미점유) : 성인 요금의 10%
                                                <br>- 만 2세 미만 유아(좌석 점유 시) : 성인 요금의 100%
                                                <br> <br><br>※ 상기 모든 수수료는 1인/1회 기준 금액 입니다.
                                                <br>※ 항공사 및 운항 항공편에 따라 소아, 유아 나이의 적용 기준이 달라질 수 있습니다.
                                                <br>※ 출발 당시 소아 운임 적용 가능하더라도 여행 도중 만 12세 이상이 되는 경우,
                                                유아 운임 적용 가능하더라도 여행 도중 24개월 이상이 되는 경우, 소아, 유아 운임 적용 불가할 수 있으며
                                                소아,유아 항공권을 소지하더라도 운항 항공편에 따라 탑승이 거절되거나
                                                추가 비용 발생 등 항공권 사용에 문제가 될 수 있으니 구매 전 반드시 확인하시기 바랍니다.
                                                <br>
                                                <a href="#" style="color:#235ba5;"
                                                   onclick="airfn_displayoriginrule(this); return false;">[원문규정]
                                                </a>
                                                <div style="display:none">
                                                    CD.CHILD DISCOUNTS
                                                    <br>FARE BY RULE
                                                    <br> <br> ACCOMPANIED CHILD 2-11 - CHARGE 100 PERCENT OF THE
                                                    FARE.
                                                    <br> TICKET DESIGNATOR - CH AND PERCENT OF DISCOUNT.
                                                    <br> MUST BE ACCOMPANIED ON ALL FLIGHTS IN SAME COMPARTMENT
                                                    <br> BY ADULT 18 OR OLDER.
                                                    <br> NOTE -
                                                    <br> FOR UNACCOMPANIED MINORS SERVICE
                                                    <br> PLEASE SEE WWW.JINAIR.COM
                                                    <br> OR - 1ST INFANT UNDER 2 WITHOUT A SEAT - CHARGE 10 PERCENT
                                                    <br> OF THE FARE.
                                                    <br> TICKET DESIGNATOR - IN AND PERCENT OF DISCOUNT
                                                    <br> OR - INFANT UNDER 2 WITH A SEAT - CHARGE 100 PERCENT OF
                                                    <br> THE FARE.<br> TICKET DESIGNATOR - CH AND PERCENT OF
                                                    DISCOUNT.
                                                </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont" id="tempContents_13"
                                               value="&amp;nbsp;- 전구간 확약 조건
                                           <BR>&amp;nbsp;- 대기 예약 불가
                                           <BR> <BR><BR>※ 사전발권 조건과 자동생성되는 시스템 발권 시한 중 가장 제한적인 조건으로 적용됩니다.
                                           <BR>※ 예약일 기준으로 항공사에서 자동으로 발권시한이 생성되므로 좌석이 확약이더라도
                                           상황에 따라 예약과 동시에 구매하지 않으면 예약이 취소될 수 있습니다.">
                                        <tr>
                                            <th scope="row">사전발권</th>
                                            <td class="last" id="contents_13">&nbsp;- 전구간 확약 조건<br>&nbsp;-
                                                대기 예약 불가
                                                <br> <br><br>※ 사전발권 조건과 자동생성되는 시스템 발권 시한 중 가장 제한적인 조건으로 적용됩니다.
                                                <br>※ 예약일 기준으로 항공사에서 자동으로 발권시한이 생성되므로 좌석이 확약이더라도
                                                상황에 따라 예약과 동시에 구매하지 않으면 예약이 취소될 수 있습니다.
                                                <br>
                                                <a href="#" style="color:#235ba5;"
                                                   onclick="airfn_displayoriginrule(this); return false;">[원문규정]
                                                </a>
                                                <div style="display:none">BASE FARE
                                                    <br> <br> RESERVATIONS ARE REQUIRED FOR ALL SECTORS.
                                                    <br> WAITLIST NOT PERMITTED.
                                                    <br> NOTE -
                                                    <br> ALL SECTORS MUST BE CONFIRMED
                                                </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont" id="tempContents_14"
                                               value="2023.02.06 이후에 발권해야 함<BR> <BR><BR>판매기간 : 2022.08.15~2022.08.18 까지 예약 및 발권 완료 조건">
                                        <tr>
                                            <th scope="row">판매제한</th>
                                            <td class="last" id="contents_14">
                                                2023.02.06 이후에 발권해야 함
                                                <br> <br><br>판매기간 : 2022.08.15~2022.08.18 까지 예약 및 발권 완료 조건
                                                <br>
                                                <a href="#" style="color:#235ba5;"
                                                   onclick="airfn_displayoriginrule(this); return false;">[원문규정]
                                                </a>
                                                <div style="display:none">
                                                    BASE FARE
                                                    <br> <br> TICKETS MUST BE ISSUED ON/AFTER 06FEB 23.
                                                </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont" id="tempContents_15"
                                               value="
                                           <BR>[예약 변경]<BR>&amp;nbsp;- 수수료: <FONT COLOR=BLUE>구간 당 60,000 원</FONT>
                                           <BR><br>[환불]<BR>&amp;nbsp;- 취소/환불 수수료:<FONT COLOR=BLUE>100,000 원</FONT>(구간 당)
                                           <BR>&amp;nbsp;* 출발전 취소 시점별 환불 수수료 *
                                           <BR>&amp;nbsp;&amp;nbsp;&amp;nbsp;- 출발전 7일 이내: <FONT COLOR=BLUE>100,000 원</FONT>
                                           <BR>&amp;nbsp;&amp;nbsp;&amp;nbsp;- 출발 30일-8일 전: <FONT COLOR=BLUE>80,000 원</FONT>
                                           <BR>&amp;nbsp;&amp;nbsp;&amp;nbsp;- 구매이후~ 출발전 31일: <FONT COLOR=BLUE>60,000 원</FONT>
                                           <BR>&amp;nbsp;- 출발후 예약 취소/환불 수수료: <FONT COLOR=BLUE>구간 당 80,000 원</FONT>
                                           <BR><BR>[예약 변경/환불]
                                           <BR>&amp;nbsp;- NO SHOW 후 예약 변경/취소 수수료: <FONT COLOR=BLUE>120,000 원</FONT>(구간 당)
                                           <BR> <BR><BR>[수수료 적용 기준]
                                           <BR>- 모든 수수료는 전체 여정기준이 아닌 <font color=blue>탑승구간 별로 합산하여 징수</font>
                                           <BR>- 시점별 수수료는 각 여정의 출발일을 기준으로 환불시점과 비교하여 적용
                                           <BR>- 이름 변경(SPELL CHANGE) 및 예약 변경은 항공사에서 처리 불가하오니, 발권하신 대리점에 문의하시기 바랍니다.
                                           <BR><BR>[예약변경]
                                           <BR>- 운임규정 상 변경이 허용되는 경우에 한해 동일 또는 상위 단계 운임으로만 변경가능하며,
                                           변경일 기준 운임 재계산으로 변경수수료 이외에 운임차액 및 TAX 가 추가될 수 있습니다.
                                           <BR>- 전체 미사용 항공권의 출발편 변경 유효기간은 항공사 규정 및 운임에 따라 상이하므로 문의바랍니다.
                                           <BR><BR>[환불]<BR>- 항공권 유효기간 만료 후 최대 30일 이내 가능
                                           <BR>- 출발이 임박하여 환불/변경이 있는 경우 바로 환불 접수가 불가할 수 있으며
                                           노쇼,환불,변경 수수료 등 추가 금액이 발생할 수 있으니 영업일기준 최소 3일전(주말,공휴일제외)까지는 접수 바랍니다.
                                           <BR>- 사용구간 편도 운임 및 환불수수료 공제 후 환불금이 발생되지 않을 수 있습니다.
                                           <BR>- 상기 환불규정은 항공운임에 적용되는 내용이며, 유류할증료 및 TAX(제세공과금)의 환불규정은
                                           각 정부지침 및 항공사규정에 따라 상이하므로 문의바랍니다.
                                           <BR><BR>[NO-SHOW]
                                           <BR>- 수속마감(출발 50분전)까지 예약취소/변경 없이 탑승하지 않거나, 탑승 수속 후 탑승하지 않는 경우
                                           <BR>- 여행사 영업시간 이외 요청 시 접수가 불가하여 수수료 징수 될수 있으니 영업시간 내 접수 바랍니다.
                                           <BR>- NO SHOW 후 환불/변경 시 수수료 중복 징수
                                           <BR>- 변경 수수료 + NO SHOW 수수료
                                           <BR>- 환불 수수료 + NO SHOW 수수료
                                           <BR>- 항공사에서 NO-SHOW 발생 이후 잔여여정을 취소할 수 있습니다.">
                                        <tr>
                                            <th scope="row">변경/환불</th>
                                            <td class="last" id="contents_15">
                                                <br>[예약 변경]
                                                <br>&nbsp;- 수수료: <span class="detail_boldb">구간 당 60,000 원</span>
                                                <br><br>[환불]
                                                <br>&nbsp;- 취소/환불 수수료:<span class="detail_boldb"> 100,000 원 </span>(구간
                                                당)
                                                <br>&nbsp;* 출발전 취소 시점별 환불 수수료 *
                                                <br>&nbsp;&nbsp;&nbsp;- 출발전 7일 이내:
                                                <span class="detail_boldb"> 100,000 원</span>
                                                <br>&nbsp;&nbsp;&nbsp;- 출발 30일-8일 전:
                                                <span class="detail_boldb"> 80,000 원</span>
                                                <br>&nbsp;&nbsp;&nbsp;- 구매이후~ 출발전 31일:
                                                <span class="detail_boldb"> 60,000 원</span>
                                                <br>&nbsp;- 출발후 예약 취소/환불 수수료:
                                                <span class="detail_boldb">구간 당 80,000 원</span>
                                                <br><br>[예약 변경/환불]
                                                <br>&nbsp;- NO SHOW 후 예약 변경/취소 수수료:
                                                <span class="detail_boldb"> 120,000 원</span>(구간 당)
                                                <br> <br><br>[수수료 적용 기준]
                                                <br>- 모든 수수료는 전체 여정기준이 아닌 <span
                                                    class="detail_boldb">탑승구간 별로 합산하여 징수</span>
                                                <br>- 시점별 수수료는 각 여정의 출발일을 기준으로 환불시점과 비교하여 적용
                                                <br>- 이름 변경(SPELL CHANGE) 및 예약 변경은 항공사에서 처리 불가하오니, 발권하신 대리점에 문의하시기
                                                바랍니다.
                                                <br><br>[예약변경]
                                                <br>- 운임규정 상 변경이 허용되는 경우에 한해 동일 또는 상위 단계 운임으로만
                                                변경가능하며, 변경일 기준 운임 재계산으로 변경수수료 이외에 운임차액 및 TAX 가 추가될 수 있습니다.
                                                <br>- 전체 미사용 항공권의 출발편 변경 유효기간은 항공사 규정 및 운임에 따라 상이하므로 문의바랍니다.
                                                <br><br>[환불]
                                                <br>- 항공권 유효기간 만료 후 최대 30일 이내 가능
                                                <br>- 출발이 임박하여 환불/변경이 있는 경우 바로 환불 접수가 불가할 수 있으며 노쇼,환불,변경 수수료 등 추가
                                                금액이 발생할 수 있으니 영업일기준 최소 3일전(주말,공휴일제외)까지는 접수 바랍니다.
                                                <br>- 사용구간 편도 운임 및 환불수수료 공제 후 환불금이 발생되지 않을 수 있습니다.
                                                <br>- 상기 환불규정은 항공운임에 적용되는 내용이며, 유류할증료 및 TAX(제세공과금)의
                                                환불규정은 각 정부지침 및 항공사규정에 따라 상이하므로 문의바랍니다.
                                                <br><br>[NO-SHOW]
                                                <br>- 수속마감(출발 50분전)까지 예약취소/변경 없이 탑승하지 않거나, 탑승 수속 후 탑승하지 않는 경우
                                                <br>- 여행사 영업시간 이외 요청 시 접수가 불가하여 수수료 징수 될수 있으니 영업시간 내 접수 바랍니다.
                                                <br>- NO SHOW 후 환불/변경 시 수수료 중복 징수
                                                <br>- 변경 수수료 + NO SHOW 수수료
                                                <br>- 환불 수수료 + NO SHOW 수수료
                                                <br>- 항공사에서 NO-SHOW 발생 이후 잔여여정을 취소할 수 있습니다.
                                                <br>
                                                <a href="#" style="color:#235ba5;"
                                                   onclick="airfn_displayoriginrule(this); return false;">[원문규정]
                                                </a>
                                                <div style="display:none">BASE FARE<br> <br> CHANGES<br>
                                                    <br> PER COUPON
                                                    CHARGE KRW 60000 FOR REISSUE/REVALIDATION.<br> WAIVED
                                                    FOR DEATH OF
                                                    PASSENGER OR FAMILY MEMBER.<br> NOTE -<br> 1/ FEE DOES
                                                    NOT APPLY FOR
                                                    INFANTS NOT<br> OCCUPYING A SEAT<br> 2/ EXTENSION OF
                                                    VALIDITY FOR
                                                    MEDICAL REASONS IS<br> PERMITTED SUBJECT TO SUBMISSION
                                                    OF MEDICAL<br>
                                                    CERTIFICATE WITH DATE SHOWN ON THE DOCUMENT<br> 3/
                                                    CHANGES ARE ONLY
                                                    PERMITTED TO EQUIVALENT OR<br> HIGHER BOOKING CLASS.
                                                    REISSUE TO LOWER
                                                    BOOKING<br> CLASS IS NOT PERMITTED.<br> 4/ WHEN
                                                    REISSUING CALCULATE THE
                                                    FARE DIFFERENCE<br> AS BELOW<br> BEFORE DEPARTURE- APPLY
                                                    CURRENT FARES
                                                    OF NEW<br> ISSUANCE DATE<br> AFTER DEPARTURE- APPLY
                                                    HISTORICAL FARES
                                                    OF<br> ORIGINAL TICKET ISSUANCE DATE<br> 5/ REISSUE
                                                    FEE/REFUND PENALTY
                                                    ARE NON-REFUNDABLE<br> 6/ USE YQ CODE TO IMPOSE CHANGE
                                                    FEE WHEN<br>
                                                    REISSUING TICKET<br> <br> CANCELLATIONS<br> <br> PER
                                                    COUPON CHARGE KRW
                                                    100000 FOR CANCEL/REFUND.<br> WAIVED FOR DEATH OF
                                                    PASSENGER OR FAMILY
                                                    MEMBER.<br> NOTE -<br> ---PENALTY APPLIES PER COUPON<br>
                                                    WITHIN 7DAYS
                                                    BEFORE DEPARTURE KRW 100000<br> 30DAYS - 8DAYS BEFORE
                                                    DEPARTURE KRW
                                                    80000<br> AFTER PURCHASE - 31DAYS BEFORE DEPARTURE KRW
                                                    60000<br>
                                                    ---------------------------------------------<br> 1/
                                                    PENALTY DOES NOT
                                                    APPLY FOR INFANTS NOT<br> OCCUPYING A SEAT<br> 2/
                                                    EXTENSION OF TICKET
                                                    VALIDITY NOT PERMITTED<br> 3/ REISSUE FEE/REFUND PENALTY
                                                    ARE
                                                    NON-REFUNDABLE<br> <br> AFTER DEPARTURE<br> PER COUPON
                                                    CHARGE KRW 80000
                                                    FOR CANCEL/REFUND.<br> <br> CHANGES/CANCELLATIONS<br>
                                                    <br> PER COUPON
                                                    CHARGE KRW 120000 FOR NO-SHOW.<br> WAIVED FOR DEATH OF
                                                    PASSENGER OR
                                                    FAMILY MEMBER.<br> NOTE -<br> 1/ NO-SHOW PENALTY APPLY
                                                    FROM 50MINS
                                                    BEFORE<br> FLIGHT DEPARTURE TIME IF A PASSENGER DOES
                                                    NOT<br>
                                                    CANCEL/CHANGE THE RESERVATION<br> 2/ NO-SHOW PENALTY
                                                    WILL BE APPLIED IN
                                                    ADDITION TO<br> CHANGE FEE/CANCELLATION PENALTY<br> 3/
                                                    PENALTY DOES NOT
                                                    APPLY FOR INFANTS NOT<br> OCCUPYING A SEAT<br> 4/
                                                    COLLECT NO-SHOW
                                                    PENALTY PER COUPON<br> PER CHANGE/REFUND TRANSACTION
                                                </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_17"
                                               value="<B>※ 현재 조회 중인 운임 기준으로 추가요금은 이미 포함되어 있으나,  항공권 구매 조건에 따라 변경이 될 수 있습니다.(변경/환불수수료 별도)</B>">
                                        <tr>
                                            <th scope="row">추가요금</th>
                                            <td class="last" id="contents_17"><b>※ 현재 조회 중인 운임 기준으로 추가요금은 이미
                                                포함되어 있으나, 항공권
                                                구매 조건에 따라 변경이 될 수 있습니다.(변경/환불수수료 별도)</b></td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_18" value="허용 불가<BR> ">
                                        <tr>
                                            <th scope="row">경유지체류</th>
                                            <td class="last" id="contents_18">허용 불가<br> <br><a href="#"
                                                                                               style="color:#235ba5;"
                                                                                               onclick="airfn_displayoriginrule(this); return false;">[원문규정]</a>
                                                <div style="display:none">BASE FARE<br> <br> NO STOPOVERS
                                                    PERMITTED.
                                                </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_20"
                                               value="※ 경유지 당일 연결이 불가한 경우 해당 공항 심야 이용이 불가 할 수 있으므로 반드시 공항 운영 시간 확인 부탁 드립니다.">
                                        <tr>
                                            <th scope="row">환승</th>
                                            <td class="last" id="contents_20">※ 경유지 당일 연결이 불가한 경우 해당 공항 심야
                                                이용이 불가 할 수 있으므로
                                                반드시 공항 운영 시간 확인 부탁 드립니다.
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_21"
                                               value="[아래의 항공편 이용]<BR>&amp;nbsp;- 진에어 항공편<BR> ">
                                        <tr>
                                            <th scope="row">비행편제한</th>
                                            <td class="last" id="contents_21">[아래의 항공편 이용]<br>&nbsp;- 진에어
                                                항공편<br> <br><a href="#" style="color:#235ba5;"
                                                               onclick="airfn_displayoriginrule(this); return false;">[원문규정]</a>
                                                <div style="display:none">BASE FARE<br> <br> THE FARE
                                                    COMPONENT MUST BE
                                                    ON<br> ONE OR MORE OF THE FOLLOWING<br> ANY LJ FLIGHT.
                                                </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_22"
                                               value="사용가능<BR>-탑승자 본인카드로만 결제 가능하며 공항수속시 결제카드를 확인할수 있습니다.(제시 못할경우 탑승이 거부 될수 있음)">
                                        <tr>
                                            <th scope="row">신용카드</th>
                                            <td class="last" id="contents_22">사용가능<br>-탑승자 본인카드로만 결제 가능하며
                                                공항수속시 결제카드를 확인할수
                                                있습니다.(제시 못할경우 탑승이 거부 될수 있음)
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont" id="tempContents_23"
                                               value="※ 무료수하물 및 초과수하물 규정은 좌석등급 및 노선에 따라 상이하므로 자세한 내용은 항공사 홈페이지 <a href=&quot;https://www.jinair.com/ready/baggage&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 또는 여행사 담당자에게 문의 부탁드립니다.<BR>※ 항공사 요금규정에 무료수하물 내용이 누락된 경우 표기되지 않을 수 있으며, 표기되지 않은 경우, 해당항공사에 문의 부탁드립니다.<BR>※ 공동운항편, 타항공사 연결편, 24시간 이상 체류 일정, 해외출발 일정, 특수 수하물의 경우 운항항공사에 따라 수하물 규정이 상이할 수 있습니다.">
                                        <tr>
                                            <th scope="row">수하물</th>
                                            <td class="last" id="contents_23">※ 무료수하물 및 초과수하물 규정은 좌석등급 및 노선에
                                                따라 상이하므로 자세한
                                                내용은 항공사 홈페이지 <a href="https://www.jinair.com/ready/baggage"
                                                                style="color: red" target="_blank">[바로가기]</a> 또는 여행사
                                                담당자에게 문의
                                                부탁드립니다.<br>※ 항공사 요금규정에 무료수하물 내용이 누락된 경우 표기되지 않을 수 있으며, 표기되지
                                                않은 경우, 해당항공사에 문의
                                                부탁드립니다.<br>※ 공동운항편, 타항공사 연결편, 24시간 이상 체류 일정, 해외출발 일정, 특수
                                                수하물의 경우 운항항공사에 따라
                                                수하물 규정이 상이할 수 있습니다.
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont" id="tempContents_24"
                                               value="※ 항공사 마일리지 적립 여부 및 적립률은 운임별/제휴 회원사별로 상이하오니, 자세한 내용은 항공사 홈페이지 <a href=&quot;https://www.jinair.com/benefit/point&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 또는 여행사 담당자에게 구매 전 문의 부탁드립니다.">
                                        <tr>
                                            <th scope="row">항공사마일리지</th>
                                            <td class="last" id="contents_24">※ 항공사 마일리지 적립 여부 및 적립률은 운임별/제휴
                                                회원사별로 상이하오니,
                                                자세한 내용은 항공사 홈페이지 <a
                                                        href="https://www.jinair.com/benefit/point"
                                                        style="color: red" target="_blank">[바로가기]</a> 또는 여행사
                                                담당자에게 구매 전 문의
                                                부탁드립니다.
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_25"
                                               value="※ 항공권 발권 후 고객의 요청에 따른 취소,변경,환불 등의 작업 필요 시, 여행사에서 취급하는 비용이므로 해당 비용에 대한 문의는 여행사로 하시기 바랍니다.<BR>※ 발권 후 이루어지는 취소,변경,환불 등 모든 후속 업무는 여행사가 항공사를 통해 진행하는 추가 업무입니다. 따라서 이에 대한 여행업무 취급 수수료는 항공사 수수료와 별도로 추가 징수되는 사항이니, 신중한 결제 진행 부탁 드립니다.<BR>※ 여행업무 취급수수료는 항공권을 취소/변경/환불하더라도 환불되지 않습니다.">
                                        <tr>
                                            <th scope="row">여행업무취급수수료</th>
                                            <td class="last" id="contents_25">※ 항공권 발권 후 고객의 요청에 따른 취소,변경,환불
                                                등의 작업 필요 시,
                                                여행사에서 취급하는 비용이므로 해당 비용에 대한 문의는 여행사로 하시기 바랍니다.<br>※ 발권 후
                                                이루어지는 취소,변경,환불 등 모든
                                                후속 업무는 여행사가 항공사를 통해 진행하는 추가 업무입니다. 따라서 이에 대한 여행업무 취급 수수료는
                                                항공사 수수료와 별도로 추가
                                                징수되는 사항이니, 신중한 결제 진행 부탁 드립니다.<br>※ 여행업무 취급수수료는 항공권을
                                                취소/변경/환불하더라도 환불되지 않습니다.
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_26"
                                               value="※ 비동반 소아 서비스 미제공<BR>※ 만 5세 이상 소아는 만 13세 이상의 보호자와 동반 필수<BR>※ 만 5세 미만의 소아는 만 18세 이상의 성인과 동반 필수">
                                        <tr>
                                            <th scope="row">비동반 소아 규정</th>
                                            <td class="last" id="contents_26">※ 비동반 소아 서비스 미제공<br>※ 만 5세 이상
                                                소아는 만 13세 이상의
                                                보호자와 동반 필수<br>※ 만 5세 미만의 소아는 만 18세 이상의 성인과 동반 필수
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_27"
                                               value="※ 상기 모든 수수료는 1인/1회 기준 금액 입니다. <BR><B>※ 예약일과 발권일이 상이한 경우 발권일의 환율에 따라 TAX(유류할증료 포함)가 변동될 수 있습니다.</B><BR>※ 항공사의 사정으로 별도의 공지없이 운임 및 규정이 변경되어 운임 차액이 발생하는 경우 운임차액 추가 징수됩니다.<BR>※ 항공권은 반드시 첫번째 여정부터 순서대로 사용하셔야하며, 순서대로 이용하지 않은 항공권은 취소처리될 수 있으며, 환불불가합니다. <BR>※ 동일 혹은 다수의 여행사를 통해 동일항공편을 이중예약하는 경우, 항공사에 의해 예약취소될 수 있으니 유의해 주시기 바랍니다. <BR>※ 자세한 운송약관은 항공사 홈페이지 <a href=&quot;https://images.jinair.com/eForm/%EA%B5%AD%EC%A0%9C%EC%97%AC%EA%B0%9D%EC%9A%B4%EC%86%A1%EC%95%BD%EA%B4%80_KOR.pdf?2021525&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 를 통해 확인 부탁드립니다. ">
                                        <tr>
                                            <th scope="row">항공사 일반규정</th>
                                            <td class="last" id="contents_27">※ 상기 모든 수수료는 1인/1회 기준 금액 입니다.
                                                <br><b>※ 예약일과
                                                    발권일이 상이한 경우 발권일의 환율에 따라 TAX(유류할증료 포함)가 변동될 수
                                                    있습니다.</b><br>※ 항공사의 사정으로
                                                별도의 공지없이 운임 및 규정이 변경되어 운임 차액이 발생하는 경우 운임차액 추가 징수됩니다.<br>※
                                                항공권은 반드시 첫번째 여정부터
                                                순서대로 사용하셔야하며, 순서대로 이용하지 않은 항공권은 취소처리될 수 있으며, 환불불가합니다. <br>※
                                                동일 혹은 다수의 여행사를
                                                통해 동일항공편을 이중예약하는 경우, 항공사에 의해 예약취소될 수 있으니 유의해 주시기 바랍니다. <br>※
                                                자세한 운송약관은 항공사
                                                홈페이지 <a
                                                        href="https://images.jinair.com/eForm/%EA%B5%AD%EC%A0%9C%EC%97%AC%EA%B0%9D%EC%9A%B4%EC%86%A1%EC%95%BD%EA%B4%80_KOR.pdf?2021525"
                                                        style="color: red" target="_blank">[바로가기]</a> 를 통해 확인
                                                부탁드립니다.
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <p xmlns="http://www.w3.org/1999/xhtml" class="k1_tit_dot1 k1_mb5">두번째 운임규정
                                    </p>
                                    <table xmlns="http://www.w3.org/1999/xhtml" class="k1_tbl k1_tbl_form"
                                           style="margin-top: -1px;">
                                        <colgroup>
                                            <col style="width:30%;">
                                            <col style="width:85%;">
                                        </colgroup>
                                        <tbody class="tal">
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_1" value="동경-서울">
                                        <tr>
                                            <th scope="row">적용구간</th>
                                            <td class="last" id="contents_1">동경-서울<br><a href="#"
                                                                                         style="color:#235ba5;"
                                                                                         onclick="airfn_displayoriginrule(this); return false;">[원문규정]</a>
                                                <div style="display:none">TYO-SEL</div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_8" value="2023.03.26 이후 출발 조건<BR> ">
                                        <tr>
                                            <th scope="row">여행가능일</th>
                                            <td class="last" id="contents_8">2023.03.26 이후 출발 조건<br> <br><a
                                                    href="#" style="color:#235ba5;"
                                                    onclick="airfn_displayoriginrule(this); return false;">[원문규정]</a>
                                                <div style="display:none">BASE FARE<br> <br> VALID FOR
                                                    TRAVEL COMMENCING
                                                    ON/AFTER 26MAR 23.
                                                </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_10" value="출발 후 12개월<BR> ">
                                        <tr>
                                            <th scope="row">최대체류일</th>
                                            <td class="last" id="contents_10">출발 후 12개월<br> <br><a href="#"
                                                                                                   style="color:#235ba5;"
                                                                                                   onclick="airfn_displayoriginrule(this); return false;">[원문규정]</a>
                                                <div style="display:none">BASE FARE<br>FOR ROUND TRIP
                                                    FARES<br> <br> TRAVEL
                                                    FROM LAST STOPOVER MUST COMMENCE NO LATER THAN 12<br>
                                                    MONTHS AFTER
                                                    DEPARTURE FROM FARE ORIGIN.
                                                </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_11"
                                               value="- 성인 동반 만 2세 - 만 11세 소아 : 성인 요금의 85%<BR>&amp;nbsp;&amp;nbsp;(전구간 만 18세 이상 성인 동반조건)<br>- 첫번째 만 2세 미만 유아(좌석 미점유) : 성인 요금의 10%<BR>- 만 2세 미만 유아(좌석 점유 시) : 성인 요금의 85%<BR> <BR><BR>※ 상기 모든 수수료는 1인/1회 기준 금액 입니다. <BR>※ 항공사 및 운항 항공편에 따라 소아, 유아 나이의 적용 기준이 달라질 수 있습니다.<BR>※ 출발 당시 소아 운임 적용 가능하더라도 여행 도중 만 12세 이상이 되는 경우, 유아 운임 적용 가능하더라도 여행 도중 24개월 이상이 되는 경우, 소아, 유아 운임 적용 불가할 수 있으며 소아,유아 항공권을 소지하더라도 운항 항공편에 따라 탑승이 거절되거나 추가 비용 발생 등 항공권 사용에 문제가 될 수 있으니 구매 전 반드시 확인하시기 바랍니다.">
                                        <tr>
                                            <th scope="row">유/소아요금</th>
                                            <td class="last" id="contents_11">- 성인 동반 만 2세 - 만 11세 소아 : 성인
                                                요금의
                                                85%<br>&nbsp;&nbsp;(전구간 만 18세 이상 성인 동반조건)<br>- 첫번째 만 2세 미만
                                                유아(좌석 미점유) : 성인
                                                요금의 10%<br>- 만 2세 미만 유아(좌석 점유 시) : 성인 요금의 85%<br> <br><br>※
                                                상기 모든 수수료는 1인/1회
                                                기준 금액 입니다. <br>※ 항공사 및 운항 항공편에 따라 소아, 유아 나이의 적용 기준이 달라질 수
                                                있습니다.<br>※ 출발 당시
                                                소아 운임 적용 가능하더라도 여행 도중 만 12세 이상이 되는 경우, 유아 운임 적용 가능하더라도 여행 도중
                                                24개월 이상이 되는 경우,
                                                소아, 유아 운임 적용 불가할 수 있으며 소아,유아 항공권을 소지하더라도 운항 항공편에 따라 탑승이
                                                거절되거나 추가 비용 발생 등 항공권
                                                사용에 문제가 될 수 있으니 구매 전 반드시 확인하시기 바랍니다.<br><a href="#"
                                                                                           style="color:#235ba5;"
                                                                                           onclick="airfn_displayoriginrule(this); return false;">[원문규정]</a>
                                                <div style="display:none">CD.CHILD DISCOUNTS<br>FARE BY
                                                    RULE<br>FOR 2ND
                                                    LEVEL ECONOMY RESTRICTED FARES<br> <br> ACCOMPANIED
                                                    CHILD 2-11 - CHARGE
                                                    85 PERCENT OF THE FARE.<br> TICKET DESIGNATOR - CH AND
                                                    PERCENT OF
                                                    DISCOUNT.<br> MUST BE ACCOMPANIED ON ALL FLIGHTS IN SAME
                                                    COMPARTMENT<br>
                                                    BY ADULT 18 OR OLDER.<br> NOTE -<br> FOR UNACCOMPANIED
                                                    MINORS
                                                    SERVICE<br> PLEASE SEE WWW.JINAIR.COM<br> OR - 1ST
                                                    INFANT UNDER 2
                                                    WITHOUT A SEAT - CHARGE 10 PERCENT<br> OF THE FARE.<br>
                                                    TICKET
                                                    DESIGNATOR - IN AND PERCENT OF DISCOUNT<br> OR - INFANT
                                                    UNDER 2 WITH A
                                                    SEAT - CHARGE 85 PERCENT OF THE<br> FARE.<br> TICKET
                                                    DESIGNATOR - CH AND
                                                    PERCENT OF DISCOUNT.
                                                </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_13"
                                               value="&amp;nbsp;- 전구간 확약 조건<BR>&amp;nbsp;- 대기 예약 불가<BR> <BR><BR>※ 사전발권 조건과 자동생성되는 시스템 발권 시한 중 가장 제한적인 조건으로 적용됩니다.<BR>※ 예약일 기준으로 항공사에서 자동으로 발권시한이 생성되므로 좌석이 확약이더라도 상황에 따라 예약과 동시에 구매하지 않으면 예약이 취소될 수 있습니다. ">
                                        <tr>
                                            <th scope="row">사전발권</th>
                                            <td class="last" id="contents_13">&nbsp;- 전구간 확약 조건<br>&nbsp;-
                                                대기 예약 불가<br>
                                                <br><br>※ 사전발권 조건과 자동생성되는 시스템 발권 시한 중 가장 제한적인 조건으로
                                                적용됩니다.<br>※ 예약일 기준으로
                                                항공사에서 자동으로 발권시한이 생성되므로 좌석이 확약이더라도 상황에 따라 예약과 동시에 구매하지 않으면
                                                예약이 취소될 수 있습니다.
                                                <br><a href="#" style="color:#235ba5;"
                                                       onclick="airfn_displayoriginrule(this); return false;">[원문규정]</a>
                                                <div style="display:none">BASE FARE<br> <br> RESERVATIONS
                                                    ARE REQUIRED FOR
                                                    ALL SECTORS.<br> WAITLIST NOT PERMITTED.<br> NOTE -<br>
                                                    ALL SECTORS MUST
                                                    BE CONFIRMED
                                                </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_14"
                                               value="2023.02.06 이후에 발권해야 함<BR> <BR><BR>판매기간 : 2022.08.15~2022.08.18 까지 예약 및 발권 완료 조건">
                                        <tr>
                                            <th scope="row">판매제한</th>
                                            <td class="last" id="contents_14">2023.02.06 이후에 발권해야 함<br>
                                                <br><br>판매기간 :
                                                2022.08.15~2022.08.18 까지 예약 및 발권 완료 조건<br><a href="#"
                                                                                             style="color:#235ba5;"
                                                                                             onclick="airfn_displayoriginrule(this); return false;">[원문규정]</a>
                                                <div style="display:none">BASE FARE<br> <br> TICKETS MUST BE
                                                    ISSUED ON/AFTER
                                                    06FEB 23.
                                                </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_15"
                                               value="<BR>[예약변경]<BR>&amp;nbsp;- 수수료: <FONT COLOR=BLUE>구간 당 40,000 원</FONT>(재발행)<BR><br>[환불]<BR>&amp;nbsp;- 취소/환불 수수료:<FONT COLOR=BLUE>80,000 원</FONT>(구간 당)<BR>&amp;nbsp;* 출발전 취소 시점별 환불 수수료 *<BR>&amp;nbsp;&amp;nbsp;&amp;nbsp;- 출발전 7일 이내: <FONT COLOR=BLUE>80,000 원</FONT><BR>&amp;nbsp;&amp;nbsp;&amp;nbsp;- 출발 30일-8일 전: <FONT COLOR=BLUE>60,000 원</FONT><BR>&amp;nbsp;&amp;nbsp;&amp;nbsp;- 출발 60일-31일 전: <FONT COLOR=BLUE>40,000 원</FONT><BR>&amp;nbsp;&amp;nbsp;&amp;nbsp;- 출발 90일-61일 전: <FONT COLOR=BLUE>20,000 원</FONT><BR><BR>[환불]<BR>&amp;nbsp;- 출발후 예약 취소/환불 수수료: <FONT COLOR=BLUE>구간 당 60,000 원</FONT><BR><BR>[예약 변경/환불]<BR>&amp;nbsp;- NO SHOW 후 예약 변경/취소 수수료: <FONT COLOR=BLUE>120,000 원</FONT>(구간 당)<BR> <BR><BR>[수수료 적용 기준] <BR>- 모든 수수료는 전체 여정기준이 아닌 <font color=blue>탑승구간 별로 합산하여 징수</font><BR>- 시점별 수수료는 각 여정의 출발일을 기준으로 환불시점과 비교하여 적용<BR>- 이름 변경(SPELL CHANGE) 및 예약 변경은 항공사에서 처리 불가하오니, 발권하신 대리점에 문의하시기 바랍니다.<BR><BR>[예약변경]<BR>- 운임규정 상 변경이 허용되는 경우에 한해 동일 또는 상위 단계 운임으로만 변경가능하며, 변경일 기준 운임 재계산으로 변경수수료 이외에 운임차액 및 TAX 가 추가될 수 있습니다.<BR>- 전체 미사용 항공권의 출발편 변경 유효기간은 항공사 규정 및 운임에 따라 상이하므로 문의바랍니다.<BR><BR>[환불]<BR>- 항공권 유효기간 만료 후 최대 30일 이내 가능<BR>- 출발이 임박하여 환불/변경이 있는 경우 바로 환불 접수가 불가할 수 있으며 노쇼,환불,변경 수수료 등 추가 금액이 발생할 수 있으니 영업일기준 최소 3일전(주말,공휴일제외)까지는 접수 바랍니다.<BR>- 사용구간 편도 운임 및 환불수수료 공제 후 환불금이 발생되지 않을 수 있습니다.<BR>- 상기 환불규정은 항공운임에 적용되는 내용이며, 유류할증료 및 TAX(제세공과금)의 환불규정은 각 정부지침 및 항공사규정에 따라 상이하므로 문의바랍니다.<BR><BR>[NO-SHOW]<BR>- 수속마감(출발 50분전)까지 예약취소/변경 없이 탑승하지 않거나, 탑승 수속 후 탑승하지 않는 경우<BR>- 여행사 영업시간 이외 요청 시 접수가 불가하여 수수료 징수 될수 있으니 영업시간 내 접수 바랍니다.<BR>- NO SHOW 후 환불/변경 시 수수료 중복 징수 <BR>- 변경 수수료 + NO SHOW 수수료 <BR>- 환불 수수료 + NO SHOW 수수료<BR>- 항공사에서 NO-SHOW 발생 이후 잔여여정을 취소할 수 있습니다.">
                                        <tr>
                                            <th scope="row">변경/환불</th>
                                            <td class="last" id="contents_15"><br>[예약변경]<br>&nbsp;- 수수료:
                                                <font color="BLUE">
                                                    구간 당 40,000 원</span>(재발행)<br><br>[환불]<br>&nbsp;- 취소/환불
                                                    수수료:<span class="detail_boldb">
                                                80,000 원</span>(구간 당)<br>&nbsp;* 출발전 취소 시점별 환불 수수료
                                                    *<br>&nbsp;&nbsp;&nbsp;- 출발전 7일 이내: <span class="detail_boldb">
                                                80,000 원</span>
                                                    <br>&nbsp;&nbsp;&nbsp;- 출발 30일-8일 전: <span class="detail_boldb">
                                                60,000 원</span>
                                                    <br>&nbsp;&nbsp;&nbsp;- 출발 60일-31일 전: <span
                                                        class="detail_boldb">
                                                40,000 원</span>
                                                    <br>&nbsp;&nbsp;&nbsp;- 출발 90일-61일 전: <span
                                                        class="detail_boldb">
                                                20,000 원</span>
                                                    <br><br>[환불]<br>&nbsp;- 출발후 예약 취소/환불 수수료: <span
                                                        class="detail_boldb">구간 당 60,000
                                                원
                                                </span><br><br>[예약 변경/환불]<br>&nbsp;- NO SHOW 후 예약 변경/취소 수수료:
                                                    <span class="detail_boldb">
                                                    120,000 원</span>(구간 당)<br> <br><br>[수수료 적용 기준] <br>- 모든
                                                    수수료는 전체 여정기준이 아닌 <span
                                                        class="detail_boldb">탑승구간 별로 합산하여 징수</span>
                                                    <br>- 시점별 수수료는 각
                                                    여정의 출발일을 기준으로 환불시점과 비교하여 적용<br>- 이름 변경(SPELL CHANGE) 및 예약
                                                    변경은 항공사에서 처리
                                                    불가하오니, 발권하신 대리점에 문의하시기 바랍니다.<br><br>[예약변경]<br>- 운임규정 상 변경이
                                                    허용되는 경우에 한해 동일 또는
                                                    상위 단계 운임으로만 변경가능하며, 변경일 기준 운임 재계산으로 변경수수료 이외에 운임차액 및 TAX 가
                                                    추가될 수 있습니다.<br>-
                                                    전체 미사용 항공권의 출발편 변경 유효기간은 항공사 규정 및 운임에 따라 상이하므로
                                                    문의바랍니다.<br><br>[환불]<br>- 항공권
                                                    유효기간 만료 후 최대 30일 이내 가능<br>- 출발이 임박하여 환불/변경이 있는 경우 바로 환불 접수가
                                                    불가할 수 있으며
                                                    노쇼,환불,변경 수수료 등 추가 금액이 발생할 수 있으니 영업일기준 최소 3일전(주말,공휴일제외)까지는 접수
                                                    바랍니다.<br>- 사용구간
                                                    편도 운임 및 환불수수료 공제 후 환불금이 발생되지 않을 수 있습니다.<br>- 상기 환불규정은 항공운임에
                                                    적용되는 내용이며, 유류할증료
                                                    및 TAX(제세공과금)의 환불규정은 각 정부지침 및 항공사규정에 따라 상이하므로
                                                    문의바랍니다.<br><br>[NO-SHOW]<br>-
                                                    수속마감(출발 50분전)까지 예약취소/변경 없이 탑승하지 않거나, 탑승 수속 후 탑승하지 않는 경우<br>-
                                                    여행사 영업시간 이외 요청
                                                    시 접수가 불가하여 수수료 징수 될수 있으니 영업시간 내 접수 바랍니다.<br>- NO SHOW 후
                                                    환불/변경 시 수수료 중복 징수
                                                    <br>- 변경 수수료 + NO SHOW 수수료 <br>- 환불 수수료 + NO SHOW 수수료<br>-
                                                    항공사에서 NO-SHOW 발생
                                                    이후 잔여여정을 취소할 수 있습니다.<br><a href="#" style="color:#235ba5;"
                                                                               onclick="airfn_displayoriginrule(this); return false;">[원문규정]</a>
                                                    <div style="display:none">BASE FARE<br> <br> CHANGES<br>
                                                        <br> ANY TIME<br>
                                                        PER COUPON CHARGE KRW 40000 FOR
                                                        REISSUE/REVALIDATION.<br> WAIVED FOR
                                                        DEATH OF PASSENGER OR FAMILY MEMBER.<br> NOTE -<br> 1/
                                                        FEE DOES NOT
                                                        APPLY FOR INFANTS NOT<br> OCCUPYING A SEAT<br> 2/
                                                        EXTENSION OF VALIDITY
                                                        FOR MEDICAL REASONS IS<br> PERMITTED SUBJECT TO
                                                        SUBMISSION OF
                                                        MEDICAL<br> CERTIFICATE WITH DATE SHOWN ON THE
                                                        DOCUMENT<br> 3/ CHANGES
                                                        ARE ONLY PERMITTED TO EQUIVALENT OR<br> HIGHER BOOKING
                                                        CLASS. REISSUE TO
                                                        LOWER BOOKING<br> CLASS IS NOT PERMITTED.<br> 4/ WHEN
                                                        REISSUING
                                                        CALCULATE THE FARE DIFFERENCE<br> AS BELOW<br> BEFORE
                                                        DEPARTURE- APPLY
                                                        CURRENT FARES OF NEW<br> ISSUANCE DATE<br> AFTER
                                                        DEPARTURE- APPLY
                                                        HISTORICAL FARES OF<br> ORIGINAL TICKET ISSUANCE
                                                        DATE<br> 5/ REISSUE
                                                        FEE/REFUND PENALTY ARE NON-REFUNDABLE<br> 6/ USE YQ CODE
                                                        TO IMPOSE
                                                        CHANGE FEE WHEN<br> REISSUING TICKET<br> <br>
                                                        CANCELLATIONS<br> <br> PER
                                                        COUPON CHARGE KRW 80000 FOR CANCEL/REFUND.<br> WAIVED
                                                        FOR DEATH OF
                                                        PASSENGER OR FAMILY MEMBER.<br> NOTE -<br> ---PENALTY
                                                        APPLIES PER
                                                        COUPON<br> WITHIN 7DAYS BEFORE DEPARTURE KRW 80000<br>
                                                        30DAYS - 8DAYS
                                                        BEFORE DEPARTURE KRW 60000<br> 60DAYS - 31DAYS BEFORE
                                                        DEPARTURE KRW
                                                        40000<br> 90DAYS - 61DAYS BEFORE DEPARTURE KRW 20000<br>
                                                        ---------------------------------------------<br> 1/
                                                        PENALTY DOES NOT
                                                        APPLY FOR INFANTS NOT<br> OCCUPYING A SEAT<br> 2/
                                                        EXTENSION OF TICKET
                                                        VALIDITY NOT PERMITTED<br> 3/ REISSUE FEE/REFUND PENALTY
                                                        ARE
                                                        NON-REFUNDABLE<br> <br> CANCELLATIONS<br> <br> AFTER
                                                        DEPARTURE<br> PER
                                                        COUPON CHARGE KRW 60000 FOR CANCEL/REFUND.<br> <br>
                                                        CHANGES/CANCELLATIONS<br> <br> ANY TIME<br> PER COUPON
                                                        CHARGE KRW 120000
                                                        FOR NO-SHOW.<br> WAIVED FOR DEATH OF PASSENGER OR FAMILY
                                                        MEMBER.<br>
                                                        NOTE -<br> 1/ NO-SHOW PENALTY APPLY FROM 50MINS
                                                        BEFORE<br> FLIGHT
                                                        DEPARTURE TIME IF A PASSENGER DOES NOT<br> CANCEL/CHANGE
                                                        THE
                                                        RESERVATION<br> 2/ NO-SHOW PENALTY WILL BE APPLIED IN
                                                        ADDITION TO<br>
                                                        CHANGE FEE/CANCELLATION PENALTY<br> 3/ PENALTY DOES NOT
                                                        APPLY FOR
                                                        INFANTS NOT<br> OCCUPYING A SEAT<br> 4/ COLLECT NO-SHOW
                                                        PENALTY PER
                                                        COUPON<br> PER CHANGE/REFUND TRANSACTION
                                                    </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_17"
                                               value="<B>※ 현재 조회 중인 운임 기준으로 추가요금은 이미 포함되어 있으나,  항공권 구매 조건에 따라 변경이 될 수 있습니다.(변경/환불수수료 별도)</B>">
                                        <tr>
                                            <th scope="row">추가요금</th>
                                            <td class="last" id="contents_17"><b>※ 현재 조회 중인 운임 기준으로 추가요금은 이미
                                                포함되어 있으나, 항공권
                                                구매 조건에 따라 변경이 될 수 있습니다.(변경/환불수수료 별도)</b></td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_18" value="허용 불가<BR> ">
                                        <tr>
                                            <th scope="row">경유지체류</th>
                                            <td class="last" id="contents_18">허용 불가<br> <br><a href="#"
                                                                                               style="color:#235ba5;"
                                                                                               onclick="airfn_displayoriginrule(this); return false;">[원문규정]</a>
                                                <div style="display:none">BASE FARE<br> <br> NO STOPOVERS
                                                    PERMITTED.
                                                </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_20"
                                               value="※ 경유지 당일 연결이 불가한 경우 해당 공항 심야 이용이 불가 할 수 있으므로 반드시 공항 운영 시간 확인 부탁 드립니다.">
                                        <tr>
                                            <th scope="row">환승</th>
                                            <td class="last" id="contents_20">※ 경유지 당일 연결이 불가한 경우 해당 공항 심야
                                                이용이 불가 할 수 있으므로
                                                반드시 공항 운영 시간 확인 부탁 드립니다.
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_21"
                                               value="[아래의 항공편 이용]<BR>&amp;nbsp;- 진에어 항공편<BR> ">
                                        <tr>
                                            <th scope="row">비행편제한</th>
                                            <td class="last" id="contents_21">[아래의 항공편 이용]<br>&nbsp;- 진에어
                                                항공편<br> <br><a href="#" style="color:#235ba5;"
                                                               onclick="airfn_displayoriginrule(this); return false;">[원문규정]</a>
                                                <div style="display:none">BASE FARE<br> <br> THE FARE
                                                    COMPONENT MUST BE
                                                    ON<br> ONE OR MORE OF THE FOLLOWING<br> ANY LJ FLIGHT.
                                                </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_22"
                                               value="사용가능<BR>-탑승자 본인카드로만 결제 가능하며 공항수속시 결제카드를 확인할수 있습니다.(제시 못할경우 탑승이 거부 될수 있음)">
                                        <tr>
                                            <th scope="row">신용카드</th>
                                            <td class="last" id="contents_22">사용가능<br>-탑승자 본인카드로만 결제 가능하며
                                                공항수속시 결제카드를 확인할수
                                                있습니다.(제시 못할경우 탑승이 거부 될수 있음)
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_23"
                                               value="※ 무료수하물 및 초과수하물 규정은 좌석등급 및 노선에 따라 상이하므로 자세한 내용은 항공사 홈페이지 <a href=&quot;https://www.jinair.com/ready/baggage&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 또는 여행사 담당자에게 문의 부탁드립니다.<BR>※ 항공사 요금규정에 무료수하물 내용이 누락된 경우 표기되지 않을 수 있으며, 표기되지 않은 경우, 해당항공사에 문의 부탁드립니다.<BR>※ 공동운항편, 타항공사 연결편, 24시간 이상 체류 일정, 해외출발 일정, 특수 수하물의 경우 운항항공사에 따라 수하물 규정이 상이할 수 있습니다.">
                                        <tr>
                                            <th scope="row">수하물</th>
                                            <td class="last" id="contents_23">※ 무료수하물 및 초과수하물 규정은 좌석등급 및 노선에
                                                따라 상이하므로 자세한
                                                내용은 항공사 홈페이지 <a href="https://www.jinair.com/ready/baggage"
                                                                style="color: red" target="_blank">[바로가기]</a> 또는 여행사
                                                담당자에게 문의
                                                부탁드립니다.<br>※ 항공사 요금규정에 무료수하물 내용이 누락된 경우 표기되지 않을 수 있으며, 표기되지
                                                않은 경우, 해당항공사에 문의
                                                부탁드립니다.<br>※ 공동운항편, 타항공사 연결편, 24시간 이상 체류 일정, 해외출발 일정, 특수
                                                수하물의 경우 운항항공사에 따라
                                                수하물 규정이 상이할 수 있습니다.
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_24"
                                               value="※ 항공사 마일리지 적립 여부 및 적립률은 운임별/제휴 회원사별로 상이하오니, 자세한 내용은 항공사 홈페이지 <a href=&quot;https://www.jinair.com/benefit/point&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 또는 여행사 담당자에게 구매 전 문의 부탁드립니다.">
                                        <tr>
                                            <th scope="row">항공사마일리지</th>
                                            <td class="last" id="contents_24">※ 항공사 마일리지 적립 여부 및 적립률은 운임별/제휴
                                                회원사별로 상이하오니,
                                                자세한 내용은 항공사 홈페이지 <a
                                                        href="https://www.jinair.com/benefit/point"
                                                        style="color: red" target="_blank">[바로가기]</a> 또는 여행사
                                                담당자에게 구매 전 문의
                                                부탁드립니다.
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_25"
                                               value="※ 항공권 발권 후 고객의 요청에 따른 취소,변경,환불 등의 작업 필요 시, 여행사에서 취급하는 비용이므로 해당 비용에 대한 문의는 여행사로 하시기 바랍니다.<BR>※ 발권 후 이루어지는 취소,변경,환불 등 모든 후속 업무는 여행사가 항공사를 통해 진행하는 추가 업무입니다. 따라서 이에 대한 여행업무 취급 수수료는 항공사 수수료와 별도로 추가 징수되는 사항이니, 신중한 결제 진행 부탁 드립니다.<BR>※ 여행업무 취급수수료는 항공권을 취소/변경/환불하더라도 환불되지 않습니다.">
                                        <tr>
                                            <th scope="row">여행업무취급수수료</th>
                                            <td class="last" id="contents_25">※ 항공권 발권 후 고객의 요청에 따른 취소,변경,환불
                                                등의 작업 필요 시,
                                                여행사에서 취급하는 비용이므로 해당 비용에 대한 문의는 여행사로 하시기 바랍니다.<br>※ 발권 후
                                                이루어지는 취소,변경,환불 등 모든
                                                후속 업무는 여행사가 항공사를 통해 진행하는 추가 업무입니다. 따라서 이에 대한 여행업무 취급 수수료는
                                                항공사 수수료와 별도로 추가
                                                징수되는 사항이니, 신중한 결제 진행 부탁 드립니다.<br>※ 여행업무 취급수수료는 항공권을
                                                취소/변경/환불하더라도 환불되지 않습니다.
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_26"
                                               value="※ 비동반 소아 서비스 미제공<BR>※ 만 5세 이상 소아는 만 13세 이상의 보호자와 동반 필수<BR>※ 만 5세 미만의 소아는 만 18세 이상의 성인과 동반 필수">
                                        <tr>
                                            <th scope="row">비동반 소아 규정</th>
                                            <td class="last" id="contents_26">※ 비동반 소아 서비스 미제공<br>※ 만 5세 이상
                                                소아는 만 13세 이상의
                                                보호자와 동반 필수<br>※ 만 5세 미만의 소아는 만 18세 이상의 성인과 동반 필수
                                            </td>
                                        </tr>
                                        <input type="hidden" name="contents" class="cont"
                                               id="tempContents_27"
                                               value="※ 상기 모든 수수료는 1인/1회 기준 금액 입니다. <BR><B>※ 예약일과 발권일이 상이한 경우 발권일의 환율에 따라 TAX(유류할증료 포함)가 변동될 수 있습니다.</B><BR>※ 항공사의 사정으로 별도의 공지없이 운임 및 규정이 변경되어 운임 차액이 발생하는 경우 운임차액 추가 징수됩니다.<BR>※ 항공권은 반드시 첫번째 여정부터 순서대로 사용하셔야하며, 순서대로 이용하지 않은 항공권은 취소처리될 수 있으며, 환불불가합니다. <BR>※ 동일 혹은 다수의 여행사를 통해 동일항공편을 이중예약하는 경우, 항공사에 의해 예약취소될 수 있으니 유의해 주시기 바랍니다. <BR>※ 자세한 운송약관은 항공사 홈페이지 <a href=&quot;https://images.jinair.com/eForm/%EA%B5%AD%EC%A0%9C%EC%97%AC%EA%B0%9D%EC%9A%B4%EC%86%A1%EC%95%BD%EA%B4%80_KOR.pdf?2021525&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 를 통해 확인 부탁드립니다. ">
                                        <tr>
                                            <th scope="row">항공사 일반규정</th>
                                            <td class="last" id="contents_27">※ 상기 모든 수수료는 1인/1회 기준 금액 입니다.
                                                <br><b>※ 예약일과
                                                    발권일이 상이한 경우 발권일의 환율에 따라 TAX(유류할증료 포함)가 변동될 수
                                                    있습니다.</b><br>※ 항공사의 사정으로
                                                별도의 공지없이 운임 및 규정이 변경되어 운임 차액이 발생하는 경우 운임차액 추가 징수됩니다.<br>※
                                                항공권은 반드시 첫번째 여정부터
                                                순서대로 사용하셔야하며, 순서대로 이용하지 않은 항공권은 취소처리될 수 있으며, 환불불가합니다. <br>※
                                                동일 혹은 다수의 여행사를
                                                통해 동일항공편을 이중예약하는 경우, 항공사에 의해 예약취소될 수 있으니 유의해 주시기 바랍니다. <br>※
                                                자세한 운송약관은 항공사
                                                홈페이지 <a
                                                        href="https://images.jinair.com/eForm/%EA%B5%AD%EC%A0%9C%EC%97%AC%EA%B0%9D%EC%9A%B4%EC%86%A1%EC%95%BD%EA%B4%80_KOR.pdf?2021525"
                                                        style="color: red" target="_blank">[바로가기]</a> 를 통해 확인
                                                부탁드립니다.
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div xmlns="http://www.w3.org/1999/xhtml" id="ruleparams">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="적용구간">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="서울-동경">
                                        <input type="hidden" name="ruleengcontents" value="SEL-TYO">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="적용대상">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="학생운임 서류 안내 ">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="출발요일">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="출발기간">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="항공사 안내사항">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="적용불가일">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="여행가능일">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="2023.03.26 이후 출발 조건<BR> ">
                                        <input type="hidden" name="ruleengcontents"
                                               value="BASE FARE<BR> <BR>  VALID FOR TRAVEL COMMENCING ON/AFTER 26MAR 23.">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="최소체류일">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="최대체류일">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="출발 후 12개월<BR> ">
                                        <input type="hidden" name="ruleengcontents"
                                               value="BASE FARE<BR>FOR ROUND TRIP FARES<BR> <BR>  TRAVEL FROM LAST STOPOVER MUST COMMENCE NO LATER THAN 12<BR>  MONTHS AFTER DEPARTURE FROM FARE ORIGIN.">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="유/소아요금">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="- 성인 동반 만 2세 - 만 11세 소아 : 성인 요금의 100%<BR>&amp;nbsp;&amp;nbsp;(전구간 만 18세 이상 성인 동반조건)<br>- 첫번째 만 2세 미만 유아(좌석 미점유) : 성인 요금의 10%<BR>- 만 2세 미만 유아(좌석 점유 시) : 성인 요금의 100%<BR> <BR><BR>※ 상기 모든 수수료는 1인/1회 기준 금액 입니다. <BR>※ 항공사 및 운항 항공편에 따라 소아, 유아 나이의 적용 기준이 달라질 수 있습니다.<BR>※ 출발 당시 소아 운임 적용 가능하더라도 여행 도중 만 12세 이상이 되는 경우, 유아 운임 적용 가능하더라도 여행 도중 24개월 이상이 되는 경우, 소아, 유아 운임 적용 불가할 수 있으며 소아,유아 항공권을 소지하더라도 운항 항공편에 따라 탑승이 거절되거나 추가 비용 발생 등 항공권 사용에 문제가 될 수 있으니 구매 전 반드시 확인하시기 바랍니다.">
                                        <input type="hidden" name="ruleengcontents"
                                               value="CD.CHILD DISCOUNTS<BR>FARE BY RULE<BR> <BR>  ACCOMPANIED CHILD 2-11 - CHARGE 100 PERCENT OF THE FARE.<BR>        TICKET DESIGNATOR - CH AND PERCENT OF DISCOUNT.<BR>    MUST BE ACCOMPANIED ON ALL FLIGHTS IN SAME COMPARTMENT<BR>      BY ADULT 18 OR OLDER.<BR>         NOTE -<BR>          FOR UNACCOMPANIED MINORS SERVICE<BR>          PLEASE SEE WWW.JINAIR.COM<BR>  OR - 1ST INFANT UNDER 2 WITHOUT A SEAT - CHARGE 10 PERCENT<BR>         OF THE FARE.<BR>             TICKET DESIGNATOR - IN AND PERCENT OF DISCOUNT<BR>  OR - INFANT UNDER 2 WITH A SEAT - CHARGE 100 PERCENT OF<BR>         THE FARE.<BR>             TICKET DESIGNATOR - CH AND PERCENT OF DISCOUNT.">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="발권 후 예약 변경 ">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="사전발권">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="&amp;nbsp;- 전구간 확약 조건<BR>&amp;nbsp;- 대기 예약 불가<BR> <BR><BR>※ 사전발권 조건과 자동생성되는 시스템 발권 시한 중 가장 제한적인 조건으로 적용됩니다.<BR>※ 예약일 기준으로 항공사에서 자동으로 발권시한이 생성되므로 좌석이 확약이더라도 상황에 따라 예약과 동시에 구매하지 않으면 예약이 취소될 수 있습니다. ">
                                        <input type="hidden" name="ruleengcontents"
                                               value="BASE FARE<BR> <BR>  RESERVATIONS ARE REQUIRED FOR ALL SECTORS.<BR>  WAITLIST NOT PERMITTED.<BR>         NOTE -<BR>          ALL SECTORS MUST BE CONFIRMED">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="판매제한">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="2023.02.06 이후에 발권해야 함<BR> <BR><BR>판매기간 : 2022.08.15~2022.08.18 까지 예약 및 발권 완료 조건">
                                        <input type="hidden" name="ruleengcontents"
                                               value="BASE FARE<BR> <BR>  TICKETS MUST BE ISSUED ON/AFTER 06FEB 23.">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="변경/환불">
                                        <input type="hidden" name="rulemultitypes" value="" type="hidden"
                                               name="rulecontents"
                                               value="<BR>[예약 변경]<BR>&amp;nbsp;- 수수료: <FONT COLOR=BLUE>구간 당 60,000 원</FONT><BR><br>[환불]<BR>&amp;nbsp;- 취소/환불 수수료:<FONT COLOR=BLUE>100,000 원</FONT>(구간 당)<BR>&amp;nbsp;* 출발전 취소 시점별 환불 수수료 *<BR>&amp;nbsp;&amp;nbsp;&amp;nbsp;- 출발전 7일 이내: <FONT COLOR=BLUE>100,000 원</FONT><BR>&amp;nbsp;&amp;nbsp;&amp;nbsp;- 출발 30일-8일 전: <FONT COLOR=BLUE>80,000 원</FONT><BR>&amp;nbsp;&amp;nbsp;&amp;nbsp;- 구매이후~ 출발전 31일: <FONT COLOR=BLUE>60,000 원</FONT><BR>&amp;nbsp;- 출발후 예약 취소/환불 수수료: <FONT COLOR=BLUE>구간 당 80,000 원</FONT><BR><BR>[예약 변경/환불]<BR>&amp;nbsp;- NO SHOW 후 예약 변경/취소 수수료: <FONT COLOR=BLUE>120,000 원</FONT>(구간 당)<BR> <BR><BR>[수수료 적용 기준] <BR>- 모든 수수료는 전체 여정기준이 아닌 <font color=blue>탑승구간 별로 합산하여 징수</font><BR>- 시점별 수수료는 각 여정의 출발일을 기준으로 환불시점과 비교하여 적용<BR>- 이름 변경(SPELL CHANGE) 및 예약 변경은 항공사에서 처리 불가하오니, 발권하신 대리점에 문의하시기 바랍니다.<BR><BR>[예약변경]<BR>- 운임규정 상 변경이 허용되는 경우에 한해 동일 또는 상위 단계 운임으로만 변경가능하며, 변경일 기준 운임 재계산으로 변경수수료 이외에 운임차액 및 TAX 가 추가될 수 있습니다.<BR>- 전체 미사용 항공권의 출발편 변경 유효기간은 항공사 규정 및 운임에 따라 상이하므로 문의바랍니다.<BR><BR>[환불]<BR>- 항공권 유효기간 만료 후 최대 30일 이내 가능<BR>- 출발이 임박하여 환불/변경이 있는 경우 바로 환불 접수가 불가할 수 있으며 노쇼,환불,변경 수수료 등 추가 금액이 발생할 수 있으니 영업일기준 최소 3일전(주말,공휴일제외)까지는 접수 바랍니다.<BR>- 사용구간 편도 운임 및 환불수수료 공제 후 환불금이 발생되지 않을 수 있습니다.<BR>- 상기 환불규정은 항공운임에 적용되는 내용이며, 유류할증료 및 TAX(제세공과금)의 환불규정은 각 정부지침 및 항공사규정에 따라 상이하므로 문의바랍니다.<BR><BR>[NO-SHOW]<BR>- 수속마감(출발 50분전)까지 예약취소/변경 없이 탑승하지 않거나, 탑승 수속 후 탑승하지 않는 경우<BR>- 여행사 영업시간 이외 요청 시 접수가 불가하여 수수료 징수 될수 있으니 영업시간 내 접수 바랍니다.<BR>- NO SHOW 후 환불/변경 시 수수료 중복 징수 <BR>- 변경 수수료 + NO SHOW 수수료 <BR>- 환불 수수료 + NO SHOW 수수료<BR>- 항공사에서 NO-SHOW 발생 이후 잔여여정을 취소할 수 있습니다."
                                               type="hidden" name="ruleengcontents"
                                               value="BASE FARE<BR> <BR>  CHANGES<BR> <BR>    PER COUPON CHARGE KRW 60000 FOR REISSUE/REVALIDATION.<BR>    WAIVED FOR DEATH OF PASSENGER OR FAMILY MEMBER.<BR>         NOTE -<BR>          1/ FEE DOES NOT APPLY FOR INFANTS NOT<BR>             OCCUPYING A SEAT<BR>          2/ EXTENSION OF VALIDITY FOR MEDICAL REASONS IS<BR>             PERMITTED SUBJECT TO SUBMISSION OF MEDICAL<BR>             CERTIFICATE WITH DATE SHOWN ON THE DOCUMENT<BR>          3/ CHANGES ARE ONLY PERMITTED TO EQUIVALENT OR<BR>             HIGHER BOOKING CLASS. REISSUE TO LOWER BOOKING<BR>             CLASS IS NOT PERMITTED.<BR>          4/ WHEN REISSUING CALCULATE THE FARE DIFFERENCE<BR>             AS BELOW<BR>             BEFORE DEPARTURE- APPLY CURRENT FARES OF NEW<BR>                               ISSUANCE DATE<BR>             AFTER DEPARTURE-  APPLY HISTORICAL FARES OF<BR>                               ORIGINAL TICKET ISSUANCE DATE<BR>          5/ REISSUE FEE/REFUND PENALTY ARE NON-REFUNDABLE<BR>          6/ USE YQ CODE TO IMPOSE CHANGE FEE WHEN<BR>             REISSUING TICKET<BR> <BR>  CANCELLATIONS<BR> <BR>    PER COUPON CHARGE KRW 100000 FOR CANCEL/REFUND.<BR>    WAIVED FOR DEATH OF PASSENGER OR FAMILY MEMBER.<BR>         NOTE -<BR>          ---PENALTY APPLIES PER COUPON<BR>          WITHIN 7DAYS BEFORE DEPARTURE KRW 100000<BR>          30DAYS - 8DAYS BEFORE DEPARTURE KRW 80000<BR>          AFTER PURCHASE - 31DAYS BEFORE DEPARTURE KRW 60000<BR>          ---------------------------------------------<BR>          1/ PENALTY DOES NOT APPLY FOR INFANTS NOT<BR>             OCCUPYING A SEAT<BR>          2/ EXTENSION OF TICKET VALIDITY NOT PERMITTED<BR>          3/ REISSUE FEE/REFUND PENALTY ARE NON-REFUNDABLE<BR> <BR>    AFTER DEPARTURE<BR>      PER COUPON CHARGE KRW 80000 FOR CANCEL/REFUND.<BR> <BR>  CHANGES/CANCELLATIONS<BR> <BR>    PER COUPON CHARGE KRW 120000 FOR NO-SHOW.<BR>    WAIVED FOR DEATH OF PASSENGER OR FAMILY MEMBER.<BR>         NOTE -<BR>          1/ NO-SHOW PENALTY APPLY FROM 50MINS BEFORE<BR>             FLIGHT DEPARTURE TIME IF A PASSENGER DOES NOT<BR>             CANCEL/CHANGE THE RESERVATION<BR>          2/ NO-SHOW PENALTY WILL BE APPLIED IN ADDITION TO<BR>             CHANGE FEE/CANCELLATION PENALTY<BR>          3/ PENALTY DOES NOT APPLY FOR INFANTS NOT<BR>             OCCUPYING A SEAT<BR>          4/ COLLECT NO-SHOW PENALTY PER COUPON<BR>             PER CHANGE/REFUND TRANSACTION"
                                               type="hidden" name="rulegrpnos" value="1"
                                               type="hidden"
                                               name="ruletitles" value="동반여행">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="추가요금">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="<B>※ 현재 조회 중인 운임 기준으로 추가요금은 이미 포함되어 있으나,  항공권 구매 조건에 따라 변경이 될 수 있습니다.(변경/환불수수료 별도)</B>">
                                        <input type="hidden" name="ruleengcontents"
                                               value="<B>※ 현재 조회 중인 운임 기준으로 추가요금은 이미 포함되어 있으나,  항공권 구매 조건에 따라 변경이 될 수 있습니다.(변경/환불수수료 별도)</B>">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="경유지체류">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="허용 불가<BR> ">
                                        <input type="hidden" name="ruleengcontents"
                                               value="BASE FARE<BR> <BR>  NO STOPOVERS PERMITTED.">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="사전 좌석 배정">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="환승">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="※ 경유지 당일 연결이 불가한 경우 해당 공항 심야 이용이 불가 할 수 있으므로 반드시 공항 운영 시간 확인 부탁 드립니다.">
                                        <input type="hidden" name="ruleengcontents"
                                               value="※ 경유지 당일 연결이 불가한 경우 해당 공항 심야 이용이 불가 할 수 있으므로 반드시 공항 운영 시간 확인 부탁 드립니다.">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="비행편제한">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="[아래의 항공편 이용]<BR>&amp;nbsp;- 진에어 항공편<BR> ">
                                        <input type="hidden" name="ruleengcontents"
                                               value="BASE FARE<BR> <BR>  THE FARE COMPONENT MUST BE ON<BR>      ONE OR MORE OF THE FOLLOWING<BR>        ANY LJ FLIGHT.">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="신용카드">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="사용가능<BR>-탑승자 본인카드로만 결제 가능하며 공항수속시 결제카드를 확인할수 있습니다.(제시 못할경우 탑승이 거부 될수 있음)">
                                        <input type="hidden" name="ruleengcontents"
                                               value="사용가능<BR>-탑승자 본인카드로만 결제 가능하며 공항수속시 결제카드를 확인할수 있습니다.(제시 못할경우 탑승이 거부 될수 있음)">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="수하물">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="※ 무료수하물 및 초과수하물 규정은 좌석등급 및 노선에 따라 상이하므로 자세한 내용은 항공사 홈페이지 ▦href▦https://www.jinair.com/ready/baggage&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 또는 여행사 담당자에게 문의 부탁드립니다.<BR>※ 항공사 요금규정에 무료수하물 내용이 누락된 경우 표기되지 않을 수 있으며, 표기되지 않은 경우, 해당항공사에 문의 부탁드립니다.<BR>※ 공동운항편, 타항공사 연결편, 24시간 이상 체류 일정, 해외출발 일정, 특수 수하물의 경우 운항항공사에 따라 수하물 규정이 상이할 수 있습니다.">
                                        <input type="hidden" name="ruleengcontents"
                                               value="※ 무료수하물 및 초과수하물 규정은 좌석등급 및 노선에 따라 상이하므로 자세한 내용은 항공사 홈페이지 ▦href▦https://www.jinair.com/ready/baggage&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 또는 여행사 담당자에게 문의 부탁드립니다.<BR>※ 항공사 요금규정에 무료수하물 내용이 누락된 경우 표기되지 않을 수 있으며, 표기되지 않은 경우, 해당항공사에 문의 부탁드립니다.<BR>※ 공동운항편, 타항공사 연결편, 24시간 이상 체류 일정, 해외출발 일정, 특수 수하물의 경우 운항항공사에 따라 수하물 규정이 상이할 수 있습니다.">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="항공사마일리지">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="※ 항공사 마일리지 적립 여부 및 적립률은 운임별/제휴 회원사별로 상이하오니, 자세한 내용은 항공사 홈페이지 ▦href▦https://www.jinair.com/benefit/point&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 또는 여행사 담당자에게 구매 전 문의 부탁드립니다.">
                                        <input type="hidden" name="ruleengcontents"
                                               value="※ 항공사 마일리지 적립 여부 및 적립률은 운임별/제휴 회원사별로 상이하오니, 자세한 내용은 항공사 홈페이지 ▦href▦https://www.jinair.com/benefit/point&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 또는 여행사 담당자에게 구매 전 문의 부탁드립니다.">
                                        <input type="hidden" name="rulegrpnos" value="1" type="hidden"
                                               name="ruletitles"
                                               value="여행업무취급수수료">
                                        <input type="hidden"
                                               name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="※ 항공권 발권 후 고객의 요청에 따른 취소,변경,환불 등의 작업 필요 시, 여행사에서 취급하는 비용이므로 해당 비용에 대한 문의는 여행사로 하시기 바랍니다.<BR>※ 발권 후 이루어지는 취소,변경,환불 등 모든 후속 업무는 여행사가 항공사를 통해 진행하는 추가 업무입니다. 따라서 이에 대한 여행업무 취급 수수료는 항공사 수수료와 별도로 추가 징수되는 사항이니, 신중한 결제 진행 부탁 드립니다.<BR>※ 여행업무 취급수수료는 항공권을 취소/변경/환불하더라도 환불되지 않습니다.">
                                        <input type="hidden" name="ruleengcontents"
                                               value="※ 항공권 발권 후 고객의 요청에 따른 취소,변경,환불 등의 작업 필요 시, 여행사에서 취급하는 비용이므로 해당 비용에 대한 문의는 여행사로 하시기 바랍니다.<BR>※ 발권 후 이루어지는 취소,변경,환불 등 모든 후속 업무는 여행사가 항공사를 통해 진행하는 추가 업무입니다. 따라서 이에 대한 여행업무 취급 수수료는 항공사 수수료와 별도로 추가 징수되는 사항이니, 신중한 결제 진행 부탁 드립니다.<BR>※ 여행업무 취급수수료는 항공권을 취소/변경/환불하더라도 환불되지 않습니다.">
                                        <input type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="비동반 소아 규정">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="※ 비동반 소아 서비스 미제공<BR>※ 만 5세 이상 소아는 만 13세 이상의 보호자와 동반 필수<BR>※ 만 5세 미만의 소아는 만 18세 이상의 성인과 동반 필수">
                                        <input type="hidden" name="ruleengcontents"
                                               value="※ 비동반 소아 서비스 미제공<BR>※ 만 5세 이상 소아는 만 13세 이상의 보호자와 동반 필수<BR>※ 만 5세 미만의 소아는 만 18세 이상의 성인과 동반 필수">
                                        <input
                                                type="hidden" name="rulegrpnos" value="1">
                                        <input type="hidden" name="ruletitles" value="항공사 일반규정">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="※ 상기 모든 수수료는 1인/1회 기준 금액 입니다. <BR><B>※ 예약일과 발권일이 상이한 경우 발권일의 환율에 따라 TAX(유류할증료 포함)가 변동될 수 있습니다.</B><BR>※ 항공사의 사정으로 별도의 공지없이 운임 및 규정이 변경되어 운임 차액이 발생하는 경우 운임차액 추가 징수됩니다.<BR>※ 항공권은 반드시 첫번째 여정부터 순서대로 사용하셔야하며, 순서대로 이용하지 않은 항공권은 취소처리될 수 있으며, 환불불가합니다. <BR>※ 동일 혹은 다수의 여행사를 통해 동일항공편을 이중예약하는 경우, 항공사에 의해 예약취소될 수 있으니 유의해 주시기 바랍니다. <BR>※ 자세한 운송약관은 항공사 홈페이지 ▦href▦https://images.jinair.com/eForm/%EA%B5%AD%EC%A0%9C%EC%97%AC%EA%B0%9D%EC%9A%B4%EC%86%A1%EC%95%BD%EA%B4%80_KOR.pdf?2021525&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 를 통해 확인 부탁드립니다. ">
                                        <input type="hidden" name="ruleengcontents"
                                               value="※ 상기 모든 수수료는 1인/1회 기준 금액 입니다. <BR><B>※ 예약일과 발권일이 상이한 경우 발권일의 환율에 따라 TAX(유류할증료 포함)가 변동될 수 있습니다.</B><BR>※ 항공사의 사정으로 별도의 공지없이 운임 및 규정이 변경되어 운임 차액이 발생하는 경우 운임차액 추가 징수됩니다.<BR>※ 항공권은 반드시 첫번째 여정부터 순서대로 사용하셔야하며, 순서대로 이용하지 않은 항공권은 취소처리될 수 있으며, 환불불가합니다. <BR>※ 동일 혹은 다수의 여행사를 통해 동일항공편을 이중예약하는 경우, 항공사에 의해 예약취소될 수 있으니 유의해 주시기 바랍니다. <BR>※ 자세한 운송약관은 항공사 홈페이지 ▦href▦https://images.jinair.com/eForm/%EA%B5%AD%EC%A0%9C%EC%97%AC%EA%B0%9D%EC%9A%B4%EC%86%A1%EC%95%BD%EA%B4%80_KOR.pdf?2021525&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 를 통해 확인 부탁드립니다. ">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden"
                                               name="ruletitles" value="적용구간">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="동경-서울">
                                        <input type="hidden" name="ruleengcontents" value="TYO-SEL">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="적용대상">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="학생운임 서류 안내 ">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="출발요일">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="출발기간">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="항공사 안내사항">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletites" value="적용불가일">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input
                                                type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="여행가능일">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="2023.03.26 이후 출발 조건<BR> ">
                                        <input type="hidden" name="ruleengcontents"
                                               value="BASE FARE<BR> <BR>  VALID FOR TRAVEL COMMENCING ON/AFTER 26MAR 23.">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="최소체류일">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="최대체류일">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="출발 후 12개월<BR> ">
                                        <input type="hidden" name="ruleengcontents"
                                               value="BASE FARE<BR>FOR ROUND TRIP FARES<BR> <BR>  TRAVEL FROM LAST STOPOVER MUST COMMENCE NO LATER THAN 12<BR>  MONTHS AFTER DEPARTURE FROM FARE ORIGIN.">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="유/소아요금">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="- 성인 동반 만 2세 - 만 11세 소아 : 성인 요금의 85%<BR>&amp;nbsp;&amp;nbsp;(전구간 만 18세 이상 성인 동반조건)<br>- 첫번째 만 2세 미만 유아(좌석 미점유) : 성인 요금의 10%<BR>- 만 2세 미만 유아(좌석 점유 시) : 성인 요금의 85%<BR> <BR><BR>※ 상기 모든 수수료는 1인/1회 기준 금액 입니다. <BR>※ 항공사 및 운항 항공편에 따라 소아, 유아 나이의 적용 기준이 달라질 수 있습니다.<BR>※ 출발 당시 소아 운임 적용 가능하더라도 여행 도중 만 12세 이상이 되는 경우, 유아 운임 적용 가능하더라도 여행 도중 24개월 이상이 되는 경우, 소아, 유아 운임 적용 불가할 수 있으며 소아,유아 항공권을 소지하더라도 운항 항공편에 따라 탑승이 거절되거나 추가 비용 발생 등 항공권 사용에 문제가 될 수 있으니 구매 전 반드시 확인하시기 바랍니다.">
                                        <input type="hidden" name="ruleengcontents"
                                               value="CD.CHILD DISCOUNTS<BR>FARE BY RULE<BR>FOR 2ND LEVEL ECONOMY RESTRICTED FARES<BR> <BR>  ACCOMPANIED CHILD 2-11 - CHARGE 85 PERCENT OF THE FARE.<BR>        TICKET DESIGNATOR - CH AND PERCENT OF DISCOUNT.<BR>    MUST BE ACCOMPANIED ON ALL FLIGHTS IN SAME COMPARTMENT<BR>      BY ADULT 18 OR OLDER.<BR>         NOTE -<BR>          FOR UNACCOMPANIED MINORS SERVICE<BR>          PLEASE SEE WWW.JINAIR.COM<BR>  OR - 1ST INFANT UNDER 2 WITHOUT A SEAT - CHARGE 10 PERCENT<BR>         OF THE FARE.<BR>             TICKET DESIGNATOR - IN AND PERCENT OF DISCOUNT<BR>  OR - INFANT UNDER 2 WITH A SEAT - CHARGE 85 PERCENT OF THE<BR>         FARE.<BR>             TICKET DESIGNATOR - CH AND PERCENT OF DISCOUNT.">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="발권 후 예약 변경 ">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="사전발권">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="&amp;nbsp;- 전구간 확약 조건<BR>&amp;nbsp;- 대기 예약 불가<BR> <BR><BR>※ 사전발권 조건과 자동생성되는 시스템 발권 시한 중 가장 제한적인 조건으로 적용됩니다.<BR>※ 예약일 기준으로 항공사에서 자동으로 발권시한이 생성되므로 좌석이 확약이더라도 상황에 따라 예약과 동시에 구매하지 않으면 예약이 취소될 수 있습니다. ">
                                        <input type="hidden" name="ruleengcontents"
                                               value="BASE FARE<BR> <BR>  RESERVATIONS ARE REQUIRED FOR ALL SECTORS.<BR>  WAITLIST NOT PERMITTED.<BR>         NOTE -<BR>          ALL SECTORS MUST BE CONFIRMED">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="판매제한">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="2023.02.06 이후에 발권해야 함<BR> <BR><BR>판매기간 : 2022.08.15~2022.08.18 까지 예약 및 발권 완료 조건">
                                        <input type="hidden" name="ruleengcontents"
                                               value="BASE FARE<BR> <BR>  TICKETS MUST BE ISSUED ON/AFTER 06FEB 23.">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="변경/환불">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="<BR>[예약변경]<BR>&amp;nbsp;- 수수료: <FONT COLOR=BLUE>구간 당 40,000 원</FONT>(재발행)<BR><br>[환불]<BR>&amp;nbsp;- 취소/환불 수수료:<FONT COLOR=BLUE>80,000 원</FONT>(구간 당)<BR>&amp;nbsp;* 출발전 취소 시점별 환불 수수료 *<BR>&amp;nbsp;&amp;nbsp;&amp;nbsp;- 출발전 7일 이내: <FONT COLOR=BLUE>80,000 원</FONT><BR>&amp;nbsp;&amp;nbsp;&amp;nbsp;- 출발 30일-8일 전: <FONT COLOR=BLUE>60,000 원</FONT><BR>&amp;nbsp;&amp;nbsp;&amp;nbsp;- 출발 60일-31일 전: <FONT COLOR=BLUE>40,000 원</FONT><BR>&amp;nbsp;&amp;nbsp;&amp;nbsp;- 출발 90일-61일 전: <FONT COLOR=BLUE>20,000 원</FONT><BR><BR>[환불]<BR>&amp;nbsp;- 출발후 예약 취소/환불 수수료: <FONT COLOR=BLUE>구간 당 60,000 원</FONT><BR><BR>[예약 변경/환불]<BR>&amp;nbsp;- NO SHOW 후 예약 변경/취소 수수료: <FONT COLOR=BLUE>120,000 원</FONT>(구간 당)<BR> <BR><BR>[수수료 적용 기준] <BR>- 모든 수수료는 전체 여정기준이 아닌 <font color=blue>탑승구간 별로 합산하여 징수</font><BR>- 시점별 수수료는 각 여정의 출발일을 기준으로 환불시점과 비교하여 적용<BR>- 이름 변경(SPELL CHANGE) 및 예약 변경은 항공사에서 처리 불가하오니, 발권하신 대리점에 문의하시기 바랍니다.<BR><BR>[예약변경]<BR>- 운임규정 상 변경이 허용되는 경우에 한해 동일 또는 상위 단계 운임으로만 변경가능하며, 변경일 기준 운임 재계산으로 변경수수료 이외에 운임차액 및 TAX 가 추가될 수 있습니다.<BR>- 전체 미사용 항공권의 출발편 변경 유효기간은 항공사 규정 및 운임에 따라 상이하므로 문의바랍니다.<BR><BR>[환불]<BR>- 항공권 유효기간 만료 후 최대 30일 이내 가능<BR>- 출발이 임박하여 환불/변경이 있는 경우 바로 환불 접수가 불가할 수 있으며 노쇼,환불,변경 수수료 등 추가 금액이 발생할 수 있으니 영업일기준 최소 3일전(주말,공휴일제외)까지는 접수 바랍니다.<BR>- 사용구간 편도 운임 및 환불수수료 공제 후 환불금이 발생되지 않을 수 있습니다.<BR>- 상기 환불규정은 항공운임에 적용되는 내용이며, 유류할증료 및 TAX(제세공과금)의 환불규정은 각 정부지침 및 항공사규정에 따라 상이하므로 문의바랍니다.<BR><BR>[NO-SHOW]<BR>- 수속마감(출발 50분전)까지 예약취소/변경 없이 탑승하지 않거나, 탑승 수속 후 탑승하지 않는 경우<BR>- 여행사 영업시간 이외 요청 시 접수가 불가하여 수수료 징수 될수 있으니 영업시간 내 접수 바랍니다.<BR>- NO SHOW 후 환불/변경 시 수수료 중복 징수 <BR>- 변경 수수료 + NO SHOW 수수료 <BR>- 환불 수수료 + NO SHOW 수수료<BR>- 항공사에서 NO-SHOW 발생 이후 잔여여정을 취소할 수 있습니다.">
                                        <input type="hidden" name="ruleengcontents"
                                               value="BASE FARE<BR> <BR>  CHANGES<BR> <BR>    ANY TIME<BR>      PER COUPON CHARGE KRW 40000 FOR REISSUE/REVALIDATION.<BR>      WAIVED FOR DEATH OF PASSENGER OR FAMILY MEMBER.<BR>         NOTE -<BR>          1/ FEE DOES NOT APPLY FOR INFANTS NOT<BR>             OCCUPYING A SEAT<BR>          2/ EXTENSION OF VALIDITY FOR MEDICAL REASONS IS<BR>             PERMITTED SUBJECT TO SUBMISSION OF MEDICAL<BR>             CERTIFICATE WITH DATE SHOWN ON THE DOCUMENT<BR>          3/ CHANGES ARE ONLY PERMITTED TO EQUIVALENT OR<BR>             HIGHER BOOKING CLASS. REISSUE TO LOWER BOOKING<BR>             CLASS IS NOT PERMITTED.<BR>          4/ WHEN REISSUING CALCULATE THE FARE DIFFERENCE<BR>             AS BELOW<BR>             BEFORE DEPARTURE- APPLY CURRENT FARES OF NEW<BR>                               ISSUANCE DATE<BR>             AFTER DEPARTURE-  APPLY HISTORICAL FARES OF<BR>                               ORIGINAL TICKET ISSUANCE DATE<BR>          5/ REISSUE FEE/REFUND PENALTY ARE NON-REFUNDABLE<BR>          6/ USE YQ CODE TO IMPOSE CHANGE FEE WHEN<BR>             REISSUING TICKET<BR> <BR>  CANCELLATIONS<BR> <BR>    PER COUPON CHARGE KRW 80000 FOR CANCEL/REFUND.<BR>    WAIVED FOR DEATH OF PASSENGER OR FAMILY MEMBER.<BR>         NOTE -<BR>          ---PENALTY APPLIES PER COUPON<BR>          WITHIN 7DAYS BEFORE DEPARTURE KRW 80000<BR>          30DAYS -  8DAYS BEFORE DEPARTURE KRW 60000<BR>          60DAYS - 31DAYS BEFORE DEPARTURE KRW 40000<BR>          90DAYS - 61DAYS BEFORE DEPARTURE KRW 20000<BR>          ---------------------------------------------<BR>          1/ PENALTY DOES NOT APPLY FOR INFANTS NOT<BR>             OCCUPYING A SEAT<BR>          2/ EXTENSION OF TICKET VALIDITY NOT PERMITTED<BR>          3/ REISSUE FEE/REFUND PENALTY ARE NON-REFUNDABLE<BR> <BR>  CANCELLATIONS<BR> <BR>    AFTER DEPARTURE<BR>      PER COUPON CHARGE KRW 60000 FOR CANCEL/REFUND.<BR> <BR>  CHANGES/CANCELLATIONS<BR> <BR>    ANY TIME<BR>      PER COUPON CHARGE KRW 120000 FOR NO-SHOW.<BR>      WAIVED FOR DEATH OF PASSENGER OR FAMILY MEMBER.<BR>         NOTE -<BR>          1/ NO-SHOW PENALTY APPLY FROM 50MINS BEFORE<BR>             FLIGHT DEPARTURE TIME IF A PASSENGER DOES NOT<BR>             CANCEL/CHANGE THE RESERVATION<BR>          2/ NO-SHOW PENALTY WILL BE APPLIED IN ADDITION TO<BR>             CHANGE FEE/CANCELLATION PENALTY<BR>          3/ PENALTY DOES NOT APPLY FOR INFANTS NOT<BR>             OCCUPYING A SEAT<BR>          4/ COLLECT NO-SHOW PENALTY PER COUPON<BR>             PER CHANGE/REFUND TRANSACTION">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="동반여행">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="추가요금">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="<B>※ 현재 조회 중인 운임 기준으로 추가요금은 이미 포함되어 있으나,  항공권 구매 조건에 따라 변경이 될 수 있습니다.(변경/환불수수료 별도)</B>">
                                        <input type="hidden" name="ruleengcontents"
                                               value="<B>※ 현재 조회 중인 운임 기준으로 추가요금은 이미 포함되어 있으나,  항공권 구매 조건에 따라 변경이 될 수 있습니다.(변경/환불수수료 별도)</B>">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="경유지체류">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="허용 불가<BR> ">
                                        <input type="hidden" name="ruleengcontents"
                                               value="BASE FARE<BR> <BR>  NO STOPOVERS PERMITTED.">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="사전 좌석 배정">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents" value="">
                                        <input type="hidden" name="ruleengcontents" value="">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="환승">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="※ 경유지 당일 연결이 불가한 경우 해당 공항 심야 이용이 불가 할 수 있으므로 반드시 공항 운영 시간 확인 부탁 드립니다.">
                                        <input type="hidden" name="ruleengcontents"
                                               value="※ 경유지 당일 연결이 불가한 경우 해당 공항 심야 이용이 불가 할 수 있으므로 반드시 공항 운영 시간 확인 부탁 드립니다.">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="비행편제한">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="[아래의 항공편 이용]<BR>&amp;nbsp;- 진에어 항공편<BR> ">
                                        <input type="hidden" name="ruleengcontents"
                                               value="BASE FARE<BR> <BR>  THE FARE COMPONENT MUST BE ON<BR>      ONE OR MORE OF THE FOLLOWING<BR>        ANY LJ FLIGHT.">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="신용카드">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="사용가능<BR>-탑승자 본인카드로만 결제 가능하며 공항수속시 결제카드를 확인할수 있습니다.(제시 못할경우 탑승이 거부 될수 있음)">
                                        <input type="hidden" name="ruleengcontents"
                                               value="사용가능<BR>-탑승자 본인카드로만 결제 가능하며 공항수속시 결제카드를 확인할수 있습니다.(제시 못할경우 탑승이 거부 될수 있음)">
                                        <input type="hidden" name="rulegrpnos" value="2" type="hidden"
                                               name="ruletitles"
                                               value="수하물">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="※ 무료수하물 및 초과수하물 규정은 좌석등급 및 노선에 따라 상이하므로 자세한 내용은 항공사 홈페이지 ▦href▦https://www.jinair.com/ready/baggage&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 또는 여행사 담당자에게 문의 부탁드립니다.<BR>※ 항공사 요금규정에 무료수하물 내용이 누락된 경우 표기되지 않을 수 있으며, 표기되지 않은 경우, 해당항공사에 문의 부탁드립니다.<BR>※ 공동운항편, 타항공사 연결편, 24시간 이상 체류 일정, 해외출발 일정, 특수 수하물의 경우 운항항공사에 따라 수하물 규정이 상이할 수 있습니다.">
                                        <input type="hidden" name="ruleengcontents"
                                               value="※ 무료수하물 및 초과수하물 규정은 좌석등급 및 노선에 따라 상이하므로 자세한 내용은 항공사 홈페이지 ▦href▦https://www.jinair.com/ready/baggage&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 또는 여행사 담당자에게 문의 부탁드립니다.<BR>※ 항공사 요금규정에 무료수하물 내용이 누락된 경우 표기되지 않을 수 있으며, 표기되지 않은 경우, 해당항공사에 문의 부탁드립니다.<BR>※ 공동운항편, 타항공사 연결편, 24시간 이상 체류 일정, 해외출발 일정, 특수 수하물의 경우 운항항공사에 따라 수하물 규정이 상이할 수 있습니다.">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="항공사마일리지">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="※ 항공사 마일리지 적립 여부 및 적립률은 운임별/제휴 회원사별로 상이하오니, 자세한 내용은 항공사 홈페이지 ▦href▦https://www.jinair.com/benefit/point&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 또는 여행사 담당자에게 구매 전 문의 부탁드립니다.">
                                        <input type="hidden" name="ruleengcontents"
                                               value="※ 항공사 마일리지 적립 여부 및 적립률은 운임별/제휴 회원사별로 상이하오니, 자세한 내용은 항공사 홈페이지 ▦href▦https://www.jinair.com/benefit/point&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 또는 여행사 담당자에게 구매 전 문의 부탁드립니다.">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="여행업무취급수수료">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="※ 항공권 발권 후 고객의 요청에 따른 취소,변경,환불 등의 작업 필요 시, 여행사에서 취급하는 비용이므로 해당 비용에 대한 문의는 여행사로 하시기 바랍니다.<BR>※ 발권 후 이루어지는 취소,변경,환불 등 모든 후속 업무는 여행사가 항공사를 통해 진행하는 추가 업무입니다. 따라서 이에 대한 여행업무 취급 수수료는 항공사 수수료와 별도로 추가 징수되는 사항이니, 신중한 결제 진행 부탁 드립니다.<BR>※ 여행업무 취급수수료는 항공권을 취소/변경/환불하더라도 환불되지 않습니다.">
                                        <input type="hidden" name="ruleengcontents"
                                               value="※ 항공권 발권 후 고객의 요청에 따른 취소,변경,환불 등의 작업 필요 시, 여행사에서 취급하는 비용이므로 해당 비용에 대한 문의는 여행사로 하시기 바랍니다.<BR>※ 발권 후 이루어지는 취소,변경,환불 등 모든 후속 업무는 여행사가 항공사를 통해 진행하는 추가 업무입니다. 따라서 이에 대한 여행업무 취급 수수료는 항공사 수수료와 별도로 추가 징수되는 사항이니, 신중한 결제 진행 부탁 드립니다.<BR>※ 여행업무 취급수수료는 항공권을 취소/변경/환불하더라도 환불되지 않습니다.">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="비동반 소아 규정">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="※ 비동반 소아 서비스 미제공<BR>※ 만 5세 이상 소아는 만 13세 이상의 보호자와 동반 필수<BR>※ 만 5세 미만의 소아는 만 18세 이상의 성인과 동반 필수">
                                        <input type="hidden" name="ruleengcontents"
                                               value="※ 비동반 소아 서비스 미제공<BR>※ 만 5세 이상 소아는 만 13세 이상의 보호자와 동반 필수<BR>※ 만 5세 미만의 소아는 만 18세 이상의 성인과 동반 필수">
                                        <input type="hidden" name="rulegrpnos" value="2">
                                        <input type="hidden" name="ruletitles" value="항공사 일반규정">
                                        <input type="hidden" name="rulemultitypes" value="">
                                        <input type="hidden" name="rulecontents"
                                               value="※ 상기 모든 수수료는 1인/1회 기준 금액 입니다. <BR><B>※ 예약일과 발권일이 상이한 경우 발권일의 환율에 따라 TAX(유류할증료 포함)가 변동될 수 있습니다.</B><BR>※ 항공사의 사정으로 별도의 공지없이 운임 및 규정이 변경되어 운임 차액이 발생하는 경우 운임차액 추가 징수됩니다.<BR>※ 항공권은 반드시 첫번째 여정부터 순서대로 사용하셔야하며, 순서대로 이용하지 않은 항공권은 취소처리될 수 있으며, 환불불가합니다. <BR>※ 동일 혹은 다수의 여행사를 통해 동일항공편을 이중예약하는 경우, 항공사에 의해 예약취소될 수 있으니 유의해 주시기 바랍니다. <BR>※ 자세한 운송약관은 항공사 홈페이지 ▦href▦https://images.jinair.com/eForm/%EA%B5%AD%EC%A0%9C%EC%97%AC%EA%B0%9D%EC%9A%B4%EC%86%A1%EC%95%BD%EA%B4%80_KOR.pdf?2021525&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 를 통해 확인 부탁드립니다. ">
                                        <input type="hidden" name="ruleengcontents"
                                               value="※ 상기 모든 수수료는 1인/1회 기준 금액 입니다. <BR><B>※ 예약일과 발권일이 상이한 경우 발권일의 환율에 따라 TAX(유류할증료 포함)가 변동될 수 있습니다.</B><BR>※ 항공사의 사정으로 별도의 공지없이 운임 및 규정이 변경되어 운임 차액이 발생하는 경우 운임차액 추가 징수됩니다.<BR>※ 항공권은 반드시 첫번째 여정부터 순서대로 사용하셔야하며, 순서대로 이용하지 않은 항공권은 취소처리될 수 있으며, 환불불가합니다. <BR>※ 동일 혹은 다수의 여행사를 통해 동일항공편을 이중예약하는 경우, 항공사에 의해 예약취소될 수 있으니 유의해 주시기 바랍니다. <BR>※ 자세한 운송약관은 항공사 홈페이지 ▦href▦https://images.jinair.com/eForm/%EA%B5%AD%EC%A0%9C%EC%97%AC%EA%B0%9D%EC%9A%B4%EC%86%A1%EC%95%BD%EA%B4%80_KOR.pdf?2021525&quot; style=&quot;color: red&quot; target=&quot;_blank&quot;>[바로가기]</a> 를 통해 확인 부탁드립니다. ">
                                        <input type="hidden" name="artruleelyn" value="">
                                        <input type="hidden" name="artgdsruleyn" value="">
                                    </div>
                                </div>
                            </div>

                            <div id="rule3" class="w3-container agreeMenu w3-padding-48 w3-card">
                                <legend><span id="refundruletit2">결제규정</span>약관</legend>
                                <div id="refundrule" class="k1_agreebox" style="word-wrap:break-word;"><b>
                                    <span class="detail_boldb">▶ 발권 수수료</span>
                                </b><br>발권수수료는 항공권 금액과 별도로 님부스 가맹으로 결제되며, 할부로 결제를 요청하시더라도 발권수수료가 5만원 미만일
                                    경우에는 일시불로 결제됩니다.
                                    <br><br><b>
                                        <span class="detail_boldb">▶스페셜 세트 상품</span>
                                    </b><br>스페셜 세트 상품은 출국편 / 귀국편 2개의 예약번호로 예약과 동시에 각각 <b>총 2회 결제</b>가 진행됩니다.
                                    <br>출국편 / 귀국편 중 1개의
                                    예약만 진행되었을 경우 예약은 취소될 수 있어요. <br><br><b>
                                        <span class="detail_boldb">▶즉시결제(스카이스캐너)</span>
                                    </b><br>결제 요청한 시점 기준 1~2일 내 결제와 발권이 진행됩니다. <b>미확정 요금일 경우
                                        <span class="detail_boldr">결제 진행이 되지 않을
                                        경우 예약이 취소</span>될 수 있어요.</b><br><br><b>
                                        <span class="detail_boldb">▶운임변동 </span>
                                    </b><br>-항공권 예약 시 조회되는 유류할증료와 제세공과금은 결제 시점의 환율에 따라 변경될 수 있어요. 환율은 항공 시스템의
                                    기준을 따르므로 타 사이트에서
                                    검색한 환율과 다를 수 있어요.<br>
                                    <span class="detail_boldr">※유류할증료 인상으로 차액이 발생할 경우 추가 결제가 필요할 수 있으며, 인상된 금액 미결제 시 예약은
                                    취소될 수 있습니다.
                                    </span><br><br><b>
                                        <span class="detail_boldb">▶결제요청 </span>
                                    </b><br>-결제요청 시 예약 과정에서 입력한 탑승객 정보로 항공 스케줄을 이용하는 것으로 간주됩니다. <br>-결제요청 후 최대
                                    48시간 이내 결제 및 발권되어
                                    E-ticket이 예약 시 기재한 이메일로 발송됩니다. <br>-결제요청 후 취소/변경 시에는 정상적인 취소/변경 패널티와 여행사
                                    취급수수료가 부과됩니다.
                                    <br><br><b>
                                        <span class="detail_boldb">▶현금영수증 </span>
                                    </b><br>-결제 화면에서 현금 결제 시 현금영수증 신청이 가능하며, 발권일로부터 영업일 기준 5일 이내 발급됩니다. 사업자번호로
                                    신청하시는 경우 지출증빙용으로
                                    발급됩니다.<br>-각 승객별로 발급을 원하실 경우, 고객지원실을 통해 요청해 주세요. <br>-아래 항공사는 항공사 사정으로 현금영수증
                                    발급이 불가능해요.
                                    <br>(발급 불가 항공사: 하와이안항공, 브루나이항공, 라탐항공, 란칠레항공, 로얄에어모로코, 그레이터베이항공) <br><br><b>
                                        <span class="detail_boldb">▶결제수단 </span>
                                    </b><br>-항공권 발권 이후 결제수단 변경은 불가합니다. (카드 → 현금, 할부개월 수 변경 등) 결제수단 변경이 필요할 경우 환불
                                    후 재구매 해주셔야 하며,
                                    이 경우 정상적인 환불 규정이 적용됩니다. <br>-항공사와 카드사 간 가맹점 계약에 따라 항공권 결제 수단에 제한이 있을 수 있어요.
                                    <br>ex) 비엣젯항공:
                                    국민카드, 씨티카드 불가 <br>홍콩항공: 하나카드, 해외발행카드 불가 <br>라오항공, 스쿠트항공: 현금결제만 가능, 카드결제
                                    불가<br><br><b>
                                        <span class="detail_boldb">▶카드 프로모션 </span>
                                    </b><br> 선불카드, 법인카드를 포함한 일부 카드는 프로모션에 해당하는 카드사의 카드일지라도 프로모션 계약에 따라 결제가 불가능할
                                    수 있어요.
                                    <br><br><b>
                                        <span class="detail_boldb">▶결제오류 </span>
                                    </b><br>한도 초과, 잔액 부족, 결제 불가, 도난 및 분실카드 등 결제가 불가능한 경우에는 결제요청이 자동으로 취소될 수 있어요.
                                    결제시한 내 재결제하시거나,
                                    결제시한이 지난 경우 재예약 해주세요. <br><br><b>
                                        <span class="detail_boldb">▶무이자 할부 </span>
                                    </b><br>카드결제 시 무이자할부 혜택은 각 항공사와 카드사 간 계약에 따라 고지없이 변동될 수 있어요. 정확한 혜택은 각 카드사를
                                    통해 확인해 주세요.
                                    <br><br><b>
                                        <span class="detail_boldb">▶제3자 카드결제 </span>
                                    </b><br>-항공권은 본인, 동반인, 예약자, 가족이 아닌 제 3자의 카드로 결제가 불가능하며, 경우에 따라 카드 소유자 확인을 위한
                                    증빙서류를 요구할 수
                                    있습니다. 결제시한 내 증빙서류 미제출 시 결제는 진행되지 않으며 예약이 취소될 수 있어요. <br>-제 3자 카드결제로 인한 항공사의
                                    탑승 거절 등의 불이익 발생
                                    시 님부스에서는 책임지지 않습니다. <br>
                                </div>
                            </div>

                            <div id="rule4" class="w3-container agreeMenu w3-padding-48 w3-card">
                                <legend><span id="paymentruletit2">환불/변경</span>약관</legend>
                                <div id="paymentrule" class="k1_agreebox" style="word-wrap:break-word;">
                                <span style="color: #FF0000; ">&lt; 변경 / 환불 접수 가능시간 &gt;<br>- <b>변경 : 09:00 ~ 17:00
                                    (월-금) </b> <br> *
                                    평일 오후 17시 이후는 항공사 승인업무 종료로 인하여 변경 접수가 불가합니다. <br> * 모든 변경처리(영문/일정)는
                                    출발시간(한국시간 기준) 3시간
                                    전까지만 가능(영업시간 이내)<br><br>- <b>환불 : 09:00 ~ 17:00 (월-금) </b> <br> * 유선 또는
                                    발권완료 페이지 &gt;
                                    "환불요청" 버튼을 통해 요청이 가능합니다.</span><br><br><b>
                                    <span class="detail_boldb">▶환불/변경 접수 가능시간 외</span>에 접수된 환불/변경 요청은 익일 영업시간에 처리
                                    되며, 항공사
                                    (취소)수수료는 접수일이 아닌 처리일 기준으로 적용됩니다. 접수 가능시간 외에 결제요청시 유의 바랍니다.
                                </b><br>단, 다음 사항은 예외적으로 각 항목에서 정한 내용에 따릅니다.<br><br>1) 결제 당일 23:50(한국시간)까지 취소
                                    요청한 경우(이하 ‘당일
                                    취소’), 항공사 (취소)수수료 및 여행사 취급(환불)수수료 면제. 단, 당일 취소 정책을 미적용하는 <b>그레이터베이항공(HB)의
                                    항공권은 해당
                                    없음</b><br>2) 결제한 때로부터 24시간 내 취소를 허용하는 항공사의 항공권에 대해 결제 한 때로부터 24시간 이내 취소
                                    요청한 경우 항공사
                                    (취소)수수료 면제. 이 때, 각 항공사별로 취소를 위한 추가적인 요건이 있는 경우, 해당 요건도 충족이 되어야 함. <br>결제한
                                    때로부터 24시간 내 취소를 허용
                                    하는 항공사 및 각 항공사의 구체적인 정책은 아래와 같음<br><br><b>※ 결제한 때로부터 24시간 이내 취소 시 항공사
                                    (취소)수수료가 면제(이하
                                    “면제지침”)되는 항공사</b><br>→아메리칸 항공(AA), 에어캐나다 (AC), 에어프랑스(AF), KLM네덜란드(KL),
                                    델타항공(DL),
                                    에티하드항공(EY), 대한항공(KE), 진에어(LJ), 폴란드항공(LO), 루프트한자 독일항 공(LH), ANA항공(NH),
                                    에어뉴질랜드(NZ),
                                    아시아나항공(OZ), 에어서울(RS), 티웨이항공(TW), 유나이티드항공(UA), 제주항공(7C), 에어프레미아(YP),
                                    이스타항공(ZE), 하와 이안항공(HA),
                                    일본항공(JL), 에어부산(BX)<br>
                                    <span class="detail_boldr">단, 아시아나 항공(OZ), 하와이안항공(HA), 에티하드 항공(EY), ANA항공(NH) 은
                                        출발일 7일 이전 발권된
                                        항공권에 대해서만 면제지침 적용됨</span><br><br><b>
                                    <span class="detail_boldb">▶발권수수료 </span>
                                </b><br>항공권 결제 시 항공료와 별도로 결제 시 발생한 발권수수료는 항공권을 취소하거나 변경하더라도 환불되지 않아요.
                                    <b>천재지변이나 항공사 사정에 의한
                                        스케줄 변경, 취소 시에도 동일 적용됩니다. </b><br><br> <b>
                                    <span class="detail_boldb">▶환불/변경 수수료 </span>
                                </b><br>님부스을 통해 구매한 항공권을 변경하거나 환불할 때에는 각 예약번호마다 항공사 수수료와 여행사 취급수수료가 각각
                                    발생하며, 이 수수료들은 환불되지
                                    않아요.<br> - 항공사 수수료 : 항공권 운임규정 중 변경/환불 규정을 확인해주세요. <br> - 여행사 수수료<br> <b>*
                                    변경(일정변경, 영문성명 변경)
                                    시</b> : 1인당 3만원 (성인/소아/유아 동일)<br> <b>* 환불 시</b> : 1인당 3만원 (성인/소아 동일) |
                                    1인당 1만원
                                    (유아)<br><br> <b>
                                    <span class="detail_boldb">▶환급 기간 </span>
                                </b><br>항공권 환불은 항공사와의 확인, 보고 절차 및 정산기간을 거치게 되어 환불 접수일로부터 약 14일 가량 소요됩니다.
                                    항공사의 승인 또는 협의가 지연되는
                                    경우 추가 소요될 수 있으며, 이 경우 고객님께 별도 통지하여 안내합니다. 또한 카드 환불의 경우 고객 결제일에 따라 환불기간이 달라질
                                    수 있습니다. <br><br>
                                    <b>
                                        <span class="detail_boldb">▶NO-SHOW</span>
                                    </b><br>출발 2일 전까지 변경이나 취소 없이 항공기 미 탑승시에는 예약부도(NO-SHOW) 처리되어 항공권의 변경 및 환불이
                                    불가할 수 있어요. 개인사정으로
                                    항공기 탑승이 어려우실 경우 사전에 고객지원실로 변경 또는 환불을 요청해주세요. <br><br> <b>
                                    <span class="detail_boldb">▶부분 미탑승 </span>
                                </b><br>-모든 항공권은 항공권에 표기된 일정의 순서대로 사용해야 해요. 만약 첫 구간을 사용하지 않았을 경우 이후 일정의 탑승이
                                    불가합니다. <br>-전체
                                    일정 중 부분 이용 후 나머지 구간에 대해 환불을 요청하실 경우 환불금이 적거나 없을 수 있어요. <br><br> <b>
                                    <span class="detail_boldb">▶환율적용 </span>
                                </b><br>해외 통화 기준의 패널티는 항공 시스템 상의 환율 기준으로 한화(KRW)로 계산되며, 타 사이트에서 검색한 환율과 다를 수
                                    있어요.
                                    <br><br><b>
                                    <span class="detail_boldb">▶패널티면제 </span>
                                </b><br>-질병/임신/사망 등의 이유로 환불하고자 할 경우 환불요청 전 고객지원실을 통해 면제 가능여부를 확인해
                                    주세요.<br>-단, 항공사 규정에 따라 항공사
                                    수수료 면제 여부가 다를 수 있어요. 만약 항공사의 면제지침에 해당하지 않는다면 정상적인 환불 규정이 적용됩니다.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="js/javascript.js"></script>
<script>
    function openMenu(evt, agreeMenuName) {
        var i, x, tablinks;
        x = document.getElementsByClassName("agreeMenu");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("agreeTablink");
        for (i = 0; i < x.length; i++) {
            tablinks[i].style.color = ""; // 기존 글자색 제거
        }
        document.getElementById(agreeMenuName).style.display = "block";
        // 외부 스타일 가져오기
        var computedStyle = window.getComputedStyle(evt.currentTarget.firstElementChild);
        var linkColor = computedStyle.getPropertyValue('--primary_02');

        evt.currentTarget.firstElementChild.style.color = linkColor; // 가져온 색상으로 클릭한 탭의 글자색 지정
    }

    document.getElementById("agreeMyLink").click();

</script>
<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp" %>