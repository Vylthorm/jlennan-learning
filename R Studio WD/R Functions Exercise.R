#example 1
hello_you <- function(name){
  print(paste('Hello',name))
}



hello_you('Sam')

#example 2
hello_you2 <- function(name){
  return(paste('Hello',name))
}

print(hello_you2('Sam'))


#1
prod = function(num1,num2){
  return(num1*num2)
}

prod(3,4)


#2

num_check = function(int,vec){
  for (num in vec){
    if (num == int){
      return(TRUE)
    }
  }
  return(FALSE)
}



num_check(2,c(1,2,3))


num_check(2,c(1,4,5))


#3
num_count <- function(num,v){
  count = 0
  for (x in v){
    if (x == num){
      count = count + 1
    }
  }
  return(count)
}



num_count(2,c(1,1,2,2,3,3))


num_count(1,c(1,1,2,2,3,1,4,5,5,2,2,1,3))

#4
bar_count = function(int){
  small = int%%5
  no_remainder = int - small
  big = no_remainder/5
  return(small+big)  
}

bar_count(17)

bar_count(6)
#teacher solution
bar_count <- function(pack){
  amount_of_ones = pack %% 5
  amount_of_fives = (pack - amount_of_ones)/5
  return(amount_of_ones+amount_of_fives)
}

#5 - fixed attempt - needed to change variable w/ append
summer = function(int1,int2,int3){
  running = c(int1,int2,int3)
  total = c()
  for (num in running){
    if (num%%3 == 0)
      total = append(0,total)
    else
      total = append(num,total)
  }
  sum(total)
}

summer(7,2,3)
summer(3,6,9)
summer(9,11,12)

#teacher solution


summer <- function(a, b, c){
  out <- c(0)
  if (a %% 3 != 0){
    out <- append(a,out)
  }
  if (b %% 3 != 0){
    out <- append(b,out)
  }
  if (c %% 3 != 0){
    out <- append(c,out)
  }
  return(sum(out))       
}

#6 - teacher solution
prime_check <- function(num) {
  if (num == 2) {
    return(TRUE)
  } else if (any(num %% 2:(num-1) == 0)) {
    return(FALSE)
  } else { 
    return(TRUE)
  }
}


