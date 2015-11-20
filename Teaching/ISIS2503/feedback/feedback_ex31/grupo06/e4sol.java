/**
* Método que devuelve la cantidad a pagar a un cliente
* @return la cantidad que se debe pagar al cliente
*/
public double getPayAmount(){
  if(!isDead){
    if(!isSeparated){
      if(isRetired){
        return retiredAmount();
      }
      return normalPayAmount
    }
    return separatedAmount();
  }
  return deadAmount()
}
