#include<bits/stdc++.h>
using namespace std;
//gour 2020831037

// Function to calculate Gauss Elimination method
vector<double> gaussElimination(vector<vector<double>> a, vector<double> b) {
    int n = a.size();
    for (int i = 0; i < n; i++) {
        for (int j = i + 1; j < n; j++) {
            double factor = a[j][i] / a[i][i];
            for (int k = i; k < n; k++) {
                a[j][k] -= factor * a[i][k];
            }
            b[j] -= factor * b[i];
        }
    }

  //here we are  finding out the a1,a2,a3 values
    vector<double> x(n); //coefficients gonna be sotred in this vector
    for (int i = n - 1; i >= 0; i--) {
        x[i] = b[i];
        for (int j = i + 1; j < n; j++) {
            x[i] -= a[i][j] * x[j];
        }
        x[i] /= a[i][i];
    }
    return x;
}

// Function to calculate velocity
double calculateVelocity(double t, const vector<double>& coeffs) {
    return coeffs[0]*t*t + coeffs[1]*t + coeffs[2];
}

int main() {
    vector<vector<double>> a = {{25, 5, 1}, {64, 8, 1}, {144, 12, 1}};
    vector<double> b = {106.8, 177.2, 279.2};

    vector<double> coeffs = gaussElimination(a, b); 

    cout << "The coefficients are: " << endl;
    cout << "a1 = "<< coeffs[0] << ", "<<"a2 = " << coeffs[1] << ", " <<"a3 =" << coeffs[2] << endl;

  //calculating velocity at 6th sec with this function
    double velocity = calculateVelocity(6, coeffs);

    cout << "The velocity at t=6th seconds is: " << velocity << " m/s" << endl;

    return 0;
}
