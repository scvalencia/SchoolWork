public double getPayAmount() 
{
    if (isDead)
  {
    return deadAmount();
  }
  else if (isSeparated)
    {
      return  separatedAmount();
    }
  else if (isRetired)
    {
        return retiredAmount();
    }
  else
  {
	  return normalPayAmount;
  }
  
}