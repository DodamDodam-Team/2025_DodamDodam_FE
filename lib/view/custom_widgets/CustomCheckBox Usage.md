# CustomCheckBox
## Parameter
- bool value;
  - check 상태
    - check된 상태 -> true
    - check 해제된 상태 -> false
  
- ValueChanged<bool> onChanged;
  - check box 클릭으로 인해 상태가 변하였을 때 동작 지정

- double? iconSize;
  - check icon 크기 설정

- CheckBoxShape? shape;
  - enum CheckBoxShape { circle, rectangle }의 요소 중 하나로 지정
  - 기본값은 CheckBoxShape.circle
  - circle
    
      <img width="73" height="72" alt="check_mark_opacity30" src="https://github.com/user-attachments/assets/aeee5ea7-cd13-4972-b4c7-6eff71120fca" />
      <img width="73" height="72" alt="check_mark" src="https://github.com/user-attachments/assets/18c33f65-7593-4490-9c2b-2748b8fab256" />

    
  - square
    
    <img width="52" height="52" alt="check_mark_square_blank" src="https://github.com/user-attachments/assets/4df4fced-6758-40eb-bf0d-080eec231049" />
    <img width="64" height="65" alt="check_mark_square" src="https://github.com/user-attachments/assets/b80b286b-6dc0-45e3-b147-c1f758dc2e86" />

 

## Usage
``` dart
class MyApp extends statefulWidget{  
  bool _isChecked = false;

  //...//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 3),
                child: CustomCheckbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value;
                    });
                  },
                  iconSize: 18,
                ),
              ),

              Text(
                'CheckBox Example',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}

```
