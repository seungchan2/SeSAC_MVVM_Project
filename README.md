# SeSAC_MVVM_Project

MVVM, URLSession 활용한 서버 통신 (Rx를 어디 녹일 지 고민해보기)  </br>
목표 : UI를 최소로 구현하고 기능 먼저 구현하기

1. DispatchQueue.main.async을 제대로 이해하고 쓰는가..
2. View Model ViewModel을 잘 지켰는가 ..
3. 테이블뷰, 텍스트뷰 구현을 할 때 View를 따로 만들지 않고 ViewController에서 만들어서 사용했는데 이게 맞는가 ..
4. 포스트 작성 후, 다시 메인으로 돌아오면 리로드가 되질 않음 -> GET으로 다른 사람들꺼 잘 찍히는데..
5. ViewModel 짜는 것을 조금 디테일하게 가져 가야할 듯
6. 폴더링의 방법 -> 지금은 View, Model, ViewModel로 나눠져 있는데 하나의 뷰컨마다 세 개를 다 넣어야 할 듯
7. 토큰의 저장.. UserDefaults를 써서 토큰을 저장했는데 옵셔널 에러가 뜸.. -> 토큰 값을 인섬니아에 찍어서 그냥 사용 중..
8. Then을 이용해서 UI를 구현하는데 반복되는 코드가 많음 -> Extension?
9. Rx를 녹일 수 있는 부분이 있는가..

-------------포스트 작성까지의 ---------------


