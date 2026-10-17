//
// 1 Nov 2024, Mikko Koivisto 
//
// Class HashCounter (Hash Counter) implements a hashmap that maintains the following statistics:
// - the count of each key: the number if times the key has been inserted
// - the frequency of each count: the number of different keys that have equal counts
// - maximum count: the largest count over all keys
//
// Example:
//	Consider a sequence of 12 insertions is a, b, a, c, c, b, a, a, d, a, d, b.
//	The counts per key are a:5, b:3, c:2, d:2. The maximum count is 5.
//	The frequences per count are 1:0, 2:2, 3:1, 4:0, 5:1, and c:0 for all c > 5.
//
// Notes:
//	- Supports only insertions and quering of the frequencies and the maximum count.

#ifndef HashCounter_HPP
#define HashCounter_HPP

#include <vector>

using i32 =  int32_t;
using u32 = uint32_t;
using u64 = uint64_t;

using Tkey = u64;
using Tptr = u32;
using Tnum = i32;
using std::max;

typedef std::vector<int>	vint;
typedef std::vector<Tptr>	vptr;

struct Keycount { Tkey key; Tnum num; Tptr nxt; };

typedef std::vector<Keycount>	vkco;

class HashCounter {
	public:    
		void	insert	(const Tkey k)	{ insert(k, hash(k)); }
		Tptr	hash	(Tkey k)		{ 
			//             1111222233334444        1111222233334444
			const Tkey f = 0x1b67fd2e0fe211, g = 0x3e491fe7720da4f3;
			return (f * k + g) >> (64 - L);
			//Tptr p = k & M; k >>= L; p ^= k & M; k >>= L; return (p ^ k) & M; 
		} 
		int		maxcount()				{ for (int i = 1; i < nex; i++){ int c = b[i].num; fre[c]++; mac = max(mac, c); } return mac; }
		int		freq	(int c)			{ return fre[c]; }
		
		void	insert	(const Tkey k,  const Tptr p){
			Tptr q = a[p];
			while (q) {
				Keycount x = b[q]; 
				if (x.key == k){ ++b[q].num; return; } 
				q = x.nxt;
			}
			b[nex] = { k, 1, a[p] }; a[p] = nex++; // Not found. Becomes the *head*.
		}
		
		HashCounter (int m){ 
			L = 1; while ((1L << L) < m) ++L; if (L < 11) L += 2; if (L < 15) L += 1; M = (1L << L) - 1;
			a.resize(M+1); b.reserve(m+1); fre.resize(m+1); 
			nex = 1; mac = 0;
		} 
		~HashCounter(){ }
    private:
    	uint8_t	L;		
    	u32		M;
		vptr	a;	
		vkco	b;	
		int		nex;	// The count of *unique* keys + 1; also the index of the next free slot in buck.		
		int		mac;	// Max count. 
		vint	fre;	// The essential output.
};


#endif
