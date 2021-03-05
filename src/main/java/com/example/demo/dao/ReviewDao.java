package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.ReviewDto;
import com.example.demo.vo.Review;

@Mapper
public interface ReviewDao {

	int getTotalCountByCondition(Map<String, Object> condition);
	List<ReviewDto> getReviewsByCondition(Map<String, Object> condition);
	
	Review getReviewByNo(int reviewNo);
	void insertReview(Review review);	// 관리자가 insert 기능이 필요한가 음... 관리자한테도 USER 권한이 있긴 한데... 고민 & 확인 필요
	void updateReview(Review review);	// 삭제된 리뷰를 보관해야 하므로 Y를 N으로 바꿀 것임
}
