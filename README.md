# Guide Line
### Setup Flutter Environment
Các lỗi thường gặp
1. 'cmdline-tools component is missing run `path/to/sdkmanager --install "cmdline-tools;latest" .......'<br>
   > Solution : chạy lệnh ' sdkmanager --install "cmdline-tools;latest" '. Nếu chạy báo lỗi không tìm tháy sdkmanager, cài đặt biến môi trường cho sdkmanager.


### Opening Project
1. Run ' git clone https://github.com/linhtnl/spa_booking.git  '
2. Sau khi clone về, mở lên bằng Android Studio thì **UPDATE DEPENDENCIES**.

### RULES
1. Khi bắt đầu làm 1 module/function, lên trang jira add tên function/module vào.
https://spabooking.atlassian.net/jira/software/projects/SPAB/boards/1
  
<img width="781" alt="create" src="https://user-images.githubusercontent.com/77654085/133294951-90b43edc-8f6a-4ffd-8b92-8c8a0c739079.png">
<img width="692" alt="creating" src="https://user-images.githubusercontent.com/77654085/133295273-2d7e1575-3630-4a00-85b8-9c3e2d8f65d6.png">
<img width="415" alt="done" src="https://user-images.githubusercontent.com/77654085/133295475-795adc7e-6844-4faf-8173-81ae9e72392a.png">

2. Lấy id để tạo branch và code. 


## About Flutter 
1. File pubspec.yaml chứa các version/ font/ images /... của project
2. Adding 1 images tương thích cho cả android/ios/tablet./.. bằng cách
> 1. Tải image cần sử dụng về
> 2. Lên trang appicon.co và bỏ hình vào, chọn flatform để generate
> 3. Sau khi generate, đối với **ANDROID** , vào android/app/src/main/res, replace/expand các files
> 4. Đối với **IOS**, ios/Runner/Asets.xcassets
> 5. Có thể resize/edit image bằng cách, ở android/app/src/main/res, click chuột phải chọn New -> Image Asset







