package com.project.horror.common.search;

import lombok.*;

@Setter @Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class Search {

    private String type; // 검색 조건
    private String keyword; // 검색 키워드
}
