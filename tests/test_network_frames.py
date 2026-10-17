import sys
import unittest
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'scripts'))
from network_frames import IDENTITY,UPSTREAM,TWO_LANE,SHEAR,P,W,address,forward,inverse


class NetworkFrameTests(unittest.TestCase):
    def test_full_linear_maps_against_dense_dft(self):
        for frame in [IDENTITY,UPSTREAM,TWO_LANE,SHEAR]:
            for j in range(16):
                x=[int(i==j) for i in range(16)]
                y=forward(x,frame)
                for i in range(16):
                    frequency=int(f'{i:04b}'[::-1],2)
                    self.assertEqual(y[address(frame,i)],pow(W,j*frequency,P))
                self.assertEqual(inverse(y,frame),x)

    def test_entire_bilinear_cyclic_convolution(self):
        for frame in [IDENTITY,UPSTREAM,TWO_LANE,SHEAR]:
            for i in range(16):
                for j in range(16):
                    a=forward([int(k==i) for k in range(16)],frame)
                    b=forward([int(k==j) for k in range(16)],frame)
                    product=inverse([u*v%P for u,v in zip(a,b)],frame)
                    self.assertEqual(product,[int(k==(i+j)%16) for k in range(16)])

    def test_dropping_basis_change_is_not_valid(self):
        # C_v = I + 2 X_v. Under this shear, e_1 is sent to e_0 + e_1.
        x=[int(i==0) for i in range(16)]
        gate=lambda v:[(x[k]+2*x[k^v])%P for k in range(16)]
        self.assertNotEqual(gate(2),gate(address(SHEAR,2)))


if __name__=='__main__':unittest.main()
