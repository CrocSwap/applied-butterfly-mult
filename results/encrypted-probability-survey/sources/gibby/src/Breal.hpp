// 5 Feb 2026, Koivisto et al. 

// Compile with g++ -Wall -O3 -ffast-math
// If used within a tight loop, also try out -funroll-loops
#ifndef BREAL_HPP
#define BREAL_HPP

#include <iostream>
#include <iomanip>
#include <cmath>

using u32 = uint32_t;
using i32 =  int32_t;
using u64 = uint64_t;
using i64 =  int64_t;

// Class Breal

const u32 Breal_min_a = 1;
const i32 Breal_min_b = - ((u32) 1 << 31);

class Breal { 
    public:
	u32 a = Breal_min_a; 
	i32 b = Breal_min_b; 
	
	void set_log(double z);
	void set(i64 z);
	void set(unsigned z){ set((i64)z); };
	void set(double z);
	double get_log();
	double get_double();
	long double get_ldouble();
	i64 get_lint();

	operator double() { return this->get_double(); }

	Breal& operator=(const int z)		{ set((i64) z); return *this; }
	Breal& operator=(const i64 z)	{ set(z); return *this; }
	Breal& operator=(const double z)	{ set(z); return *this; }

	/*inline Breal& operator+=(const Breal y){
		i64 d = b - y.b; if (d > 31) return *this;
		if (d >= 0){ a += (y.a >>  d); } 
		else if (-d > 31){ *this = y; return *this; } else { a = y.a + (a >> -d); b = y.b; }
		while (a & 0x80000000){ a >>= 4; b += 4; } return *this;
	}*/
	inline Breal& operator+=(const Breal y){
		i64 d = b - y.b;
		if ( d > 31 || y.a == 0){ return *this; }
		if (-d > 31 ||   a == 0){ *this = y; return *this; }
		if ( d >= 0){ a += (y.a >> d); } else { a = y.a + (a >> -d); b = y.b; }
		while (a & 0x80000000){ a >>= 1; b += 1; } return *this;
	}
	inline Breal& operator|=(const Breal y){ // Computes x := x + y by x |= y, assuming x > y. 
		i64 d = b - y.b; if (d > 31) return *this;
		a += (y.a >>  d); while (a & 0x80000000){ a >>= 8; b += 8; } return *this;
	}
	inline Breal& operator<<=(int n){ b += n; return *this; }
	inline Breal& operator>>=(int n){ b -= n; return *this; }
};

void Breal::set_log(double z){ // Assumes z is the natural log of the number to be represented.
	b = (int)(z * log2(exp(1.0))) - 30; a = (u32) exp(z - b * log(2.0));
	while (  a & 0x80000000 ) { a >>= 1; b++; }
	while (!(a & 0x40000000)) { a <<= 1; b--; }
}
void Breal::set(i64 z){
	if (z == 0){ a = 0; b = -(1L << 30); return; }	
	b = 0;
	while (  z & 0x80000000 ) { z >>= 1; b++; } // Truncates the low bits of z if needed.
	while (!(z & 0x40000000)) { z <<= 1; b--; }
	a= (u32)(z);
}
void Breal::set(double z){ if (z <= (double) 0.0){ set((i64) 0);} else set_log(log(z)); }
double Breal::get_log(){ return (double)(log(a) + b*log(2.0)); }
double Breal::get_double(){ return (double)(a * pow(2, b)); }
long double Breal::get_ldouble(){ return (long double)((long double)(a) * pow(2, (long double)(b))); }
i64 Breal::get_lint(){ i64 aL = a; if (b >= 0) return aL << b; return aL >> -b; }


/*inline Breal operator+(Breal x, Breal y){ // Could speed up this by 20 % using certain assumptions.
	int d = x.b - y.b; 
	if (d >= 0){ //if ( d > 31){ return x; } 
		x.a += (y.a >>  d); 
		if (x.a >> 31) return { x.a >> 1, x.b + 1 }; 
		return x;		 
	} 
	else       { //if (-d > 31){ return y; } 
		y.a += (x.a >> -d); 
		if (y.a >> 31) return { y.a >> 1, y.b + 1 };  
		return y;
	}
}*/
inline Breal operator+(Breal x, Breal y){ // Could speed up this by 20 % using certain assumptions.
	int d = x.b - y.b; 
	Breal z;
	if (d >= 0){ if ( d > 31){ return x; } z.a = x.a + (y.a >>  d); z.b = x.b; } 
	else       { if (-d > 31){ return y; } z.a = y.a + (x.a >> -d); z.b = y.b; }  
	if (z.a >> 31) return { z.a >> 1, z.b + 1 };  
	return z;	
}
inline Breal operator-(Breal x, Breal y){
	i32 d = x.b - y.b; Breal z;
	if (d >= 0){ if ( d > 31){ return x; } z.a = x.a - (y.a >>  d); z.b = x.b; } 
	else       { if (-d > 31){ return y; } z.a = (x.a >> -d) - y.a; z.b = y.b; }
	if (z.a == 0) return { Breal_min_a, Breal_min_b };
	while (!(z.a >> 30)){ z.a <<= 1; z.b -= 1; } return z;	
}
inline u32 operator^(Breal x, Breal y){ // Usage: "if (x ^ y) { then x is not close to y  }".
	int d = x.b - y.b;  u32 z; 
	if (d >= 0){ if ( d > 31){ return x.a; } z = x.a ^ (y.a >>  d); } 
	else       { if (-d > 31){ return y.a; } z = y.a ^ (x.a >> -d); }
	return z & 0xFFFFFF00; // Return the difference in the matched most significant 24 bits.	
}
inline u32 diff(u32 m, Breal x, Breal y){
	int d = x.b - y.b;  u32 z; 
	if (d >= 0){ if ( d > 31){ return x.a; } z = x.a ^ (y.a >>  d); } 
	else       { if (-d > 31){ return y.a; } z = y.a ^ (x.a >> -d); }
	return z & (((1 << m) - 1) << (31 - m)); // Return the difference in the matched most significant m bits.	
}
inline bool operator==(Breal x, Breal y){ // Usage: "if (x == y) { then x is equal to y  }".
	int d = x.b - y.b;  u32 z; 
	if (d >= 0){ if ( d > 31){ return (x.a == 0 && y.a == 0); } z = x.a ^ (y.a >>  d); } 
	else       { if (-d > 31){ return (y.a == 0 && x.a == 0); } z = y.a ^ (x.a >> -d); }
	return (z == 0); // Return true if no difference after matching the exponents.	
}
inline Breal operator*(Breal x, Breal y){
	u64 z = (u64) x.a * (u64) y.a;  int p = x.b + y.b;
	if (z & 0x4000000000000000){ z >>= 32; p += 32; } 
	else                       { z >>= 31; p += 31; }
	return { (u32) z, p };	
}

ostream& operator<<(ostream& os, Breal x){
	if (x.b >= 0){ os << x.a << "b+" << x.b; }
	else         { os << x.a << "b"  << x.b; }
	return os;
}
inline bool operator< (const Breal x, const Breal y){ return x.b < y.b || (x.b == y.b && x.a < y.a); }
inline bool operator> (const Breal x, const Breal y){ return   y < x;  }
inline bool operator<=(const Breal x, const Breal y){ return !(y < x); }
inline bool operator>=(const Breal x, const Breal y){ return !(x < y); }

inline Breal operator+(Breal x, i64 w){ Breal y; y = w; return x + y; }
inline Breal operator+(i64 w, Breal y){ Breal x; x = w; return x + y; }
inline Breal operator-(Breal x, i64 w){ Breal y; y = w; return x - y; }
inline Breal operator-(i64 w, Breal y){ Breal x; x = w; return x - y; }
inline Breal operator*(Breal x, i64 w){ Breal y; y = w; return x * y; }
inline Breal operator*(i64 w, Breal y){ Breal x; x = w; return x * y; }

inline bool operator< (const Breal x, const i64 w){ Breal y; y = w; return x <  y; }
inline bool operator< (const i64 w, const Breal y){ Breal x; x = w; return x <  y; }
inline bool operator> (const Breal x, const i64 w){ Breal y; y = w; return x >  y; }
inline bool operator> (const i64 w, const Breal y){ Breal x; x = w; return x >  y; }
inline bool operator<=(const Breal x, const i64 w){ Breal y; y = w; return x <= y; }
inline bool operator<=(const i64 w, const Breal y){ Breal x; x = w; return x <= y; }
inline bool operator>=(const Breal x, const i64 w){ Breal y; y = w; return x >= y; }
inline bool operator>=(const i64 w, const Breal y){ Breal x; x = w; return x >= y; }

inline Breal operator+(Breal x, double w){ Breal y; y = w; return x + y; }
inline Breal operator+(double w, Breal y){ Breal x; x = w; return x + y; }
inline Breal operator-(Breal x, double w){ Breal y; y = w; return x - y; }
inline Breal operator-(double w, Breal y){ Breal x; x = w; return x - y; }
inline Breal operator*(Breal x, double w){ Breal y; y = w; return x * y; }
inline Breal operator*(double w, Breal y){ Breal x; x = w; return x * y; }

inline bool operator< (const Breal x, const double w){ Breal y; y = w; return x <  y; }
inline bool operator< (const double w, const Breal y){ Breal x; x = w; return x <  y; }
inline bool operator> (const Breal x, const double w){ Breal y; y = w; return x >  y; }
inline bool operator> (const double w, const Breal y){ Breal x; x = w; return x >  y; }
inline bool operator<=(const Breal x, const double w){ Breal y; y = w; return x <= y; }
inline bool operator<=(const double w, const Breal y){ Breal x; x = w; return x <= y; }
inline bool operator>=(const Breal x, const double w){ Breal y; y = w; return x >= y; }
inline bool operator>=(const double w, const Breal y){ Breal x; x = w; return x >= y; }


const u64 B2real_min_a = 0;
const i64 B2real_min_b = - ((u64) 1 << 62);
 
// Class B2real
class B2real { 
    public:
	u64 a = B2real_min_a; 
	i64 b = B2real_min_b; 
	
	void		set_log (double z);
	void		set_logl(long double z);
	void		set(i64 z);
	void		set(unsigned z){ set((i64)z); };
	void		set(double z);
	void		set(long double z);
	double		get_log();
	double		get_double();
	long double	get_ldouble();
	i64			get_lint();

	operator double() { return this->get_double(); }

	B2real& operator=(const int z){ set((i64)z); return *this; }
	B2real& operator=(const i64 z){ set(z); return *this; }
	B2real& operator=(const double z){ set(z); return *this; }
	B2real& operator=(const long double z){ set(z); return *this; }
	
/*	inline B2real& operator+=(const B2real y){
		i64 d = b - y.b;
		if (d >= 0){ if ( d > 63){ return *this; } a += (y.a >> d); } 
		else       { if (-d > 63){ *this = y; return *this; } a = y.a + (a >> -d); b = y.b; }
		while (a & 0x8000000000000000){ a >>= 1; b += 1; } return *this;
	}*/
	inline B2real& operator+=(const B2real y){
		i64 d = b - y.b;
		if ( d > 63 || y.a == 0){ return *this; }
		if (-d > 63 ||   a == 0){ *this = y; return *this; }
		if ( d >= 0){ a += (y.a >> d); } else { a = y.a + (a >> -d); b = y.b; }
		while (a & 0x8000000000000000){ a >>= 1; b += 1; } return *this;
	}
	inline B2real& operator|=(const B2real y){
		i64 d = b - y.b; if (d > 63) return *this;
		if (d >= 0){ a += (y.a >> d); } 
		else if (-d > 63){ *this = y; return *this; } else { a = y.a + (a >> -d); b = y.b; }
		while (a & 0x8000000000000000){ a >>= 8; b += 8; } return *this;
	}	
	inline B2real& operator<<=(int n){ b += n; return *this; }
	inline B2real& operator>>=(int n){ b -= n; return *this; }
};

inline void B2real::set_log (double z)     { // Assumes z is the natural log of the number to be represented.
	if (z == -INFINITY){ a = B2real_min_a; b = B2real_min_b; return; }	
	b = (i64)(z * log2 (exp (1.0))) - 62; a = (i64) exp (z - ((double)b) * log (2.0));
	while   (a & 0x8000000000000000) { a >>= 1; b++; }
	while (!(a & 0x4000000000000000)){ a <<= 1; b--; }
}
inline void B2real::set_logl(long double z){ // Assumes z is the natural log of the number to be represented.
	if (z == -INFINITY){ a = B2real_min_a; b = B2real_min_b; return; }	
	b = (i64)(z * log2l(expl(1.0))) - 62; a = (i64) expl(z - b * logl(2.0));
	while   (a & 0x8000000000000000) { a >>= 1; b++; }
	while (!(a & 0x4000000000000000)){ a <<= 1; b--; }
}
inline void B2real::set(i64 z){
	if (z == 0){ a = 0; b = -(1LL << 62); return; }	
	b = 0;
	while (  z & 0x8000000000000000) { z >>= 1; b++; } // Truncates the low bits of z if needed.
	while (!(z & 0x4000000000000000)){ z <<= 1; b--; }
	a = (u64)(z);
}
inline void   B2real::set(double z)     { if (z <= (double) 0.0){ set((i64) 0);} else set_log (log (z)); }
inline void   B2real::set(long double z){ if (z <= (long double) 0.0){ set((i64) 0);} else set_logl(logl(z)); }
inline double B2real::get_log()         { if (b <= -(1LL << 62)) return -INFINITY; else return (double)(log(a) + b*log(2.0)); }
inline double B2real::get_double()      { if (b <= -(1LL << 62)) return 0.0; else return (double)(a * pow(2, b)); }
inline long double B2real::get_ldouble(){ if (b <= -(1LL << 62)) return 0.0; else return (long double)((long double)(a) * powl(2, (long double)(b))); }
inline i64 B2real::get_lint()      	    { i64 aL = a; if (b >= 0) return aL << b; return aL >> -b; }


inline B2real operator+(B2real x, B2real y){ // Could speed up this by 20 % using certain assumptions.
	i64 d = x.b - y.b; B2real z;
	if (d >= 0){ if ( d > 63){ return x; } z.a = x.a + (y.a >>  d); z.b = x.b; } 
	else       { if (-d > 63){ return y; } z.a = y.a + (x.a >> -d); z.b = y.b; }
	if (z.a >> 63){ z.a >>= 1; z.b += 1; } return z;	
}
inline B2real operator-(B2real x, B2real y){
	i64 d = x.b - y.b; B2real z;
	if (d >= 0){ if ( d > 63){ return x; } z.a = x.a - (y.a >>  d); z.b = x.b; } 
	else       { if (-d > 63){ return y; } z.a = (x.a >> -d) - y.a; z.b = y.b; }
	if (z.a == 0) return { B2real_min_a, B2real_min_b };
	while (!(z.a >> 62)){ z.a <<= 1; z.b -= 1; } return z;	
}
inline u64 operator^(B2real x, B2real y){ // Usage: "if (x ^ y) { then x is not close to y  }".
	i64 d = x.b - y.b;  u64 z; 
	if (d >= 0){ if ( d > 63){ return x.a; } z = x.a ^ (y.a >>  d); } 
	else       { if (-d > 63){ return y.a; } z = y.a ^ (x.a >> -d); }
	return z & 0xFFFFFF0000000000; // Return the difference in the matched most significant 24 bits.	
}
inline u64 diff(u64 m, B2real x, B2real y){
	int d = x.b - y.b;  u32 z; 
	if (d >= 0){ if ( d > 63){ return x.a; } z = x.a ^ (y.a >>  d); } 
	else       { if (-d > 63){ return y.a; } z = y.a ^ (x.a >> -d); }
	return z & (((1LL << m) - 1LL) << (63 - m)); // Return the difference in the matched most significant m bits.	
}
inline bool operator==(B2real x, B2real y){ // Usage: "if (x == y) { then x is equal to y  }".
	i64 d = x.b - y.b;  u64 z; 
	if (d >= 0){ if ( d > 63){ return (x.a == 0 && y.a == 0); } z = x.a ^ (y.a >>  d); } 
	else       { if (-d > 63){ return (y.a == 0 && x.a == 0); } z = y.a ^ (x.a >> -d); }
	return (z == 0); // Return true if no difference after matching the exponents.	
}
inline B2real operator*(B2real x, B2real y){ 
	u64 x0 = x.a & 0x7fffffff, y0 = y.a & 0x7fffffff; x.a >>= 31; y.a >>= 31; // Ignore the 31 lsb, 32 msb left.
	x0 *= y.a; y0 *= x.a; u64 z = x.a * y.a + (x0 >> 31) + (y0 >> 31); i64 p = x.b + y.b + 62;
	while (z & 0x8000000000000000){ z >>= 1; ++p; } return { z, p };	
}
ostream& operator<<(ostream& os, B2real x){
	if (x.b >= 0){ os << x.a; os << "B+" << x.b; }
	else         { os << x.a; os << "B"  << x.b; }
	return os;
}
inline bool operator< (const B2real x, const B2real y){ return x.b < y.b || (x.b == y.b && x.a < y.a); }
inline bool operator> (const B2real x, const B2real y){ return   y < x;  }
inline bool operator<=(const B2real x, const B2real y){ return !(y < x); }
inline bool operator>=(const B2real x, const B2real y){ return !(x < y); }

inline B2real operator+(B2real x, i64 w){ B2real y; y = w; return x + y; }
inline B2real operator+(i64 w, B2real y){ B2real x; x = w; return x + y; }
inline B2real operator-(B2real x, i64 w){ B2real y; y = w; return x - y; }
inline B2real operator-(i64 w, B2real y){ B2real x; x = w; return x - y; }
inline B2real operator*(B2real x, i64 w){ B2real y; y = w; return x * y; }
inline B2real operator*(i64 w, B2real y){ B2real x; x = w; return x * y; }

inline bool operator< (const B2real x, const i64 w){ B2real y; y = w; return x <  y; }
inline bool operator< (const i64 w, const B2real y){ B2real x; x = w; return x <  y; }
inline bool operator> (const B2real x, const i64 w){ B2real y; y = w; return x >  y; }
inline bool operator> (const i64 w, const B2real y){ B2real x; x = w; return x >  y; }
inline bool operator<=(const B2real x, const i64 w){ B2real y; y = w; return x <= y; }
inline bool operator<=(const i64 w, const B2real y){ B2real x; x = w; return x <= y; }
inline bool operator>=(const B2real x, const i64 w){ B2real y; y = w; return x >= y; }
inline bool operator>=(const i64 w, const B2real y){ B2real x; x = w; return x >= y; }
 
inline B2real operator+(B2real x, double w){ B2real y; y = w; return x + y; }
inline B2real operator+(double w, B2real y){ B2real x; x = w; return x + y; }
inline B2real operator-(B2real x, double w){ B2real y; y = w; return x - y; }
inline B2real operator-(double w, B2real y){ B2real x; x = w; return x - y; }
inline B2real operator*(B2real x, double w){ B2real y; y = w; return x * y; }
inline B2real operator*(double w, B2real y){ B2real x; x = w; return x * y; }

inline bool operator< (const B2real x, const double w){ B2real y; y = w; return x <  y; }
inline bool operator< (const double w, const B2real y){ B2real x; x = w; return x <  y; }
inline bool operator> (const B2real x, const double w){ B2real y; y = w; return x >  y; }
inline bool operator> (const double w, const B2real y){ B2real x; x = w; return x >  y; }
inline bool operator<=(const B2real x, const double w){ B2real y; y = w; return x <= y; }
inline bool operator<=(const double w, const B2real y){ B2real x; x = w; return x <= y; }
inline bool operator>=(const B2real x, const double w){ B2real y; y = w; return x >= y; }
inline bool operator>=(const double w, const B2real y){ B2real x; x = w; return x >= y; }

#endif
