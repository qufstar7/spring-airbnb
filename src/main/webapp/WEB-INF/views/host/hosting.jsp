<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preload" href="${path}/resources/css/hostingstyle.css" as="style">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>${user.name } 호스트</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/hostingstyle.css">
</head>
<body>
<div class="container-fruid">
	<!-- 검은색 알림창 -->
	<div class="border px-5 bg-black text-white text-center border border-5 border-dark" style="height:80px;">
		<div class="d-flex justify-content-center align-items-center h-100">${user.name }님의 숙소 리스트 입니다. 숙소 정보를 변경하고 관리할 수 있습니다. </div>
	</div>

	<!-- nav -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light rounded" aria-label="Twelfth navbar example" style="height:80px;">
      <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample10" aria-controls="navbarsExample10" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
		<div class="ms-5 position-absolute">
			<a class="" style="color: #FF385C !important;" href="/">
				<svg width="30" height="32" style="display:block"><path d="M29.3864 22.7101C29.2429 22.3073 29.0752 21.9176 28.9157 21.5565C28.6701 21.0011 28.4129 20.4446 28.1641 19.9067L28.1444 19.864C25.9255 15.0589 23.5439 10.1881 21.0659 5.38701L20.9607 5.18316C20.7079 4.69289 20.4466 4.18596 20.1784 3.68786C19.8604 3.0575 19.4745 2.4636 19.0276 1.91668C18.5245 1.31651 17.8956 0.833822 17.1853 0.502654C16.475 0.171486 15.7005 -9.83959e-05 14.9165 4.23317e-08C14.1325 9.84805e-05 13.3581 0.171877 12.6478 0.503224C11.9376 0.834571 11.3088 1.31742 10.8059 1.91771C10.3595 2.46476 9.97383 3.05853 9.65572 3.68858C9.38521 4.19115 9.12145 4.70278 8.8664 5.19757L8.76872 5.38696C6.29061 10.1884 3.90903 15.0592 1.69015 19.8639L1.65782 19.9338C1.41334 20.463 1.16057 21.0102 0.919073 21.5563C0.75949 21.9171 0.592009 22.3065 0.448355 22.7103C0.0369063 23.8104 -0.094204 24.9953 0.0668098 26.1585C0.237562 27.334 0.713008 28.4447 1.44606 29.3804C2.17911 30.3161 3.14434 31.0444 4.24614 31.4932C5.07835 31.8299 5.96818 32.002 6.86616 32C7.14824 31.9999 7.43008 31.9835 7.71027 31.9509C8.846 31.8062 9.94136 31.4366 10.9321 30.8639C12.2317 30.1338 13.5152 29.0638 14.9173 27.5348C16.3194 29.0638 17.6029 30.1338 18.9025 30.8639C19.8932 31.4367 20.9886 31.8062 22.1243 31.9509C22.4045 31.9835 22.6864 31.9999 22.9685 32C23.8664 32.002 24.7561 31.8299 25.5883 31.4932C26.6901 31.0444 27.6554 30.3161 28.3885 29.3804C29.1216 28.4447 29.5971 27.3341 29.7679 26.1585C29.9287 24.9952 29.7976 23.8103 29.3864 22.7101ZM14.9173 24.377C13.1816 22.1769 12.0678 20.1338 11.677 18.421C11.5169 17.7792 11.4791 17.1131 11.5656 16.4573C11.6339 15.9766 11.8105 15.5176 12.0821 15.1148C12.4163 14.6814 12.8458 14.3304 13.3374 14.0889C13.829 13.8475 14.3696 13.7219 14.9175 13.7219C15.4655 13.722 16.006 13.8476 16.4976 14.0892C16.9892 14.3307 17.4186 14.6817 17.7528 15.1151C18.0244 15.5181 18.201 15.9771 18.2693 16.4579C18.3556 17.114 18.3177 17.7803 18.1573 18.4223C17.7661 20.1349 16.6526 22.1774 14.9173 24.377ZM27.7406 25.8689C27.6212 26.6908 27.2887 27.4674 26.7762 28.1216C26.2636 28.7759 25.5887 29.2852 24.8183 29.599C24.0393 29.9111 23.1939 30.0217 22.3607 29.9205C21.4946 29.8089 20.6599 29.5239 19.9069 29.0824C18.7501 28.4325 17.5791 27.4348 16.2614 25.9712C18.3591 23.3846 19.669 21.0005 20.154 18.877C20.3723 17.984 20.4196 17.0579 20.2935 16.1475C20.1791 15.3632 19.8879 14.615 19.4419 13.9593C18.9194 13.2519 18.2378 12.6768 17.452 12.2805C16.6661 11.8842 15.798 11.6777 14.9175 11.6777C14.0371 11.6777 13.1689 11.8841 12.383 12.2803C11.5971 12.6765 10.9155 13.2515 10.393 13.9589C9.94707 14.6144 9.65591 15.3624 9.5414 16.1465C9.41524 17.0566 9.4623 17.9822 9.68011 18.8749C10.1648 20.9993 11.4748 23.384 13.5732 25.9714C12.2555 27.4348 11.0845 28.4325 9.92769 29.0825C9.17468 29.5239 8.34007 29.809 7.47395 29.9205C6.64065 30.0217 5.79525 29.9111 5.0162 29.599C4.24581 29.2852 3.57092 28.7759 3.05838 28.1217C2.54585 27.4674 2.21345 26.6908 2.09411 25.8689C1.97932 25.0334 2.07701 24.1825 2.37818 23.3946C2.49266 23.0728 2.62663 22.757 2.7926 22.3818C3.0274 21.851 3.27657 21.3115 3.51759 20.7898L3.54996 20.7197C5.75643 15.9419 8.12481 11.0982 10.5894 6.32294L10.6875 6.13283C10.9384 5.64601 11.1979 5.14267 11.4597 4.6563C11.7101 4.15501 12.0132 3.68171 12.3639 3.2444C12.6746 2.86903 13.0646 2.56681 13.5059 2.35934C13.9473 2.15186 14.4291 2.04426 14.9169 2.04422C15.4047 2.04418 15.8866 2.15171 16.3279 2.35911C16.7693 2.56651 17.1593 2.86867 17.4701 3.24399C17.821 3.68097 18.1242 4.15411 18.3744 4.65538C18.6338 5.13742 18.891 5.63623 19.1398 6.11858L19.2452 6.32315C21.7097 11.0979 24.078 15.9415 26.2847 20.7201L26.3046 20.7631C26.5498 21.2936 26.8033 21.8419 27.042 22.382C27.2082 22.7577 27.3424 23.0738 27.4566 23.3944C27.7576 24.1824 27.8553 25.0333 27.7406 25.8689Z" fill="currentcolor"></path></svg>
			</a>
		</div>
        <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample10">
          <ul class="navbar-nav">
            <li class="nav-item mx-2">
              <a class="nav-link active" aria-current="page" href="#">호스트</a>
            </li>
            <li class="nav-item mx-2">
              <a class="nav-link" href="../acc/sendnote">메세지</a>
            </li>
            <li class="nav-item mx-2" style="display:none;">
              <a class="nav-link" href="#">달력</a>
            </li>
            <li class="nav-item dropdown mx-2">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown10" data-bs-toggle="dropdown" aria-expanded="false">메뉴</a>
              <ul class="dropdown-menu" aria-labelledby="dropdown10">
                <li><a class="dropdown-item" href="/host/accommodation" style="display:none;">숙소</a></li>
                <li><a class="dropdown-item" href="/host/reservation">예약</a></li>
                <li><a class="dropdown-item" href="/host/become-a-host">새로운 숙소 등록하기</a></li>
              </ul>
            </li>
          </ul>
        </div>
        
        <!-- 알람버튼 -->
		<div class="mx-3 float-end" style="display:none;">
			<button aria-label="읽지 않은 알림 0개" aria-haspopup="true" aria-controls="header-notifications-dropdown-menu" aria-expanded="false" type="button" class="rounded-circle border border-dark border-2" style="height:40px; width:40px; background-color:white;">
				<span class="_e296pg">
					<svg class="m-auto" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;">
						<g fill="none">
							<path d="m6.83205 20.5547.16795-.2519v-.3028-7c0-4.97056 4.0294-9 9-9s9 4.02944 9 9v7 .3028l.1679.2519 2.6778 4.0166c.1006.1509.1543.3283.1543.5097 0 .5076-.4114.919-.919.919h-22.16202c-.50754 0-.91898-.4114-.91898-.919 0-.1814.0537-.3588.15434-.5097zm6.17885 5.8131c-.0043.0661-.0109.765-.0109.8322 0 1.6569 1.3431 3 3 3s3-1.3431 3-3c0-.0672-.0066-.7-.0109-.7661"></path>
							<path d="m16 1v3"></path>
						</g>
					</svg>
				</span>
			</button>
		</div>
		<!-- 사용자버튼 -->
		<div class="mx-3 float-end" style="display:none;">
			<button id="hostUserModal" type="button" aria-expanded="false" aria-label="메인 탐색 메뉴" data-testid="cypress-headernav-profile" class="d-inline-flex text-center align-items-center align-middle rounded-circle border border-dark border-2" style="height:40px; width:40px; background-color:white; padding:1px;">
				<div class="d-none">
					<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;">
						<g fill="none" fill-rule="nonzero">
							<path d="m2 16h28"></path>
							<path d="m2 24h28"></path>
							<path d="m2 8h28"></path>
						</g> 
					</svg>
				</div>
				<div class="position-relative" style="overflow:hidden; z-index:1">
					<img class="d-block w-100 h-100 rounded-circle" src="https://a0.muscache.com/defaults/user_pic-36x36.png?v=3" alt="">
				</div>
			</button>
		</div> 


		

      </div>
    </nav>	
	
	<!-- main1(투데이) -->
	<div class="main1" style="background: url(&quot;data:image/webp;base64,UklGRoQCAABXRUJQVlA4WAoAAAAgAAAAHQAAHQAASUNDUAwCAAAAAAIMbGNtcwIQAABtbnRyUkdCIFhZWiAH3AABABkAAwApADlhY3NwQVBQTAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9tYAAQAAAADTLWxjbXMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAApkZXNjAAAA/AAAAF5jcHJ0AAABXAAAAAt3dHB0AAABaAAAABRia3B0AAABfAAAABRyWFlaAAABkAAAABRnWFlaAAABpAAAABRiWFlaAAABuAAAABRyVFJDAAABzAAAAEBnVFJDAAABzAAAAEBiVFJDAAABzAAAAEBkZXNjAAAAAAAAAANjMgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB0ZXh0AAAAAEZCAABYWVogAAAAAAAA9tYAAQAAAADTLVhZWiAAAAAAAAADFgAAAzMAAAKkWFlaIAAAAAAAAG+iAAA49QAAA5BYWVogAAAAAAAAYpkAALeFAAAY2lhZWiAAAAAAAAAkoAAAD4QAALbPY3VydgAAAAAAAAAaAAAAywHJA2MFkghrC/YQPxVRGzQh8SmQMhg7kkYFUXdd7WtwegWJsZp8rGm/fdPD6TD//1ZQOCBSAAAAUAMAnQEqHgAeAD7ZYKpOtiWooygKqsAbCWQAnTLfAiGYXfAA/uw/rDUG/ySry930W5TklUCdPGwZvhShkxmlA5XTMUKtCBVuol3YS6MrvY4AAA==&quot;);">
		<div class="main1-box1">
			<div class="main1-box2">
				<h1 class="m-0">
					<div class="h1-box">
						<span class="h1-box-span" style="--tl-color:#FFFFFF; --tl-font-size:32px; --tl-font-weight:600; --tl-line-height:36px;">호스팅 관리 페이지</span>
					</div>
				</h1>
				<div class="">
					<div class="">
						<a href="#">
							<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 24px; width: 24px; stroke: rgb(255, 255, 255); stroke-width: 2.66667; overflow: visible;">
								<g fill="none">
									<path d="m6.83205 20.5547.16795-.2519v-.3028-7c0-4.97056 4.0294-9 9-9s9 4.02944 9 9v7 .3028l.1679.2519 2.6778 4.0166c.1006.1509.1543.3283.1543.5097 0 .5076-.4114.919-.919.919h-22.16202c-.50754 0-.91898-.4114-.91898-.919 0-.1814.0537-.3588.15434-.5097zm6.17885 5.8131c-.0043.0661-.0109.765-.0109.8322 0 1.6569 1.3431 3 3 3s3-1.3431 3-3c0-.0672-.0066-.7-.0109-.7661"></path>
									<path d="m16 1v3"></path>
								</g>
							</svg>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	 
	<!-- main2(숙소리스트) -->
	<div class="px-5 mx-5" style="min-height:200px;">
		<c:if test="${empty accs}">
			<h2 class="fs-3 fw-bolder my-3 pt-3">숙소 0개</h2>
			<div class="d-flex text-align-center align-items-center justify-content-center">
				<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="height: 32px; width: 32px; fill: rgb(34, 34, 34);"><path d="m24.0001497 1c2.6882889.00069168 4.881043 2.1224181 4.9956073 4.78298655l.0047037.21687134.0007229 5.08862781-2 .0002841-.0007228-5.08837049c-.0006381-1.59771409-1.2497012-2.9036382-2.8243181-2.99526279l-.1762503-.00513652h-15.9998924c-1.59768088 0-2.90366088 1.24891996-2.99490731 2.82372721l-.00509269.17627279v19.9997571c.00038808 1.5977123 1.24926802 2.903807 2.82388326 2.9956217l.17625084.0051578 4.823918.000647-.0002682 2-4.82416099-.0006471c-2.68831483-.0010137-4.88080158-2.1230666-4.99495305-4.7836635l-.00466986-.216873v-20c0-2.6887547 2.12230671-4.88181811 4.78311038-4.99538049l.21688962-.00461951zm-2.0001497 12c4.9705627 0 9 4.0294373 9 9s-4.0294373 9-9 9-9-4.0294373-9-9 4.0294373-9 9-9zm0 2c-3.8659932 0-7 3.1340068-7 7s3.1340068 7 7 7 7-3.1340068 7-7-3.1340068-7-7-7zm3.0160589 3.1704628 1.3678822 1.4590744-6.0172744 5.6411948-3.3506078-3.1411948 1.3678822-1.4590744 1.9820589 1.8585372z"></path></svg>
				<div class="text-center fs-5 m-3">조회된 숙소가 없습니다.</div>
			</div>
			<button onclick="location.href='/host/become-a-host'" class="btn btn-outline-dark float-end me-5" >숙소 등록하러 가기</button>
		</c:if>
		<c:if test="${not empty accs}">
			<h2 class="fs-3 fw-bolder my-3 pt-3">숙소</h2>
			<div>
				<table class="table">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">숙소</th>
				      <th scope="col">상태</th>
				      <th scope="col">등록</th>
				      <th scope="col">침실</th>
				      <th scope="col">침대</th>
				      <th scope="col">욕실</th>
				      <th scope="col">위치</th>
				      <th scope="col">생성일</th>
				      <th scope="col">필요한 조치</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach var="acc" items="${accs}" varStatus="status">
				    <tr style="min-height:56px;">
				      <th scope="row">${status.index + 1}</th>
				      <td>${acc.name }</td>
				      <td>${acc.status }</td>
				      <td>
				      	<c:if test="${acc.status ne '등록미완'}">
				      		<svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-label="즉시 예약 기능 켜짐" role="img" focusable="false" style="height: 16px; width: 16px; fill: rgb(0, 138, 5);"><path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zm3.159 4.869L6.67 9.355 4.42 7.105 3.289 8.236 6.67 11.62 12.291 6z"></path></svg>
							완료
				      	</c:if>
				      	<c:if test="${acc.status  eq '등록미완'}">
							<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="16px" height="16px" viewBox="0 0 122.88 122.879" enable-background="new 0 0 122.88 122.879" xml:space="preserve"><g><path fill="#FF4141" d="M61.44,0c16.96,0,32.328,6.882,43.453,17.986c11.104,11.125,17.986,26.494,17.986,43.453 c0,16.961-6.883,32.328-17.986,43.453C93.769,115.998,78.4,122.879,61.44,122.879c-16.96,0-32.329-6.881-43.454-17.986 C6.882,93.768,0,78.4,0,61.439C0,44.48,6.882,29.111,17.986,17.986C29.112,6.882,44.48,0,61.44,0L61.44,0z M73.452,39.152 c2.75-2.792,7.221-2.805,9.986-0.026c2.764,2.776,2.775,7.292,0.027,10.083L71.4,61.445l12.077,12.25 c2.728,2.77,2.689,7.256-0.081,10.021c-2.772,2.766-7.229,2.758-9.954-0.012L61.445,71.541L49.428,83.729 c-2.75,2.793-7.22,2.805-9.985,0.025c-2.763-2.775-2.776-7.291-0.026-10.082L51.48,61.435l-12.078-12.25 c-2.726-2.769-2.689-7.256,0.082-10.022c2.772-2.765,7.229-2.758,9.954,0.013L61.435,51.34L73.452,39.152L73.452,39.152z M96.899,25.98C87.826,16.907,75.29,11.296,61.44,11.296c-13.851,0-26.387,5.611-35.46,14.685 c-9.073,9.073-14.684,21.609-14.684,35.459s5.611,26.387,14.684,35.459c9.073,9.074,21.609,14.686,35.46,14.686 c13.85,0,26.386-5.611,35.459-14.686c9.073-9.072,14.684-21.609,14.684-35.459S105.973,35.054,96.899,25.98L96.899,25.98z"/></g></svg>
							미완
				      	</c:if>
				      </td>
				      <td>${acc.rooms.bedroom }</td>
				      <td>${acc.rooms.bed }</td>
				      <td>${acc.rooms.bathroom }</td>
				      <td>${acc.address }</td>
				      <td><fmt:formatDate value="${acc.createdDate }" pattern="yyyy년 MM월 dd일 hh시 mm분"/></td>
				      <td>
			         	<c:choose>
				      		<c:when test="${acc.status eq '등록미완'}">
				      			<button class="btn btn-outline-dark" type=button onclick="location.href='/host/become-a-host/registerContinue?accNo=${acc.accNo}'">등록 완료하기</button>
				      		</c:when>
				      		<c:otherwise>
				      			<button class="btn btn-light" type=button onclick="location.href='/acc/detail?no=${acc.accNo}'">숙소 확인하기</button>
				      		</c:otherwise>
			      		</c:choose>
	      			  </td>
				    </tr>
					</c:forEach>
				  </tbody>
				</table>
			</div>
		</c:if>
	</div>
	
	<!-- main3 (예약) -->
	<div class="px-5 mx-5 mb-5" style="min-height:200px;">
		<h2 class="fs-3 fw-bolder my-3 pt-3">예약</h2>
		
		<c:if test="${empty reservations }">
		<div class="d-flex text-align-center align-items-center justify-content-center">
			<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="height: 32px; width: 32px; fill: rgb(34, 34, 34);"><path d="m24.0001497 1c2.6882889.00069168 4.881043 2.1224181 4.9956073 4.78298655l.0047037.21687134.0007229 5.08862781-2 .0002841-.0007228-5.08837049c-.0006381-1.59771409-1.2497012-2.9036382-2.8243181-2.99526279l-.1762503-.00513652h-15.9998924c-1.59768088 0-2.90366088 1.24891996-2.99490731 2.82372721l-.00509269.17627279v19.9997571c.00038808 1.5977123 1.24926802 2.903807 2.82388326 2.9956217l.17625084.0051578 4.823918.000647-.0002682 2-4.82416099-.0006471c-2.68831483-.0010137-4.88080158-2.1230666-4.99495305-4.7836635l-.00466986-.216873v-20c0-2.6887547 2.12230671-4.88181811 4.78311038-4.99538049l.21688962-.00461951zm-2.0001497 12c4.9705627 0 9 4.0294373 9 9s-4.0294373 9-9 9-9-4.0294373-9-9 4.0294373-9 9-9zm0 2c-3.8659932 0-7 3.1340068-7 7s3.1340068 7 7 7 7-3.1340068 7-7-3.1340068-7-7-7zm3.0160589 3.1704628 1.3678822 1.4590744-6.0172744 5.6411948-3.3506078-3.1411948 1.3678822-1.4590744 1.9820589 1.8585372z"></path></svg>
			<div class="text-center fs-5 m-3">조회된 숙소가 없습니다.</div>
		</div>
		</c:if>
		<c:if test="${not empty reservations}">
			<div>
				<table class="table">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">예약숙소</th>
				      <th scope="col">예약자번호</th>
				      <th scope="col">상태</th>
				      <th scope="col">체크인 날짜</th>
				      <th scope="col">체크아웃 날짜</th>
				      <th scope="col">성인</th>
				      <th scope="col">청소년</th>
				      <th scope="col">유아</th>
				      <th scope="col">애완동물</th>
				      <th scope="col">메세지</th>
				      <th scope="col">서비스 수수료</th>
				      <th scope="col">총 수입</th>
				      <th scope="col">지불 여부</th>
				      <th scope="col">예약 날짜</th>
				    </tr>
				  </thead>
				  <tbody>
			  	    <c:forEach var="outerList" items="${reservations}" varStatus="outerListStatus">
			  	    <c:forEach var="reservation" items="${outerList}" varStatus="status">
				    <tr style="min-height:56px;">
				      <th scope="row">${status.index + 1}</th>
				      <td>${reservation.accNo }</td>
				      <td>${reservation.userNo }</td>
				      <td>
				      	<svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-label="즉시 예약 기능 켜짐" role="img" focusable="false" style="height: 16px; width: 16px; fill: rgb(0, 138, 5);"><path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zm3.159 4.869L6.67 9.355 4.42 7.105 3.289 8.236 6.67 11.62 12.291 6z"></path></svg>
				      	${reservation.reservationStatus }
				      </td>
				      <td><fmt:formatDate value="${reservation.checkInDate }" pattern="yyyy년 MM월 dd일 hh시 mm분"/></td>
				      <td><fmt:formatDate value="${reservation.checkOutDate }" pattern="yyyy년 MM월 dd일 hh시 mm분"/></td>
				      <td>${reservation.adultNum }</td>
				      <td>${reservation.childrenNum }</td>
				      <td>${reservation.infantNum }</td>
				      <td>${reservation.petNum }</td>
				      <td>${reservation.messageToHost }</td>
				      <td>${reservation.serviceFee }</td>
				      <td>${reservation.totalPrice }</td>
				      <td>${reservation.entirePayment }</td>
				      <td><fmt:formatDate value="${reservation.createdDate }" pattern="yyyy년 MM월 dd일 hh시 mm분"/></td>
				    </tr>
				    </c:forEach>
				    </c:forEach>
				  </tbody>
				</table>
			</div>
		</c:if>
	</div>

</div>


<script>
$(function(){
	$("#hostUserModal").click(function(){
		console.log("!!!");
	})
})
</script>
</body>
</html>