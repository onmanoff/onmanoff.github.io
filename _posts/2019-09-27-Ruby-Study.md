---
layout: post
title:  "Ruby"
date:   2019-09-27 16:06
categories: etc
---
1. 전역변수: $ 시작
1. 배열: []
1. 해시: {}
1. Method 
   - 선언: def 이름  end;
1. Class 
    - 선언: class 이름  end
    - 숫자도 클래스(Integer, Float)
    - 클래스 변수는 @로 시작
    - 초기화: def initialize 변수 end
    - private, exti;
1. proc
    - 선언:   toast = Proc.new do | parameter | {code} end
    - block: do ~ end 사이..
    - 호출: proc.call
    - 메소드 파라메터로 사용 함.
    - 블럭을 직접 기술: def eachEven(&wasABlock_nowAProc)
