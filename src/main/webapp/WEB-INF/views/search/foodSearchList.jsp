<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>		

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="./css/base.css" rel="stylesheet">
    <link href="./css/commen.css" rel="stylesheet">
    <link href="./css/board.css" rel="stylesheet">
    <script type="text/javascript" src="./script/header.js"></script>
    <script type="text/javascript" src="./script/commen.js"></script>
	
    <title>foodIngredients</title>
</head>
<body>
	<header id="header">
        <div class="header_inner header_sub">
            <jsp:include page="../header.jsp" />
        </div>
    </header>



    <div class="sub_content"></div>

    <section class="sub_title">
        <div class="inner">
            <div class="wrap">
                <h1 class="title">식품으로 찾아보기</h1>
                <div class="route wrap">
                    <a href="./index.html"><img class="home center" src="./images/sub/icon/material-home.svg"
                            alt="홈 아이콘"></a>
                    <div class="route_info wrap">
                        <a href="./foodSearchList.html"><span class="dap1">영양정보 찾아보기</span></a>
                        <a href="./foodSearchList.html"><span class="dap2">식품으로 찾아보기</span></a>
                    </div>
                </div>
            </div>

        </div>

    </section>

    <section class="search_cont">
        <div class="inner">
            <div class="big_search">
                <div class="wrap">
                    <div class="search_input wrap">
                        <p class="title">식품명</p>
                        <input type="search" value="" placeholder="영양정보가 궁금한 식품을 입력해주세요">
                        <button class="search_icon center" type="submit">
                            <img src="./images/sub/icon/akar-search2.svg" alt="">
                        </button>
                    </div>
                </div>
            </div>
            <div class="search_inner mb60">
                <ul class="tab">
                    <div class="wrap_s">
                    	<c:forEach var="dataSort" items="${dataSortList}">
                        <li class="lnb big_category on">
                            <div class="wrap">
                                <span>${dataSort.dataSortName}</span>
                            </div>
                        </li>
                        </c:forEach>
                    </div>
                </ul>
				<c:forEach var="dataSort" items="${dataSortList}">
                <div class="tab_content">
                    <ul class="tab_info">
                        <form action="">

                            <div class="icheck_sm_wrap">
                                <div class="icheck_sm mar">
                                    <input type="checkbox" name="mainCategory_Allcheck" id="big_Allcheck" value="${dataSort.dataSortName}">
                                    <label for="big_Allcheck">${dataSort.dataSortName} 전체</label>
                                </div>
                                <c:forEach var="mainCategory" items="${mainCategoryList}">
	                                <c:if test="${mainCategory.dataSortId == dataSort.dataSortId}">
		                                <div class="icheck_sm mar">
		                                    <input type="checkbox" name="mainCategory"
		                                    	id="main_${dataSort.dataSortId}_${mainCategory.mainCategoryId}" value="${mainCategory.mainCategoryName}">
		                                    <label for="main_${dataSort.dataSortId}_${mainCategory.mainCategoryId}">${mainCategory.mainCategoryName}</label>
		                                </div>
	                                </c:if>
                                </c:forEach>
                            </div>
                        </form>
                    </ul>

                    <div class="tab_inner_list clearfix">
                        <div class="tag_inner wrap">
                            <div class="tag_gnb"></div>
                            <div class="reset center">
                                <img src="./images/sub/icon/akar-arrow-repeat.svg" alt="">
                                <span>선택초기화</span>
                            </div>
                        </div>
                        <button id="search__btn" class="common_btn" type="button">선택된 조건내 검색하기</button>
                    </div>
                </div>
				</c:forEach>
                
            </div>
        </div>

    </section>

    <section class="table_menu">
        <div class="inner">
            <div class="wrap">

                <div class="menu_list">
                    <div class="wrap_s">
                        <div class="icheck_wrap">
                            <div class="icheck mar">
                                <input type="radio" name="selection" id="s1" value="P">
                                <label for="s1">가공식품만 보기</label>
                            </div>
                            <div class="icheck mar">
                                <input type="radio" name="selection" id="s2" value="D">
                                <label for="s2">음식만 보기</label>
                            </div>
                            <div class="icheck mar">
                                <input type="radio" name="selection" id="s3" value="R">
                                <label for="s3">원재료만 보기</label>
                            </div>
                        </div>
                    </div>
                </div>

                <select class="page_num">
                    <div class="wrap">
                    <c:forEach var="i" begin="10" end="50" step="10">
                        <option value="${i}">
                            <span>${i}개씩</span>
                            <img src="./images/sub/icon/fa-solid-caret-down.svg" alt="">
                        </option>
                    </c:forEach>
                    </div>
                </select>
            </div>


            <table id="find_business_table" class="new_tbl_board tb01 mt20 mb60">
                <colgroup>
                    <col style="width: 4%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col style="width: 10%;">
                    <col style="width: 7%;">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">식품명</th>
                        <th scope="col">식품대분류</th>
                        <th scope="col">식품중분류</th>
                        <th scope="col">에너지(Kcal)</th>
                    </tr>
                </thead>
                <tbody id="foodList">
                </tbody>
            </table>

            <div class="pagenation wrap center mb80">
                <div id="at_front" class="at_front boder_box">
                    <!-- <img src="./images/sub/icon/at_front.svg" alt=""> -->
                </div>
                <div id="left" class="left boder_box">
                    <!-- <img src="./images/sub/icon/Icon akar-chevron-left-small.svg" alt=""> -->
                </div>

				<div id="page-numbers" class="page-numbers">
				</div>
				
				
                <div id="right" class="right boder_box">
                    <!-- <img src="./images/sub/icon/Icon akar-chevron-right-small.svg" alt=""> -->
                </div>
                <div id="at_back" class="at_back boder_box">
                  <!--   <img src="./images/sub/icon/at_back.svg" alt=""> -->
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="../footer.jsp" />
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    <script>
    	
    	$(document).ready(function(){ 		
    		
    		foodListShow();
    		
    		$('#page-numbers .number').on('click', function() {
    			console.log('버튼눌림');
    			console.log(page);
    		});
    		
    		    		
    		$('#search__btn').click(function(){
    			foodListShow();
    		});     		

    		
    		$('.page_num').click(function(){
    			foodListShow();
    		});
    		
    		
    		
    	});
    
    	
    	function foodListShow(requestPage){
    		console.log(requestPage);
    		let dataSortName = "";
			$('input[name=selection]:checked').each(function(){
    			dataSortName = $(this).val();
    		});
    		let mainCategoryNameArr = [];
    		$('input[name=mainCategory]:checked').each(function(){
    			let mainCategoryName = $(this).val();
    			mainCategoryNameArr.push(mainCategoryName);
    		});
    		
    		let manufacturingCompany = [];
    		let repFoodName = [];		
    		    		
    		let requestJsonData = {
    			'dataSortName' : dataSortName,
    			'mainCategoryName' : mainCategoryNameArr,
    			'manufacturingCompany' : manufacturingCompany,
    			'repFoodName' : repFoodName
    		};
    		
    		console.log(requestJsonData);
    		let requestJsonDataString = JSON.stringify(requestJsonData);
			
    		$.ajax({
    			type: "POST",
    			url: "http://localhost:8080/foodSearch",
    			headers:{
					"Content-type":"application/json;charset:UTF-8"
				},
    			dataType: 'json',
    			data:requestJsonDataString,
    			success: function(result){
    				
    				let itemsPerPage = parseInt($('.page_num').val());
    				let currentPage = requestPage == "" || requestPage == null ? 1: requestPage;
    				let totalItems = result.length;
    				let totalPages = parseInt(Math.ceil(result.length/itemsPerPage));
    				let start = (currentPage - 1) * itemsPerPage;
    				let end = Math.min((start + itemsPerPage), totalItems);
    					
    				console.log(itemsPerPage);
    				console.log(currentPage);
    				console.log(totalItems);
    				console.log(totalPages);
    				console.log(start);
    				console.log(end);	    				
    				
    				let data = "";
    				
    				for(let i=start; i<end; i++){
    					
    					data += '<tr onclick="">';
    					data += '<td>' + (i+1) + '</td>';
    					data += '<td>' + result[i].foodName + '</td>';
    					data += '<td>' + result[i].mainCategoryName + '</td>';
    					data += '<td>' + result[i].midCategoryName + '</td>';
    					data += '<td>' + result[i].kcal + '</td>';
	                    data += '</tr>';
    				}
    				$('#foodList').html(data);
    				
    				let pageStart = Math.floor((currentPage-1)/10) * 10 + 1;
    				let pageEnd = Math.min((pageStart + 9), totalPages);    				
    				
    				let frontPage = currentPage < 11 ? 1 : pageStart - 10;
    				let backPage = Math.min((pageEnd + 1), totalPages);
    				
    				$('#at_front').html(
    					'<a href="javascript:foodListShow(' + frontPage + ')"> <img src="./images/sub/icon/at_front.svg" alt=""> </a>'
    				);
    				
    				$('#left').html(
        					'<a href="javascript:foodListShow(' + (currentPage-1) + ')"> <img src="./images/sub/icon/Icon akar-chevron-left-small.svg" alt=""> </a>'
        			);
    				    				
    				
    				data = "";
    				for(let i=pageStart; i<=pageEnd; i++) {
    					
    					if(i == currentPage) {
    						data += '<div class="number on" data-page="' + i + '"><a href="javascript:foodListShow(' + i + ')">' + i + '</a></div>';
    					} else {
    						data += '<div class="number" data-page="' + i + '"><a href="javascript:foodListShow(' + i + ')">' + i + '</a></div>';
    					}
    					  					
    				}
    				$('.page-numbers').html(data);  
    				
    				$('#right').html(
        					'<a href="javascript:foodListShow(' + (currentPage+1) + ')"> <img src="./images/sub/icon/Icon akar-chevron-right-small.svg" alt=""> </a>'
        			);    				
    				
    				$('#at_back').html(
        					'<a href="javascript:foodListShow(' + backPage + ')"> <img src="./images/sub/icon/at_back.svg" alt=""> </a>'
        			);
        		
    				
    			},
    			error: function(error){
    				
    			}
    		});			
    	}
    
    </script>
</body>
</html>