/*
Roberto Alejandro Gutierrez Guillen
23/09/2019

Find the Prime Numbers less than Number sent
*/
#include <iostream>
#include <list> 

using namespace std; 

#define NUM 9
bool isPrime(int num, list <int> primeRes);

int main(){
    int num = NUM;
    list <int> primeRes;
    primeRes.push_front(7);
    primeRes.push_front(5);
    primeRes.push_front(3);
    primeRes.push_front(2);

    cout << isPrime(num, primeRes);

    return 0;
}

bool isPrime(int num, list <int> primeRes){
    if(primeRes.empty()){
        return true;
    }else{
         if((num % primeRes.front()) == 0){
            return false;
         }
         primeRes.pop_back();
         return isPrime(num, primeRes);
    }
}

/*


(define (isPrime? maxNum list);Recieves a list of primes smaller than the num
    (if (empty? (cdr list))
        #t;Good, exhausted all options of prime numbers
        (if (= (modulo maxNum (first list)) 0)
            #f
            (isPrime? maxNum (cdr list))
        )
    )
)
(define (primeNums num)
    (cond
        [(> 2 num) (printf "No prime numbers below this threshold")]
        [(= 2 num) '(2)]
        [(= 3 num) '(2 3)]
        [(< 2 num) 
            (let loop ([maxNum num] [i 3] [result '(2)])
                (if (< (sqrt maxNum) i)
                    (if (isPrime? maxNum result)
                        (loop maxNum (+ i 2) (append result i));True, add to list 
                        (loop maxNum (+ i 2) result);False, go to next number thats not pair
                    );true
                    result;false
                )
        )]
    )
)
*/