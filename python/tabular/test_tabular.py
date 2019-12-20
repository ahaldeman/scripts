import unittest
from python.tabular.tabular import convert_to_table

from python.tabular.tabular import Format


class TabularTests(unittest.TestCase):

    def test_convert_to_table_csv(self):
        csv_string = "HEADER 1,HEADER 2\nCOLUMN 1,COLUMN 2\nCOLUMN 1,COLUMN 2"

        expected_table = \
            "_______________________\n" \
            "| HEADER 1 | HEADER 2 |\n" \
            "=======================\n" \
            "| COLUMN 1 | COLUMN 2 |\n" \
            "| COLUMN 1 | COLUMN 2 |\n" \
            "======================="

        self.assertEqual(expected_table, convert_to_table(csv_string, Format.CSV))

    def test_convert_to_table_tab(self):
        tab_string = "HEADER 1\tHEADER 2\nCOLUMN 1\tCOLUMN 2\nCOLUMN 1\tCOLUMN 2"

        expected_table = \
            "_______________________\n" \
            "| HEADER 1 | HEADER 2 |\n" \
            "=======================\n" \
            "| COLUMN 1 | COLUMN 2 |\n" \
            "| COLUMN 1 | COLUMN 2 |\n" \
            "======================="

        self.assertEqual(expected_table, convert_to_table(tab_string, Format.TAB))

    def test_convert_to_table_when_column_longer_than_header(self):
        string = "HEADER 1,HEADER 2\nCOLUMN 11,COLUMN 22\nCOLUMN 1,COLUMN 2"

        expected_table = \
            "_________________________\n" \
            "| HEADER 1  | HEADER 2  |\n" \
            "=========================\n" \
            "| COLUMN 11 | COLUMN 22 |\n" \
            "| COLUMN 1  | COLUMN 2  |\n" \
            "========================="

        self.assertEqual(expected_table, convert_to_table(string, Format.CSV))
