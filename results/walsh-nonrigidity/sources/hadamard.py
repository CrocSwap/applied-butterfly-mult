import random

def random_input(N):
	# outputs a random array of N complex numbers
	nums = [(0, 0)] * N
	for i in range(len(nums)):
		nums[i] = (random.uniform(-1, 1), random.uniform(-1, 1))
	return nums

def complex_scale(a, b):
	global p2_ops_count
	(a_r, a_i) = a
	# all calls to this method have 'b' as a real power of 2, so we increment our p2_ops_count by 2 if 'b' is not 1, which is free
	if not (b == 1):
		p2_ops_count += 2
	return (a_r * b, a_i * b)

def complex_sum(a, b):
	global general_ops_count
	(a_r, a_i) = a
	(b_r, b_i) = b
	general_ops_count += 2
	return (a_r + b_r, a_i + b_i)

def complex_minus(a, b):
	global general_ops_count
	(a_r, a_i) = a
	(b_r, b_i) = b
	general_ops_count += 2
	return (a_r - b_r, a_i - b_i)

def arr_sum(a, b):
	# computes the entry wise sum of arrays a and b, not in place
	if not (len(a) == len(b)):
		print("mismatched arr lengths")
		return -1
	c = [(0, 0)] * len(a)
	for i in range(len(a)):
		c[i] = complex_sum(a[i], b[i])
	return c

def arr_minus(a, b):
	# computes the entry wise subtraction of a - b, not in place
	if not (len(a) == len(b)):
		print("mismatched arr lengths")
		return -1
	c = [(0, 0)] * len(a)
	for i in range(len(a)):
		c[i] = complex_minus(a[i], b[i])
	return c


def arr_scale(a, scale):
	# scales the entries of array 'a' by 'scale', in place
	for i in range(len(a)):
		a[i] = complex_scale(a[i], scale)
	return a

def complex_l1_dis(arr_1, arr_2):
	# returns the total and maximum l1 distance between the corresponding entries of two arrays of complex numbers
	tot_dis = 0
	max_dis = 0
	if not (len(arr_1) == len(arr_2)):
		return (-1, -1)
	for i in range(len(arr_1)):
		(a_1, b_1) = arr_1[i]
		(a_2, b_2) = arr_2[i]

		pair_dis = abs(a_1 - a_2) + abs(b_1 - b_2)

		tot_dis += pair_dis
		max_dis = max(pair_dis, max_dis)

	return (tot_dis, max_dis)

def naive_hadamard(nums):
	if len(nums) == 1:
		return nums
	elif len(nums) == 2:
		temp = nums[0]
		nums[0] = complex_sum(temp, nums[1])
		nums[1] = complex_minus(temp, nums[1])
		return nums

	half = len(nums) // 2
	left = naive_hadamard(nums[0 : half])
	right = naive_hadamard(nums[half : len(nums)])

	for i in range(half):
		nums[i] = complex_sum(left[i], right[i])
		nums[i + half] = complex_minus(left[i], right[i])

	return nums

def fast_WHT(nums, scale):
	if len(nums) <= 4:
		return arr_scale(naive_hadamard(nums), 2 ** scale)

	step = len(nums) // 8

	a = fast_WHT(nums[0 : step], scale)
	b = fast_WHT(nums[step * 1 : step * 2], scale + 1)
	c = fast_WHT(nums[step * 2 : step * 3], scale + 1)
	d = fast_WHT(nums[step * 3 : step * 4], scale + 1)
	e = fast_WHT(nums[step * 4 : step * 5], scale + 1)
	f = fast_WHT(nums[step * 5 : step * 6], scale + 1)
	g = fast_WHT(nums[step * 6 : step * 7], scale + 1)
	h = fast_WHT(nums[step * 7 : step * 8], scale + 1)

	B_1 = arr_sum(b, c)
	B_2 = arr_sum(d, h)
	B_3 = arr_sum(f, g)

	tot = arr_sum(arr_sum(arr_sum(B_1, B_2), B_3), e)
	tot = arr_scale(tot, 0.5)

	diff = arr_minus(a, tot)

	D = arr_sum(diff, d)
	E = arr_sum(diff, e)
	H = arr_sum(diff, h)

	y_1 = arr_sum(a, tot)
	y_2 = arr_sum(arr_sum(E, c), g)
	y_3 = arr_sum(arr_sum(E, b), f)
	y_4 = arr_sum(E, B_2)
	y_5 = arr_sum(D, B_1)
	y_6 = arr_sum(arr_sum(H, c), f)
	y_7 = arr_sum(arr_sum(H, b), g)
	y_8 = arr_sum(D, B_3)

	return y_1 + y_2 + y_3 + y_4 + y_5 + y_6 + y_7 + y_8

if __name__ == "__main__":
	global N
	global general_ops_count
	global p2_ops_count

	N = 2097152

	hadamard_input = random_input(N)
	fast_input = hadamard_input.copy()

	general_ops_count = 0
	p2_ops_count = 0
	hadamard_output = naive_hadamard(hadamard_input)
	print(p2_ops_count, general_ops_count)

	general_ops_count = 0
	p2_ops_count = 0
	fast_output = fast_WHT(fast_input, 0)
	print(p2_ops_count, general_ops_count)

	(tot_dis, max_dis) = complex_l1_dis(hadamard_output, fast_output)

	print("distance between outputs: " + str(tot_dis))
	print("max distance on an index: " + str(max_dis))
