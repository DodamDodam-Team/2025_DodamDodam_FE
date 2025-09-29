# CustomBottomNavigationBar
## Parameter
- List<CustomNavigationItem> items
  - navigation bar에 표시되는 아이템들의 리스트로 아이템은 CustomNavigationItem로 구성 
  
- void Function(int index) onTapItem
  - item이 클릭됐을 때 수행될 함수 지정
  - 클릭된 item의 inde 사용 가능

- int selectedIndex
  - 현재 선택된 item의 index
  - 이를 통해 페이지 표시 + navigation item 변화
 

## CustomNavigationItem
- CustomNavigationBar를 위한 Item class

- Svg 형태의 icon, String의 label, labelStyle을 입력 받음

- Widget notSelectedItem(GestureTapCallback onTap)
  - item이 선택되지 않았을 떄의 위젯 반환해 주는 함수
  - onTap을 통해 클릭 콜백 함수를 받아 클릭 시 이벤트 지정
 
- Widget selectedItem(GestureTapCallback onTap)
  - item이 선택되었을 때의 위젯을 반환해 주는 함수
  - onTap을 통해 클릭 콜백 함수를 받아 클릭시 이벤트 지정
 

## Usage
``` dart
class MyApp extends statefulWidget{
  //...//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        items: [
          CustomNavigationItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 26,
              height: 26,
            ),
            label: '홈',
          ),

          //...//
        ],
        selectedIndex: _index,
        onTapItem: onTapBottomNavigation,
      ),
    );
  }
}

```
