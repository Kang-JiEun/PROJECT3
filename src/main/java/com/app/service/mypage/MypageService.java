package com.app.service.mypage;

import java.util.List;

import com.app.dto.mypage.TotalDiet;
import com.app.dto.mypage.TotalDietSearchCondition;

public interface MypageService {
	
	public List<TotalDiet> findTotalDietBySearchCondition(TotalDietSearchCondition totalDietSearchCondition);
	
	public List<TotalDiet> findTotalDietByAvg(TotalDietSearchCondition totalDietSearchCondition);
	
}
