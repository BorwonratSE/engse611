#include <iostream>
#include <string>
#include <thread>
#include <chrono>

using namespace  std;

int main ()
{
    float n, m, n1, m1;
    cout << "Insert Number" << endl;
    cin >> n;
    cout << "Insert Number" << endl;
    cin >> m;
    cout << "///////-//////" << endl;
    cout << "Result Number" << endl;
    float k;
    k = n/m;
    cout << k << endl;
    cout << "/////-/////" << endl;

    cout << "Insert Number" << endl;
    cin >> n1;
    cout << "Insert Number" << endl;
    cin >> m1;
    cout << "/////-/////" << endl;
    cout << "Result Number" << endl;
    float k1;
    k1 = n1+m1;
    cout << k1 << endl;
    cout << "/////-/////" << endl;
    cout << "Result All Number" << endl;
    float km;
    km = k+k1;
    cout << km << endl;

    
   if (km > 2000){
    float n3,m3;
    cout << "//////////" << endl;
    cout << "More" << endl;
    cout << "Insert" << endl;
    cin >> n3;
    cout << "Insert" << endl;
    cin >> m3;
    float k3;
    k3 = n3*m3;
    cout << "result number" << endl << k3 << endl;


   }else{
    int num,sum;
    num = 0;
    while (num <= 99)
    {
       num = num+1;
    this_thread::sleep_for(chrono::seconds(1));
    cout << num << " Sorry " << endl;
    
    
    };
    
    cout << "Done" << endl;

   

     return 0;

   };

};