import 'package:flutter/material.dart'; 

showSnackBar(String title) {
  return SnackBar(
    backgroundColor: Colors.grey[850],
    content: Text(
      title,
      style: TextStyle(color: Colors.white60),
    ),
    action: SnackBarAction(
      textColor: Colors.white60,
      label: 'Đóng',
      onPressed: () { 
      },
    ),
  );
}


showLoading() {
  return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Color(0xffdeab49)),
        ),
      ));
}
showLoadingPage(bool show) {
  return Visibility(
    visible: show,
    child: Positioned( 
      child: Container(
          color: Colors.black38,
          padding: const EdgeInsets.all(20),
          child: Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Color(0xffdeab49)),
          )))),);
}
