<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="../css/base.css" rel="stylesheet">
<link href="../css/common.css" rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.umd.js"
	integrity="sha512-ZwR1/gSZM3ai6vCdI+LVF1zSq/5HznD3ZSTk7kajkaj4D292NLuduDCO1c/NT8Id+jE58KYLKT7hXnbtryGmMg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="../script/header.js"></script>
<script type="text/javascript" src="../script/graph.js"></script>

<title>foodIngredients</title>
</head>
<body>
	<header id="header">
		<div class="header_inner header_sub">
			<jsp:include page="../common/header.jsp" />
		</div>
	</header>


	<section class="signup sig_modify">
		<div class="inner">
			<div class="sig_inner">
				<div class="sig_inputs">
					<div class="sig_title">나의 영양 섭취 기준</div>

				</div>

			</div>
		</div>
	</section>

	<!-- -------------------------------표------------------------------------------->

	<div class="inner">
		<div class="sig_inner">
			<table border="1">
				<caption>영양소 섭취 기준</caption>
				<thead>
					<tr>
						<th>구분</th>
						<c:forEach var="Standard" items="${findTotalDietByStandard}">
						<th>${Standard.foodName}</th>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>기준</td>
						<c:forEach var="Standard" items="${findTotalDietByStandard}">
							<th>
								<c:if test="${Standard.foodIntake == 9999}">-</c:if>
								<c:if test="${Standard.foodIntake != 9999}">${Standard.foodIntake}</c:if>							
							</th>
						</c:forEach>
											
					</tr>
					<tr>
						<td>평균</td>						
						<th>${totalDietAvg.kcal}</th>
						<th>${totalDietAvg.water}</th>
						<th>${totalDietAvg.protein}</th>
						<th>${totalDietAvg.fat}</th>						
						<th>${totalDietAvg.carbohydrate}</th>
						<th>${totalDietAvg.sugars}</th>
						<th>${totalDietAvg.dietaryFiber}</th>
						<th>${totalDietAvg.calcium}</th>
						<th>${totalDietAvg.ironContent}</th>
						<th>${totalDietAvg.phosphorus}</th>
						<th>${totalDietAvg.potassium}</th>
						<th>${totalDietAvg.sodium}</th>
						<th>${totalDietAvg.vitaminA}</th>
						<th>${totalDietAvg.retinol}</th>
						<th>${totalDietAvg.betaCarotene}</th>
						<th>${totalDietAvg.thiamine}</th>
						<th>${totalDietAvg.riboflavin}</th>
						<th>${totalDietAvg.niacin}</th>
						<th>${totalDietAvg.vitaminC}</th>
						<th>${totalDietAvg.vitaminD}</th>
						<th>${totalDietAvg.cholesterol}</th>
						<th>${totalDietAvg.saturatedFat}</th>
						<th>${totalDietAvg.transFat}</th>
					</tr>
				</tbody>
			</table>


			<!-- ---------------------그래프-------------------------- -->

			<div class="graph">
				<div class="inner">

					<div class="graphBox" style="width: 1200px; height: 600px;">
						<canvas id="barCanvas"></canvas>
					</div>

				</div>
			</div>

			<!-- ---------------------DB그래프-------------------------- -->

		</div>
	</div>


	<script type="text/javascript">
		//JSP에서 값을 JavaScript 변수로 전달
		var grapeData = [];
		
		var nutrienStandard = [];		
		<c:forEach var="Standard" items="${findTotalDietByStandard}">
			<c:if test="${Standard.foodIntake == 9999}">
				nutrienStandard.push(0);
			</c:if>
			<c:if test="${Standard.foodIntake != 9999}">
				nutrienStandard.push('${Standard.foodIntake}');
			</c:if>
		</c:forEach>
		
		grapeData.push(nutrienStandard);
		
		var totalDietAvg = [ '${totalDietAvg.kcal}', '${totalDietAvg.water}', '${totalDietAvg.protein}', '${totalDietAvg.fat}',
			'${totalDietAvg.carbohydrate}', '${totalDietAvg.sugars}', '${totalDietAvg.dietaryFiber}', '${totalDietAvg.calcium}',
			'${totalDietAvg.ironContent}', '${totalDietAvg.phosphorus}','${totalDietAvg.potassium}', '${totalDietAvg.sodium}',
			'${totalDietAvg.vitaminA}', '${totalDietAvg.retinol}', '${totalDietAvg.betaCarotene}', '${totalDietAvg.thiamine}',
			'${totalDietAvg.riboflavin}', '${totalDietAvg.niacin}', '${totalDietAvg.vitaminC}', '${totalDietAvg.vitaminD}',
			'${totalDietAvg.cholesterol}', '${totalDietAvg.saturatedFat}', '${totalDietAvg.transFat}' ];
		
		grapeData.push(totalDietAvg);
		
		
		
		console.log(grapeData);
		
		document.addEventListener('DOMContentLoaded', function() {
			// Chart.js가 로드된 후에 차트 생성
			barChart(grapeData); //평균 DAO
			
		});
	</script>



	<jsp:include page="../common/footer.jsp" />
</body>
</html>