<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>호스팅을 시작해 보세요</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/hostingstyle.css">
</head>
<body>

	<!-- 로고 홈링크 -->
	<div id="logo-link">
		<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"	aria-label="에어비앤비 홈페이지" role="img" focusable="false">
		<path d="M16 1c2.008 0 3.463.963 4.751 3.269l.533 1.025c1.954 3.83 6.114 12.54 7.1 14.836l.145.353c.667 1.591.91 2.472.96 3.396l.01.415.001.228c0 4.062-2.877 6.478-6.357 6.478-2.224 0-4.556-1.258-6.709-3.386l-.257-.26-.172-.179h-.011l-.176.185c-2.044 2.1-4.267 3.42-6.414 3.615l-.28.019-.267.006C5.377 31 2.5 28.584 2.5 24.522l.005-.469c.026-.928.23-1.768.83-3.244l.216-.524c.966-2.298 6.083-12.989 7.707-16.034C12.537 1.963 13.992 1 16 1zm0 2c-1.239 0-2.053.539-2.987 2.21l-.523 1.008c-1.926 3.776-6.06 12.43-7.031 14.692l-.345.836c-.427 1.071-.573 1.655-.605 2.24l-.009.33v.206C4.5 27.395 6.411 29 8.857 29c1.773 0 3.87-1.236 5.831-3.354-2.295-2.938-3.855-6.45-3.855-8.91 0-2.913 1.933-5.386 5.178-5.42 3.223.034 5.156 2.507 5.156 5.42 0 2.456-1.555 5.96-3.855 8.907C19.277 27.766 21.37 29 23.142 29c2.447 0 4.358-1.605 4.358-4.478l-.004-.411c-.019-.672-.17-1.296-.714-2.62l-.248-.6c-1.065-2.478-5.993-12.768-7.538-15.664C18.053 3.539 17.24 3 16 3zm.01 10.316c-2.01.021-3.177 1.514-3.177 3.42 0 1.797 1.18 4.58 2.955 7.044l.21.287.174-.234c1.73-2.385 2.898-5.066 2.989-6.875l.006-.221c0-1.906-1.167-3.4-3.156-3.421h-.001z"></path>
	</svg>
	</div>

	<!-- 왼쪽 호스팅 시작하기 영역 -->
	<div id="starting-host" class="position-relative">
		<div class="text-center bg-black" id="left-div">
			<div class="align-self-center d-inline">
				<div role="text" class="left-main-text text-white fw-bold">
					호스팅을 <br> 시작해 보세요
				</div>
				<c:if test="${not empty LOGIN_USER }">
				${LOGIN_USER }
				<button type="button" class="btn text-white"
					style="background-color: #FF385C;"
					onclick="location.href='/host/become-a-host';">호스팅을 시작하기</button>
				</c:if>
				<c:if test="${empty LOGIN_USER }">				${LOGIN_USER }
				<button type="button" id="btn-open-form-modal" class="btn text-white"
					style="background-color: #FF385C;" onclick="">로그인하고 호스팅을 시작하기</button>
				</c:if>
			</div>
		</div>

		<!-- 오른쪽 동영상 영역 -->
		<div id="right-div">
			<div class="align-self-center">
				<!-- 동영상 -->
				<video class="host-video" autoplay controls muted
					crossorigin="anonymous" playsinline="" preload="auto"
					style="object-fit: cover; object-position: center top;">
					<source
						src="https://a0.muscache.com/v/a9/a7/a9a7873c-95de-5e37-8995-a5abb5b6b02f/a9a7873c95de5e378995a5abb5b6b02f_4000k_1.mp4?imformat=h265"
						type="video/mp4; codecs=hevc">
					<source
						src="https://a0.muscache.com/v/a9/a7/a9a7873c-95de-5e37-8995-a5abb5b6b02f/a9a7873c95de5e378995a5abb5b6b02f_4000k_1.mp4"
						type="video/mp4">
				</video>
				<!-- 동영상 재생 버튼 -->
				<div class="host-video-btn-div">
					<button aria-label="재생" type="button" class="hostVideoBtn">
						<span class=""><svg viewBox="0 0 32 32"
								xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
								role="presentation" focusable="false"
								style="display: block; height: 16px; width: 16px; fill: white;">
								<path d="M27.024 14.273L6.008 2.013c-.461-.268-1-.342-1.517-.206A2 2 0 0 0 3 3.741V28.26a2.002 2.002 0 0 0 3.008 1.728l21.015-12.26a2.003 2.003 0 0 0 .001-3.454z"></path></svg></span>
					</button>
				</div>

				<!-- 호스트 이름 -->
				<div class="hostName">chelsea</div>

				<!-- ~~의 호스트 -->
				<div>필라델피아의 호스트</div>
			</div>
		</div>

	</div>




<!-- 호스팅 홍보 -->
<%-- <div>
호스팅 홍보 영역
<iframe height="0" width="0" style="display: ; visibility: ;" src="//4620401.fls.doubleclick.net/activityi;src=4620401;type=gen;cat=airbn0;ord=1;num=9235793379026;gtm=2wg7p0;auiddc=1718786489.1658132184;u21=visitor;u22=true;u34=0;~oref=https%3A%2F%2Fwww.airbnb.co.kr%2Fhost%2Fhomes?"></iframe>
</div>

<!-- 호스팅 관련 질문 -->
<div>
호스팅 관련 질문 영역
</div>

<!-- 슈퍼호스트에게 물어보세요 -->
<div>
슈퍼호스트 영역

</div>

<!-- 에어커버 자세히 알아보기 -->
<div>
에어커버 영역

</div>

<!-- 호스팅 시작하기 2 -->
<div>
호스팅 시작하기 2
</div>

<!-- 푸터 -->
<div>
푸터 영역
<%@ include file="common/footer.jsp" %>
</div> --%>



<!-- 모달 html -->
<div class="modal" id="modal-form-login">
	<div class="modal-lg modal-dialog modal-dialog-centered">
		<div class="modal-content modal-context-box">
			<div class="modal-btn-close-box">
				<button type="button" class="btn-close modal-btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-header">
				<p class="fs-6 fw-bold m-0">로그인 또는 회원가입</p>
			</div>
			<div class="modal-body p-4">
				<div class="modal-welcome-message-box">
					<h3 class="modal-welcome-message">에어비앤비에 오신 것을 환영합니다.</h3>
				</div>
				<form class="row g-3">
					<div class="form-floating">
						<select data-testid="" class="form-select" id="floatingSelectCountry" aria-label="">
							<option value="242CG">콩고 (+242)</option>
							<option value="243CD">콩고 민주 공화국 (+243)</option>
							<option value="852HK">홍콩 (+852)</option>
							<option value="383XK">코소보 (+383)</option>
							<option value="853MO">마카오 (+853)</option>
							<option value="389MK">북마케도니아 (+389)</option>
							<option value="886TW">대만 (+886)</option>
							<option value="233GH">가나 (+233)</option>
							<option value="241GA">가봉 (+241)</option>
							<option value="592GY">가이아나 (+592)</option>
							<option value="220GM">감비아 (+220)</option>
							<option value="44GG">건지 (+44)</option>
							<option value="590GP">과들루프 (+590)</option>
							<option value="502GT">과테말라 (+502)</option>
							<option value="1GU">괌 (+1)</option>
							<option value="1GD">그레나다 (+1)</option>
							<option value="30GR">그리스 (+30)</option>
							<option value="299GL">그린란드 (+299)</option>
							<option value="224GN">기니 (+224)</option>
							<option value="245GW">기니비사우 (+245)</option>
							<option value="264NA">나미비아 (+264)</option>
							<option value="674NR">나우루 (+674)</option>
							<option value="234NG">나이지리아 (+234)</option>
							<option value="211SS">남수단 (+211)</option>
							<option value="27ZA">남아프리카 (+27)</option>
							<option value="31NL">네덜란드 (+31)</option>
							<option value="599BQ">네덜란드령 카리브 (+599)</option>
							<option value="977NP">네팔 (+977)</option>
							<option value="47NO">노르웨이 (+47)</option>
							<option value="672NF">노퍽섬 (+672)</option>
							<option value="64NZ">뉴질랜드 (+64)</option>
							<option value="687NC">뉴칼레도니아 (+687)</option>
							<option value="683NU">니우에 (+683)</option>
							<option value="227NE">니제르 (+227)</option>
							<option value="505NI">니카라과 (+505)</option>
							<option value="45DK">덴마크 (+45)</option>
							<option value="1DM">도미니카 (+1)</option>
							<option value="1DO">도미니카 공화국 (+1)</option>
							<option value="49DE">독일 (+49)</option>
							<option value="670TL">동티모르 (+670)</option>
							<option value="856LA">라오스 (+856)</option>
							<option value="231LR">라이베리아 (+231)</option>
							<option value="371LV">라트비아 (+371)</option>
							<option value="7RU">러시아 (+7)</option>
							<option value="961LB">레바논 (+961)</option>
							<option value="266LS">레소토 (+266)</option>
							<option value="40RO">루마니아 (+40)</option>
							<option value="352LU">룩셈부르크 (+352)</option>
							<option value="250RW">르완다 (+250)</option>
							<option value="218LY">리비아 (+218)</option>
							<option value="262RE">리유니온 (+262)</option>
							<option value="370LT">리투아니아 (+370)</option>
							<option value="423LI">리히텐슈타인 (+423)</option>
							<option value="261MG">마다가스카르 (+261)</option>
							<option value="596MQ">마르티니크 (+596)</option>
							<option value="692MH">마셜 제도 (+692)</option>
							<option value="262YT">마요트 (+262)</option>
							<option value="265MW">말라위 (+265)</option>
							<option value="60MY">말레이시아 (+60)</option>
							<option value="223ML">말리 (+223)</option>
							<option value="44IM">맨 섬 (+44)</option>
							<option value="52MX">멕시코 (+52)</option>
							<option value="377MC">모나코 (+377)</option>
							<option value="212MA">모로코 (+212)</option>
							<option value="230MU">모리셔스 (+230)</option>
							<option value="222MR">모리타니 (+222)</option>
							<option value="258MZ">모잠비크 (+258)</option>
							<option value="382ME">몬테네그로 (+382)</option>
							<option value="1MS">몬트세라트 (+1)</option>
							<option value="373MD">몰도바 (+373)</option>
							<option value="960MV">몰디브 (+960)</option>
							<option value="356MT">몰타 (+356)</option>
							<option value="976MN">몽골 (+976)</option>
							<option value="1US">미국 (+1)</option>
							<option value="1VI">미국령 버진아일랜드 (+1)</option>
							<option value="95MM">미얀마 (+95)</option>
							<option value="691FM">미크로네시아 (+691)</option>
							<option value="678VU">바누아투 (+678)</option>
							<option value="973BH">바레인 (+973)</option>
							<option value="1BB">바베이도스 (+1)</option>
							<option value="379VA">바티칸 시국 (+379)</option>
							<option value="1BS">바하마 (+1)</option>
							<option value="880BD">방글라데시 (+880)</option>
							<option value="1BM">버뮤다 (+1)</option>
							<option value="229BJ">베냉 (+229)</option>
							<option value="58VE">베네수엘라 (+58)</option>
							<option value="84VN">베트남 (+84)</option>
							<option value="32BE">벨기에 (+32)</option>
							<option value="375BY">벨라루스 (+375)</option>
							<option value="501BZ">벨리즈 (+501)</option>
							<option value="387BA">보스니아 헤르체고비나 (+387)</option>
							<option value="267BW">보츠와나 (+267)</option>
							<option value="591BO">볼리비아 (+591)</option>
							<option value="257BI">부룬디 (+257)</option>
							<option value="226BF">부르키나파소 (+226)</option>
							<option value="975BT">부탄 (+975)</option>
							<option value="1MP">북마리아나제도 (+1)</option>
							<option value="359BG">불가리아 (+359)</option>
							<option value="55BR">브라질 (+55)</option>
							<option value="673BN">브루나이 (+673)</option>
							<option value="685WS">사모아 (+685)</option>
							<option value="966SA">사우디아라비아 (+966)</option>
							<option value="500GS">사우스조지아 사우스샌드위치 제도 (+500)</option>
							<option value="378SM">산마리노 (+378)</option>
							<option value="239ST">상투메 프린시페 (+239)</option>
							<option value="590MF">생마르탱 (+590)</option>
							<option value="590BL">생바르텔레미 (+590)</option>
							<option value="508PM">생피에르 미클롱 (+508)</option>
							<option value="212EH">서사하라 (+212)</option>
							<option value="221SN">세네갈 (+221)</option>
							<option value="381RS">세르비아 (+381)</option>
							<option value="248SC">세이셸 (+248)</option>
							<option value="1LC">세인트루시아 (+1)</option>
							<option value="1VC">세인트빈센트그레나딘 (+1)</option>
							<option value="1KN">세인트키츠 네비스 (+1)</option>
							<option value="290SH">세인트헬레나 (+290)</option>
							<option value="252SO">소말리아 (+252)</option>
							<option value="677SB">솔로몬 제도 (+677)</option>
							<option value="249SD">수단 (+249)</option>
							<option value="597SR">수리남 (+597)</option>
							<option value="94LK">스리랑카 (+94)</option>
							<option value="47SJ">스발바르제도-얀마웬섬 (+47)</option>
							<option value="46SE">스웨덴 (+46)</option>
							<option value="41CH">스위스 (+41)</option>
							<option value="34ES">스페인 (+34)</option>
							<option value="421SK">슬로바키아 (+421)</option>
							<option value="386SI">슬로베니아 (+386)</option>
							<option value="232SL">시에라리온 (+232)</option>
							<option value="1SX">신트마르턴 (+1)</option>
							<option value="65SG">싱가포르 (+65)</option>
							<option value="971AE">아랍에미리트 (+971)</option>
							<option value="297AW">아루바 (+297)</option>
							<option value="374AM">아르메니아 (+374)</option>
							<option value="54AR">아르헨티나 (+54)</option>
							<option value="1AS">아메리칸 사모아 (+1)</option>
							<option value="354IS">아이슬란드 (+354)</option>
							<option value="509HT">아이티 (+509)</option>
							<option value="353IE">아일랜드 (+353)</option>
							<option value="994AZ">아제르바이잔 (+994)</option>
							<option value="93AF">아프가니스탄 (+93)</option>
							<option value="376AD">안도라 (+376)</option>
							<option value="355AL">알바니아 (+355)</option>
							<option value="213DZ">알제리 (+213)</option>
							<option value="244AO">앙골라 (+244)</option>
							<option value="1AG">앤티가 바부다 (+1)</option>
							<option value="1AI">앵귈라 (+1)</option>
							<option value="291ER">에리트리아 (+291)</option>
							<option value="268SZ">에스와티니 (+268)</option>
							<option value="372EE">에스토니아 (+372)</option>
							<option value="593EC">에콰도르 (+593)</option>
							<option value="251ET">에티오피아 (+251)</option>
							<option value="503SV">엘살바도르 (+503)</option>
							<option value="44GB">영국 (+44)</option>
							<option value="1VG">영국령 버진아일랜드 (+1)</option>
							<option value="246IO">영국령 인도양 식민지 (+246)</option>
							<option value="967YE">예멘 (+967)</option>
							<option value="968OM">오만 (+968)</option>
							<option value="61AU">오스트레일리아 (+61)</option>
							<option value="43AT">오스트리아 (+43)</option>
							<option value="504HN">온두라스 (+504)</option>
							<option value="358AX">올란드 제도 (+358)</option>
							<option value="681WF">왈리스-푸투나 제도 (+681)</option>
							<option value="962JO">요르단 (+962)</option>
							<option value="256UG">우간다 (+256)</option>
							<option value="598UY">우루과이 (+598)</option>
							<option value="998UZ">우즈베키스탄 (+998)</option>
							<option value="380UA">우크라이나 (+380)</option>
							<option value="964IQ">이라크 (+964)</option>
							<option value="972IL">이스라엘 (+972)</option>
							<option value="20EG">이집트 (+20)</option>
							<option value="39IT">이탈리아 (+39)</option>
							<option value="91IN">인도 (+91)</option>
							<option value="62ID">인도네시아 (+62)</option>
							<option value="81JP">일본 (+81)</option>
							<option value="1JM">자메이카 (+1)</option>
							<option value="260ZM">잠비아 (+260)</option>
							<option value="44JE">저지 (+44)</option>
							<option value="240GQ">적도 기니 (+240)</option>
							<option value="995GE">조지아 (+995)</option>
							<option value="86CN">중국 (+86)</option>
							<option value="236CF">중앙 아프리카 공화국 (+236)</option>
							<option value="253DJ">지부티 (+253)</option>
							<option value="350GI">지브롤터 (+350)</option>
							<option value="263ZW">짐바브웨 (+263)</option>
							<option value="235TD">차드 (+235)</option>
							<option value="420CZ">체코 (+420)</option>
							<option value="56CL">칠레 (+56)</option>
							<option value="237CM">카메룬 (+237)</option>
							<option value="238CV">카보베르데 (+238)</option>
							<option value="7KZ">카자흐스탄 (+7)</option>
							<option value="974QA">카타르 (+974)</option>
							<option value="855KH">캄보디아 (+855)</option>
							<option value="1CA">캐나다 (+1)</option>
							<option value="254KE">케냐 (+254)</option>
							<option value="1KY">케이맨 제도 (+1)</option>
							<option value="269KM">코모로 (+269)</option>
							<option value="506CR">코스타리카 (+506)</option>
							<option value="61CC">코코스 제도 (+61)</option>
							<option value="225CI">코트디부아르 (+225)</option>
							<option value="57CO">콜롬비아 (+57)</option>
							<option value="53CU">쿠바 (+53)</option>
							<option value="965KW">쿠웨이트 (+965)</option>
							<option value="682CK">쿡 제도 (+682)</option>
							<option value="599CW">퀴라소 (+599)</option>
							<option value="385HR">크로아티아 (+385)</option>
							<option value="61CX">크리스마스섬 (+61)</option>
							<option value="996KG">키르기스스탄 (+996)</option>
							<option value="686KI">키리바시 (+686)</option>
							<option value="357CY">키프로스 (+357)</option>
							<option value="992TJ">타지키스탄 (+992)</option>
							<option value="255TZ">탄자니아 (+255)</option>
							<option value="66TH">태국 (+66)</option>
							<option value="1TC">터크스 케이커스 제도 (+1)</option>
							<option value="90TR">터키 (+90)</option>
							<option value="228TG">토고 (+228)</option>
							<option value="690TK">토켈라우 (+690)</option>
							<option value="676TO">통가 (+676)</option>
							<option value="993TM">투르크메니스탄 (+993)</option>
							<option value="688TV">투발루 (+688)</option>
							<option value="216TN">튀니지 (+216)</option>
							<option value="1TT">트리니다드 토바고 (+1)</option>
							<option value="507PA">파나마 (+507)</option>
							<option value="595PY">파라과이 (+595)</option>
							<option value="92PK">파키스탄 (+92)</option>
							<option value="675PG">파푸아뉴기니 (+675)</option>
							<option value="680PW">팔라우 (+680)</option>
							<option value="970PS">팔레스타인 지구 (+970)</option>
							<option value="298FO">페로 제도 (+298)</option>
							<option value="51PE">페루 (+51)</option>
							<option value="351PT">포르투갈 (+351)</option>
							<option value="500FK">포클랜드 제도(말비나스 군도) (+500)</option>
							<option value="48PL">폴란드 (+48)</option>
							<option value="1PR">푸에르토리코 (+1)</option>
							<option value="33FR">프랑스 (+33)</option>
							<option value="594GF">프랑스령 기아나 (+594)</option>
							<option value="689PF">프랑스령 폴리네시아 (+689)</option>
							<option value="679FJ">피지 (+679)</option>
							<option value="358FI">핀란드 (+358)</option>
							<option value="63PH">필리핀 (+63)</option>
							<option value="64PN">핏케언 섬 (+64)</option>
							<option value="82KR" selected>한국 (+82)</option>
							<option value="36HU">헝가리 (+36)</option>
						</select>
						<label for="floatingSelectCountry">국가/지역</label>
					</div>
					<div class="form-floating">
						<input type="phoneNumber" class="form-control" id="floatingPhoneNumber" placeholder="전화번호">
						<label class="input-form-label" for="floatingPhoneNumber">전화번호</label>
					</div>
				</form>
				<div class="modal-phone-number-help-text-box">
					<span id="phone-number-help-text">
						전화나 문자로 전화번호를 확인하겠습니다. 일반 문자 메시지 요금 및 데이터 요금이 부과됩니다.
						<a target="_blank" href="" class="text-dark">개인정보 처리방침</a>
					</span>
				</div>
				<div class="mt-3">
					<button type="button"  onclick="" class="modal-continue-btn btn text-white" 
					        style="background-color: #FF385C;">계속</button>
				</div>
			</div>
<!-- 			
			<div class="modal-also-line">
				<div class="modal-also-text">또는</div>			
			</div>
-->
			<div class="modal-footer">
				<div class="container-fluid">
					<div class="row m-3">
						<button type="button" class="btn btn-light border-dark p-2 bg-white">
							<svg class="ms-2 float-start" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" 
							     xmlns:xlink="http://www.w3.org/1999/xlink" role="presentation" aria-hidden="true" 
							     focusable="false" style="height: 20px; width: 20px; fill: currentcolor;">
								<defs>
									<path id="a" d="M.001 0H24v23.854H.001z"></path>
								</defs>
								<g fill="none" fill-rule="evenodd">
									<mask id="b" fill="#fff">
										<use xlink:href="#a"></use>
									</mask>
									<path d="M24 12c0-6.627-5.373-12-12-12S0 5.373 0 12c0 5.99 4.388 10.954 10.125 11.854V15.47H7.078V12h3.047V9.356c0-3.007 1.792-4.668 4.533-4.668 1.312 0 2.686.234 2.686.234v2.953H15.83c-1.491 0-1.956.925-1.956 1.874V12h3.328l-.532 3.469h-2.796v8.385C19.612 22.954 24 17.99 24 12" fill="#1877F2" mask="url(#b)"></path>
									<path d="M16.671 15.469L17.203 12h-3.328V9.749c0-.949.465-1.874 1.956-1.874h1.513V4.922s-1.374-.234-2.686-.234c-2.741 0-4.533 1.66-4.533 4.668V12H7.078v3.469h3.047v8.385a12.09 12.09 0 003.75 0V15.47h2.796" fill="#FFF"></path>
								</g>
							</svg>
							<div class="modal-login-btn-text">페이스북으로 로그인하기</div>
		                </button>
					</div>
					<div class="row m-3">
						<button type="button" class="btn btn-light border-dark p-2 bg-white">
							<svg class="ms-2 float-start" viewBox="0 0 18 18" role="presentation" aria-hidden="true" 
							     focusable="false" style="height: 20px; width: 20px;">
								<g fill="none" fill-rule="evenodd">
									<path d="M9 3.48c1.69 0 2.83.73 3.48 1.34l2.54-2.48C13.46.89 11.43 0 9 0 5.48 0 2.44 2.02.96 4.96l2.91 2.26C4.6 5.05 6.62 3.48 9 3.48z" fill="#EA4335"></path>
									<path d="M17.64 9.2c0-.74-.06-1.28-.19-1.84H9v3.34h4.96c-.1.83-.64 2.08-1.84 2.92l2.84 2.2c1.7-1.57 2.68-3.88 2.68-6.62z" fill="#4285F4"></path>
									<path d="M3.88 10.78A5.54 5.54 0 0 1 3.58 9c0-.62.11-1.22.29-1.78L.96 4.96A9.008 9.008 0 0 0 0 9c0 1.45.35 2.82.96 4.04l2.92-2.26z" fill="#FBBC05"></path>
									<path d="M9 18c2.43 0 4.47-.8 5.96-2.18l-2.84-2.2c-.76.53-1.78.9-3.12.9-2.38 0-4.4-1.57-5.12-3.74L.97 13.04C2.45 15.98 5.48 18 9 18z" fill="#34A853"></path>
									<path d="M0 0h18v18H0V0z"></path>
								</g>
							</svg>
			                <div class="modal-login-btn-text">구글로 로그인하기</div>
		                </button>		                
					</div>
					<div class="row m-3">
						<button type="button" class="btn btn-light border-dark p-2 bg-white">
							<svg class="ms-2 float-start" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" 
							     role="presentation" aria-hidden="true" focusable="false" style="height: 20px; width: 20px; 
							     fill: currentcolor;">
								<path d="m13.3 2.1a5.1 5.1 0 0 1 3.8-2.1 5.1 5.1 0 0 1 -1.2 3.8 4.1 4.1 0 0 1 -3.6 1.7 4.5 4.5 0 0 1 1-3.4zm-5 3.7c-2.8 0-5.8 2.5-5.8 7.3 0 4.9 3.5 10.9 6.3 10.9 1 0 2.5-1 4-1s2.6.9 4 .9c3.1 0 5.3-6.4 5.3-6.4a5.3 5.3 0 0 1 -3.2-4.9 5.2 5.2 0 0 1 2.6-4.5 5.4 5.4 0 0 0 -4.7-2.4c-2 0-3.5 1.1-4.3 1.1-.9 0-2.4-1-4.2-1z"></path>
							</svg>
		                	<div class="modal-login-btn-text">Apple 계정으로 계속하기</div>
		                </button>
					</div>
					<div class="row m-3">
						<button type="button" class="btn btn-light border-dark p-2 bg-white">
			                <svg class="ms-2 float-start" viewBox="0 0 24 24" role="presentation" aria-hidden="true" 
			                     focusable="false" style="height: 20px; width: 20px; fill: currentcolor;">
			                	<path d="m22.5 4h-21c-.83 0-1.5.67-1.5 1.51v12.99c0 .83.67 1.5 1.5 1.5h20.99a1.5 1.5 0 0 0 1.51-1.51v-12.98c0-.84-.67-1.51-1.5-1.51zm.5 14.2-6.14-7.91 6.14-4.66v12.58zm-.83-13.2-9.69 7.36c-.26.2-.72.2-.98 0l-9.67-7.36h20.35zm-21.17.63 6.14 4.67-6.14 7.88zm.63 13.37 6.3-8.1 2.97 2.26c.62.47 1.57.47 2.19 0l2.97-2.26 6.29 8.1z" fill-rule="evenodd"></path>
			                </svg>
		                	<div class="modal-login-btn-text">이메일로 로그인하기</div>
		                </button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 비디오 실행 스크립트 -->
<script>
	document.getElementById('hostVideo').play();
</script>

<!-- 로그인 모달 스크립트 -->
<script type="text/javascript">
$(function() {
	let loginFormModal = new bootstrap.Modal(document.getElementById("modal-form-login"));
	
	$("#btn-open-form-modal").click(function() {
		loginFormModal.show();
	});
})
</script>

</body>
</html>