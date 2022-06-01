import unittest
from src.fdt.utils import my_first_lib_method


class FirstTest(unittest.TestCase):

    def setUp(self):
        super().setUp()
        print('Setup tests')

    def test_first_test_case(self):
        print('Transformation test')
        res = my_first_lib_method()
        self.assertEqual(res, "my_first_lib_method")

    def test_second_test_case(self):
        print('Transformation test')
        res = my_first_lib_method()
        self.assertEqual(res, "my_first_lib_method1")
