// Elkies--Kieffer arXiv:2505.22382, Section 6.3: base curve only.
// Run from the project root: magma -b scripts/export_theta_e4.m > period-export.log
// UNTESTED without Magma. This does not export the 65 isogenous neighbours.
// RiemannSurface gives numerical approximations, not certified period balls.
// The benchmark uses the exact rational matrix obtained by the rounding below.

A<x,y> := PolynomialRing(Rationals(), 2);
f := x^6 + (-6*y+1)*x^5
    + (-y^3+17*y^2-3*y-6)*x^4
    + (4*y^4-29*y^3-8*y^2+49*y-13)*x^3
    + (-7*y^5+29*y^4+30*y^3-78*y^2-6*y+12)*x^2
    + (4*y^6-2*y^5-65*y^4+93*y^3-8*y^2+5*y-5)*x
    + (-8*y^6+33*y^5-29*y^4-9*y^3+7*y^2-3*y+1);
X := RiemannSurface(f : Precision:=160);
tau := SmallPeriodMatrix(X);
assert Nrows(tau) eq 6 and Ncols(tau) eq 6;

// Explicitly check symmetry before symmetrizing the numerical approximation.
assert Max([Abs(tau[i,j]-tau[j,i]) : i,j in [1..6]]) lt 10^-100;
digits := 120;
scale := 10^digits;
text := Sprintf("THETA_E4_V1 6 %o\n", digits);
for i in [1..6] do
    for j in [i..6] do
        z := (tau[i,j]+tau[j,i])/2;
        text cat:= Sprintf("%o %o\n", Round(Real(z)*scale), Round(Imaginary(z)*scale));
    end for;
end for;
// Tagged stdout keeps Magma diagnostics separate from the machine input.
print "BEGIN_THETA_E4_EXPORT";
printf "%o", text;
print "END_THETA_E4_EXPORT";
print "Genus 6; 160 decimal working digits; rounded to 120 decimal places.";
print "Not a certified enclosure of the period matrix of the curve.";
quit;
