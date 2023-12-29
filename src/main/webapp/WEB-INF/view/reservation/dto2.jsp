티켓데이터
DataDTO
(
  type=flight-offer,
  id=1,
  oneWay=false,
  numberOfBookableSeats=9,
  itineraries=
  [
    ItinerariesDTO
    (
      duration=2시간 ,
      segments=
      [
        SegmentDTO
        (
          id=null,
          departure=DepartureDTO
          (
            iataCode=GMP,
            terminal=I,
            at=2023-12-29T12:25:00,
            cityName=서울
          ),
          arrival=ArrivalDTO
          (
            iataCode=HND,
            terminal=null,
            at=2023-12-29T14:25:00,
            cityName=도쿄
          ),
          carrierCode=NH,
          number=864,
          airlineName=ANA항공,
          aircraft=AirCraftDTO
          (
            code=788
          ),
          stops=null
        )
      ]
    ),
    ItinerariesDTO
    (
      duration=2시간 35분,
      segments=
      [
        SegmentDTO
        (
          id=null,
          departure=DepartureDTO(iataCode=HND,
          terminal=3,
          at=2023-12-31T08:50:00,
          cityName=도쿄
        ),
        arrival=ArrivalDTO
        (
          iataCode=GMP,
          terminal=I,
          at=2023-12-31T11:25:00,
          cityName=서울
        ),
        carrierCode=NH,
        number=861,
        airlineName=ANA항공,
        aircraft=AirCraftDTO
        (code=788), stops=null)])],

price=PriceDTO(grandTotal=888,800, base=610,500, oilPrice=194,810, tax=55,660, fee=27,830, peopleCount=0),
travelerPricings=[
TravelerPricingDTO(travelerId=1, fareOption=STANDARD, travelerType=ADULT,
price=PerPersonPriceDTO(total=470,600, base=330,000, oilPrice=98,420, tax=28,120, fee=14,060),
fareDetailsBySegment=
[FareDetailsBySegmentDTO(segmentId=2, cabin=ECONOMY, includedCheckedBags=IncludedCheckedBagsDTO(quantity=2, weight=null, weightUnit=null)),
FareDetailsBySegmentDTO(segmentId=13, cabin=ECONOMY, includedCheckedBags=IncludedCheckedBagsDTO(quantity=2, weight=null, weightUnit=null))]),

TravelerPricingDTO(travelerId=2, fareOption=STANDARD, travelerType=CHILD,
price=PerPersonPriceDTO(total=374,600, base=247,500, oilPrice=88,970, tax=25,420, fee=12,710),
fareDetailsBySegment=[FareDetailsBySegmentDTO(segmentId=2, cabin=ECONOMY, includedCheckedBags=null),
FareDetailsBySegmentDTO(segmentId=13, cabin=ECONOMY, includedCheckedBags=null)]),

TravelerPricingDTO(travelerId=3, fareOption=STANDARD, travelerType=HELD_INFANT,
price=PerPersonPriceDTO(total=43,600, base=33,000, oilPrice=7,420, tax=2,120, fee=1,060),
fareDetailsBySegment=[FareDetailsBySegmentDTO(segmentId=2, cabin=ECONOMY, includedCheckedBags=null),
FareDetailsBySegmentDTO(segmentId=13, cabin=ECONOMY, includedCheckedBags=null)])])


dto 체크체크
ReservationRequest.SaveFormDto(resName=성민경, email=wildlegion@naver.com, phoneNum=01030013108, passengerAmount=1, paymentDeadline=null, reservationPrice=null, firstName=MINKYEONG, lastName=SUNG, birthDate=22/05/1991, gender=male, passengerType=성인, tickets=null, optionMessage=N)
Creating a new SqlSession


[TravelerPricingDTO
(travelerId=1, fareOption=STANDARD, travelerType=ADULT,
  price=PerPersonPriceDTO(total=470,600, base=330,000, oilPrice=98,420, tax=28,120, fee=14,060),
  fareDetailsBySegment=
    [FareDetailsBySegmentDTO(segmentId=2, cabin=ECONOMY,
    includedCheckedBags=IncludedCheckedBagsDTO(quantity=2, weight=null, weightUnit=null)),
    FareDetailsBySegmentDTO(segmentId=13, cabin=ECONOMY,
    includedCheckedBags=IncludedCheckedBagsDTO(quantity=2, weight=null, weightUnit=null))]),

TravelerPricingDTO(travelerId=2, fareOption=STANDARD, travelerType=CHILD,
price=PerPersonPriceDTO(total=374,600, base=247,500, oilPrice=88,970, tax=25,420, fee=12,710), fareDetailsBySegment=[FareDetailsBySegmentDTO(segmentId=2, cabin=ECONOMY, includedCheckedBags=null), FareDetailsBySegmentDTO(segmentId=13, cabin=ECONOMY, includedCheckedBags=null)]), TravelerPricingDTO(travelerId=3, fareOption=STANDARD, travelerType=HELD_INFANT, price=PerPersonPriceDTO(total=43,600, base=33,000, oilPrice=7,420, tax=2,120, fee=1,060), fareDetailsBySegment=[FareDetailsBySegmentDTO(segmentId=2, cabin=ECONOMY, includedCheckedBags=null), FareDetailsBySegmentDTO(segmentId=13, cabin=ECONOMY, includedCheckedBags=null)])]
