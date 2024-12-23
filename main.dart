import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  // 1. 사용자에게 어떤 타입을 낼 것인지 물어보는 질문 창

  print('가위, 바위, 보 중 하나를 정하여 입력해주세요 : ');
  final String userInput = stdin.readLineSync(encoding: utf8) ?? 'Error';
  // ?? => Null값 입력 시 출력

  // 2. 컴퓨터가 무엇을 낼지 결정하는 함수
  const selectList = ['가위', '바위', '보'];
  final cpuInput = selectList[Random().nextInt(3)];

  // 3. 사용자와 컴퓨터간의 가위바위보 결과를 계산할 함수

  print('CPU가 $cpuInput를 냈습니다.');


  String result = getResult(userInput, cpuInput);
  print(result);
}

String getResult(String userInput, String cpuInput) {
  const userWin = 'Player가 승리하였습니다.';
  const cpuWin = 'CPU가 승리하였습니다.';
  const draw = '비겼습니다.';

  String result = draw;

  switch (userInput) {  // 사용자 입력에 대한 결과 검증
    case '가위':
      if (cpuInput == '바위') {
        result = cpuWin;
      } else if (cpuInput == '보') {
        result = userWin;
      } else {
        result = draw;
      }
    case '바위':
      if (cpuInput == '보') {
        result = cpuWin;
      } else if (cpuInput == '가위') {
        result = userWin;
      } else {
        result = draw;
      }
    case '보':
      if (cpuInput == '가위') {
        result = cpuWin;
      } else if (cpuInput == '바위') {
        result = userWin;
      } else {
        result = draw;
      }
    default : // 입력값이 위의 케이스 중 없을 경우
      result = '올바른 값을 입력해주세요.';
  }
  return result;
}
