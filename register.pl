#/usr/bin/env perl

#use strict;
#use warnings;
use Scalar::Util qw(looks_like_number);

$a = 0;
$b = 1;
$d = '$';

while ($a < 1){
  print ("Enter pay or item price: ");
  $input = <STDIN>;
  chomp $input; 

  if(looks_like_number $input){
    $subtotal += $input;
  }elsif ($input eq "exit") {
    $a = 1;
    $b = 1;
    print("\n");
  }elsif ($input eq "pay"){
    $b = 0;
    print("Proceeding to payment\n\n");
    sleep(1);
  }else {
    printf("Invalid Input\n");
    sleep(1);
  }

  while($b < 1){
    $taxrate = 1.06;
    $total = $subtotal * $taxrate;
    printf("Subtotal comes to: $d%.2f\n", $subtotal);
    printf("Total comes to: $d%.2f\n", $total);
    print("Enter ring or amount tendered: ");
    $input = <STDIN>;
    chomp $input;
   
    if(looks_like_number $input){
      if($input >= $total){
        $input -= $total;
        $subtotal = 0;
        printf("Your change is: $d%.2f\n", $input);
        $b = 1;
        sleep(2);
        print("Proceeding to checkout\n\n");
        sleep(1);
      }else{
        print("Insufficient Funds!\n");
        sleep(1);
      }
    }elsif($input eq "exit"){
      $a = 1;
      $b = 1;
      print("\n");
    }elsif($input eq "ring"){
      $b = 1;
      $subtotal = 0;
      print("Proceeding to checkout\n\n");
      sleep(1);
    }else{
      print("Invalid Input\n");
      sleep(1);
    }

  }


}


