<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header.jsp -->
<%@ include file="layout/header.jsp" %>

<!-- TODO 여기서부터 main영역 -->
<div class="nav_bg">
    <div class="container">
        <div class="flight_ticket">
            <div class="flight_ticket_title">
                <h3>항공권 예매</h3>
            </div>
            <div class="flight_ticket_box">
                <form class="d-flex">
                    <input type="text" id="datepicker" placeholder="날짜 및 시간 선택">
                    <input class="form-control me-2" type="text" placeholder="검색어를 입력해주세요">
                    <button class="btn btn-primary" type="submit">검색</button>
                </form>
            </div>

        </div>
        <div class="col-sm-8">
            <h2>TITLE HEADING</h2>
            <h5>Title description, Dec 7, 2017</h5>
            <div class="fakeimg">Fake Image</div>
            <p>Some text..</p>
            <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
            <br>
            <h2>TITLE HEADING</h2>
            <h5>Title description, Sep 2, 2017</h5>
            <div class="fakeimg">Fake Image</div>
            <p>Some text..</p>
            <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
        </div>

        <!-- Content -->
        <div class="w3-content" style="max-width:1100px;margin-top:80px;margin-bottom:80px">

            <div class="w3-panel">
                <h1><b>MARKETING</b></h1>
                <p>Template by w3.css</p>
            </div>

            <!-- Slideshow -->
            <div class="w3-container">
                <div class="w3-display-container mySlides">
                    <img src="/w3images/coffee.jpg" style="width:100%">
                    <div class="w3-display-topleft w3-container w3-padding-32">
                        <span class="w3-white w3-padding-large w3-animate-bottom">Lorem ipsum</span>
                    </div>
                </div>
                <div class="w3-display-container mySlides">
                    <img src="/w3images/workbench.jpg" style="width:100%">
                    <div class="w3-display-middle w3-container w3-padding-32">
                        <span class="w3-white w3-padding-large w3-animate-bottom">Klorim tipsum</span>
                    </div>
                </div>
                <div class="w3-display-container mySlides">
                    <img src="/w3images/sound.jpg" style="width:100%">
                    <div class="w3-display-topright w3-container w3-padding-32">
                        <span class="w3-white w3-padding-large w3-animate-bottom">Blorum pipsum</span>
                    </div>
                </div>

                <!-- Slideshow next/previous buttons -->
                <div class="w3-container w3-dark-grey w3-padding w3-xlarge">
                    <div class="w3-left" onclick="plusDivs(-1)"><i class="fa fa-arrow-circle-left w3-hover-text-teal"></i></div>
                    <div class="w3-right" onclick="plusDivs(1)"><i class="fa fa-arrow-circle-right w3-hover-text-teal"></i></div>

                    <div class="w3-center">
                        <span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
                        <span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
                        <span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
                    </div>
                </div>
            </div>

            <!-- Grid -->
            <div class="w3-row w3-container">
                <div class="w3-center w3-padding-64">
                    <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">What We Offer</span>
                </div>
                <div class="w3-col l3 m6 w3-light-grey w3-container w3-padding-16">
                    <h3>Design</h3>
                    <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
                </div>

                <div class="w3-col l3 m6 w3-grey w3-container w3-padding-16">
                    <h3>Branding</h3>
                    <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
                </div>

                <div class="w3-col l3 m6 w3-dark-grey w3-container w3-padding-16">
                    <h3>Consultation</h3>
                    <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
                </div>

                <div class="w3-col l3 m6 w3-black w3-container w3-padding-16">
                    <h3>Promises</h3>
                    <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
                </div>
            </div>

            <!-- Grid -->
            <div class="w3-row-padding" id="plans">
                <div class="w3-center w3-padding-64">
                    <h3>Pricing Plans</h3>
                    <p>Choose a pricing plan that fits your needs.</p>
                </div>

                <div class="w3-third w3-margin-bottom">
                    <ul class="w3-ul w3-border w3-center w3-hover-shadow">
                        <li class="w3-black w3-xlarge w3-padding-32">Basic</li>
                        <li class="w3-padding-16"><b>10GB</b> Storage</li>
                        <li class="w3-padding-16"><b>10</b> Emails</li>
                        <li class="w3-padding-16"><b>10</b> Domains</li>
                        <li class="w3-padding-16"><b>Endless</b> Support</li>
                        <li class="w3-padding-16">
                            <h2 class="w3-wide">$ 10</h2>
                            <span class="w3-opacity">per month</span>
                        </li>
                        <li class="w3-light-grey w3-padding-24">
                            <button class="w3-button w3-green w3-padding-large">Sign Up</button>
                        </li>
                    </ul>
                </div>

                <div class="w3-third w3-margin-bottom">
                    <ul class="w3-ul w3-border w3-center w3-hover-shadow">
                        <li class="w3-dark-grey w3-xlarge w3-padding-32">Pro</li>
                        <li class="w3-padding-16"><b>25GB</b> Storage</li>
                        <li class="w3-padding-16"><b>25</b> Emails</li>
                        <li class="w3-padding-16"><b>25</b> Domains</li>
                        <li class="w3-padding-16"><b>Endless</b> Support</li>
                        <li class="w3-padding-16">
                            <h2 class="w3-wide">$ 25</h2>
                            <span class="w3-opacity">per month</span>
                        </li>
                        <li class="w3-light-grey w3-padding-24">
                            <button class="w3-button w3-green w3-padding-large">Sign Up</button>
                        </li>
                    </ul>
                </div>

                <div class="w3-third w3-margin-bottom">
                    <ul class="w3-ul w3-border w3-center w3-hover-shadow">
                        <li class="w3-black w3-xlarge w3-padding-32">Premium</li>
                        <li class="w3-padding-16"><b>50GB</b> Storage</li>
                        <li class="w3-padding-16"><b>50</b> Emails</li>
                        <li class="w3-padding-16"><b>50</b> Domains</li>
                        <li class="w3-padding-16"><b>Endless</b> Support</li>
                        <li class="w3-padding-16">
                            <h2 class="w3-wide">$ 50</h2>
                            <span class="w3-opacity">per month</span>
                        </li>
                        <li class="w3-light-grey w3-padding-24">
                            <button class="w3-button w3-green w3-padding-large">Sign Up</button>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- Grid -->
            <div class="w3-row-padding" id="about">
                <div class="w3-center w3-padding-64">
                    <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">Who We Are</span>
                </div>

                <div class="w3-third w3-margin-bottom">
                    <div class="w3-card-4">
                        <img src="/w3images/team1.jpg" alt="John" style="width:100%">
                        <div class="w3-container">
                            <h3>Jane Doe</h3>
                            <p class="w3-opacity">CEO & Founder</p>
                            <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
                            <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
                        </div>
                    </div>
                </div>

                <div class="w3-third w3-margin-bottom">
                    <div class="w3-card-4">
                        <img src="/w3images/team2.jpg" alt="Mike" style="width:100%">
                        <div class="w3-container">
                            <h3>Mike Ross</h3>
                            <p class="w3-opacity">Art Director</p>
                            <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
                            <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
                        </div>
                    </div>
                </div>

                <div class="w3-third w3-margin-bottom">
                    <div class="w3-card-4">
                        <img src="/w3images/team3.jpg" alt="Jane" style="width:100%">
                        <div class="w3-container">
                            <h3>John Doe</h3>
                            <p class="w3-opacity">Designer</p>
                            <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
                            <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Grid -->
            <div class="w3-row-padding" id="about">
                <div class="w3-center w3-padding-64">
                    <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">Who We Are</span>
                </div>

                <div class="w3-third w3-margin-bottom">
                    <div class="w3-card-4">
                        <img src="/w3images/team1.jpg" alt="John" style="width:100%">
                        <div class="w3-container">
                            <h3>Jane Doe</h3>
                            <p class="w3-opacity">CEO & Founder</p>
                            <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
                            <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
                        </div>
                    </div>
                </div>

                <div class="w3-third w3-margin-bottom">
                    <div class="w3-card-4">
                        <img src="/w3images/team2.jpg" alt="Mike" style="width:100%">
                        <div class="w3-container">
                            <h3>Mike Ross</h3>
                            <p class="w3-opacity">Art Director</p>
                            <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
                            <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
                        </div>
                    </div>
                </div>

                <div class="w3-third w3-margin-bottom">
                    <div class="w3-card-4">
                        <img src="/w3images/team3.jpg" alt="Jane" style="width:100%">
                        <div class="w3-container">
                            <h3>John Doe</h3>
                            <p class="w3-opacity">Designer</p>
                            <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
                            <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
</div>
</div>
<script src="js/javascript.js"></script>
<!-- header.jsp -->
<%@ include file="layout/footer.jsp" %>