import random

def random_input(N):
	# outputs a random array of N complex numbers with real and imaginary part uniformly distributed in (-1, 1)
	nums = [(0, 0)] * N
	for i in range(len(nums)):
		nums[i] = (random.uniform(-1, 1), random.uniform(-1, 1))
	return nums

def complex_l1_dis(arr_1, arr_2):
	# returns the total and maximum "l1 distance" between the corresponding entries of two arrays of complex numbers
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

def complex_scale(a, b):
	(a_r, a_i) = a
	return (a_r * b, a_i * b)

def complex_product(a, b):
	(a_r, a_i) = a
	(b_r, b_i) = b
	return (a_r * b_r - a_i * b_i, a_r * b_i + a_i * b_r)

def complex_sum(a, b):
	(a_r, a_i) = a
	(b_r, b_i) = b
	return (a_r + b_r, a_i + b_i)

def complex_minus(a, b):
	(a_r, a_i) = a
	(b_r, b_i) = b
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