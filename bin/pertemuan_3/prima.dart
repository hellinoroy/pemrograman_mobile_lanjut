void main(){
  for (int i= 0; i<= 201; i++){
    if (isPrime(i)){
      print("$i - Ryo Marchellino - 411221221");

    }
  }
}
 
bool isPrime(int n) {
  if (n < 2) return false;

  for (int i = 2; i <= n / 2; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}