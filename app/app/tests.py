"""
Sample tests
"""

from django.test import SimpleTestCase

from . import calc


class CalcTests(SimpleTestCase):
  """
  Test the calc module
  """

  def test_add_numbers(self):
    """
    Test adding two numbers
    """
    res = calc.add(5, 6)

    self.assertEqual(res, 11)
